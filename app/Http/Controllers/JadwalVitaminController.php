<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Carbon\Carbon;
use DB;
use Auth;
use Session;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\DataJadwalVitaminExport;
use App\Models\User;
class JadwalVitaminController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $data = [];
        if(count($request->all()) > 0)
        {
            $get = DB::table('posyandu_jadwal as pj');
            $get->join('posyandu as pos','pos.id','=','pj.posyandu_id');
            $get->join('bidan as bd','bd.id','=','pj.bidan_id');
            $get->where('pj.jenis','vitamin');
            if($request->bidan_id != null)
            {   
                $get->where('pj.bidan_id',$request->bidan_id);
            }
            if($request->pos_id != null)
            {   
                $get->where('pj.posyandu_id',$request->pos_id);
            }
            if($request->tanggal != null)
            {
                $start = explode('-', $request->tanggal);
                $get->whereMonth('pj.tanggal','=',$start[1]);
                $get->whereYear('pj.tanggal','=',$start[0]);
            }
            $get->select('pj.*','pos.nama_pos as posyandu_name','bd.nama as bidan_name');
            $get->orderBy('pj.tanggal','DESC');
            $data = $get->get();
        }
        if(Auth::user()->role == 'bidan')
        {
            $userId = Auth::user()->id;
            $bidanAuth = DB::table('bidan')->where('user_id',$userId)->first();
            $posyandu = DB::table('posyandu as pd')
                    ->join('posyandu_bidan as pb','pb.posyandu_id','=','pd.id')
                    ->where('pb.bidan_id',$bidanAuth->id)
                    ->select('pd.*')
                    ->groupBy('pd.id')
                    ->get();
            $bidan = DB::table('bidan')->where('user_id',$userId)->get();
        }else
        {
            $bidan = DB::table('bidan')->get();
            $posyandu = [];
            if($request->bidan_id != null)
            {
                $posyandu = DB::table('posyandu as pd')
                            ->join('posyandu_bidan as pb','pb.posyandu_id','=','pd.id')
                            ->where('pb.bidan_id',$request->bidan_id)
                            ->select('pd.id','pd.nama_pos')
                            ->groupBy('pb.posyandu_id')
                            ->get();
            }
        }
        Session::put('dataJadwalVitamin',$data);
        return view('dashboard.posyandu.jadwal.vitamin.index',compact('data','request','bidan','posyandu'));
    }

    public function exportExcel()
    {
        $user = Auth::user();
        $role = $user->role;
        $data = DB::table($role)->where('user_id',$user->id)->first();
        $arr['name'] = $data->nama;
$arr['id'] = $data->user_id;
        $arr['type'] = 'jadwal_vitamin';
        $arr['action'] = 'Telah berhasil meng-export data';
        return Excel::download(new DataJadwalVitaminExport, 'data_jadwal_vitamin.xlsx');
    }

     public function create()
    {
        $userId = Auth::user()->id;
        $bidan = DB::table('bidan')->where('user_id',$userId)->first();
        $posyandu = DB::table('posyandu as pd')
                            ->join('posyandu_bidan as pb','pb.posyandu_id','=','pd.id')
                            ->where('pb.bidan_id',$bidan->id)
                            ->select('pd.id','pd.nama_pos')
                            ->groupBy('pb.posyandu_id')
                            ->get();
        $bidan = DB::table('bidan')->where('user_id',$userId)->get();
        return view('dashboard.posyandu.jadwal.vitamin.add',compact('bidan','posyandu'));
    }

    public function store(Request $request)
    {
        $createdAt = Carbon::now('Asia/Jakarta')->format('Y-m-d H:i:s');
        DB::table('posyandu_jadwal')->insert([
            'posyandu_id'=>$request->posyandu_id,
            'bidan_id'=>$request->bidan_id,
            'jenis'=>'vitamin',
            'vitamin'=>$request->vitamin,
            'tanggal'=>$request->tanggal,
            'created_at'=>$createdAt
        ]);

        //Log User
        $user = Auth::user();
        $role = $user->role;
        $data = DB::table($role)->where('user_id',$user->id)->first();
        $arr['name'] = $data->nama;
$arr['id'] = $data->user_id;
        $arr['type'] = 'jadwal_vitamin';
        $arr['action'] = 'Telah berhasil membuat data jadwal vitamin '.$request->tanggal.'';
        User::logInsert($arr);
        return redirect('data/jadwal/vitamin')->with('success','Berhasil menambahakan data Jadwal Vitamin');
    }

    public function edit($id)
    {
       $data = DB::table('posyandu_jadwal as pj')
                ->join('posyandu as pos','pos.id','=','pj.posyandu_id')
                ->join('bidan as bd','bd.id','=','pj.bidan_id')
                ->where('pj.jenis','vitamin')
                ->where('pj.id',$id)
                ->select('pj.*','pos.nama_pos as posyandu_name','bd.nama as bidan_name')
                ->first();
        if(!$data)
        {
            return redirect('data/jadwal/vitamin')->with('error','Tidak dapat menemukan data Pos');
        }
        if(Auth::user()->role == 'bidan')
        {
            $userId = Auth::user()->id;
            $bidanAuth = DB::table('bidan')->where('user_id',$userId)->first();
            $posyandu = DB::table('posyandu as pd')
                    ->join('posyandu_bidan as pb','pb.posyandu_id','=','pd.id')
                    ->where('pb.bidan_id',$bidanAuth->id)
                    ->select('pd.*')
                    ->groupBy('pd.id')
                    ->get();
            $bidan = DB::table('bidan')->where('user_id',$userId)->get();
        }else
        {
            $bidan = DB::table('bidan')->get();
            $posyandu = DB::table('posyandu as pd')
                            ->join('posyandu_bidan as pb','pb.posyandu_id','=','pd.id')
                            ->where('pb.bidan_id',$data->bidan_id)
                            ->select('pd.id','pd.nama_pos')
                            ->groupBy('pb.posyandu_id')
                            ->get();
        }
        return view('dashboard.posyandu.jadwal.vitamin.edit',compact('data','bidan','posyandu'));
    }
    public function update(Request $request,$id)
    {
        $createdAt = Carbon::now('Asia/Jakarta')->format('Y-m-d H:i:s');
        DB::table('posyandu_jadwal')->where('id',$id)->update([
            'posyandu_id'=>$request->posyandu_id,
            'bidan_id'=>$request->bidan_id,
            'jenis'=>'vitamin',
            'vitamin'=>$request->vitamin,
            'tanggal'=>$request->tanggal,
            'updated_at'=>$createdAt
        ]);

        //Log User
        $user = Auth::user();
        $role = $user->role;
        $data = DB::table($role)->where('user_id',$user->id)->first();
        $arr['name'] = $data->nama;
$arr['id'] = $data->user_id;
        $arr['type'] = 'jadwal_vitamin';
        $arr['action'] = 'Telah berhasil mengubah data jadwal vitamin '.$request->tanggal.'';
        User::logInsert($arr);
        return redirect('data/jadwal/vitamin')->with('success','Berhasil mengubah data Jadwal Vitamin');
    }

    public function delete($id)
    {
        $data = DB::table('posyandu_jadwal')->where('id',$id)->first();
        if($data)
        {
            //Log User
            $user = Auth::user();
            $role = $user->role;
            $dataRole = DB::table($role)->where('user_id',$user->id)->first();
            $arr['name'] = $dataRole->nama;
$arr['id'] = $dataRole->user_id;
            $arr['type'] = 'jadwal_vitamin';
            $arr['action'] = 'Telah berhasil mengahpus data jadwal vitamin '.$data->tanggal.'';
            User::logInsert($arr);
            DB::table('posyandu_jadwal')->where('id',$id)->delete();
            return redirect('data/jadwal/vitamin')->with('success','Berhasil menghapus data Jadwal Vitamin');
        }else{
            return redirect('ddata/jadwal/vitamin')->with('error','Tidak dapat menemukan data Jadwal Vitamin');
        }
    }
}
