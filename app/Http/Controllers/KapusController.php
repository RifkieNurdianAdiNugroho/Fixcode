<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Carbon\Carbon;
use DB;
use Auth;
use Session;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\DataKapusExport;
use App\Models\User;
class KapusController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $data = DB::table('kapus as kp')
                ->join('users as us','us.id','=','kp.user_id')
                ->select('kp.*','us.email','us.kode')
                ->get();
        Session::put('dataKapus',$data);
        return view('dashboard.kapus.index',compact('data'));
    }

    public function exportExcel()
    {
        $user = Auth::user();
        $role = $user->role;
        $data = DB::table($role)->where('user_id',$user->id)->first();
        $arr['name'] = $data->nama;
$arr['id'] = $data->user_id;
        $arr['type'] = 'kapus';
        $arr['action'] = 'Telah berhasil meng-export data';
        User::logInsert($arr);

        return Excel::download(new DataKapusExport, 'data_kapus.xlsx');
    }

    public function create()
    {
        return view('dashboard.kapus.add');
    }

    public function store(Request $request)
    {
        $check = DB::table('users')->where('email',$request->email_aktif)->first();
        if($check)
        {
            return redirect('user/kapus')
                ->with('error','Gagal menambahakan data Kepala Puskesmas email '.$request->email_aktif.' sudah terpakai mohon gunakan email yang lain');
        }

        $createdAt = Carbon::now('Asia/Jakarta')->format('Y-m-d H:i:s');
        $ccPy= DB::table('users')->where('role','kapus')->count();
        $noPy = $ccPy+1;
        $arrPy = array_map('intval', str_split($noPy));
        if(count($arrPy)==1){
                $gnrPy = '00'.strval($noPy);
            }elseif(count($arrPy)==2){
                $gnrPy = '0'.strval($noPy);
            }else{
                 $gnrPy=strval($noPy);
            }
        $kode = 'BIDAN-'.$gnrPy;
        $userId = DB::table('users')->insertGetId([
            'role'=>'kapus',
            'email'=>$request->email_aktif,
            'password'=>bcrypt($request->password),
            'kode'=>$kode,
            'created_at'=>$createdAt,
        ]);

        DB::table('kapus')->insert([
            'user_id'=>$userId,
            'nama'=>$request->nama,
            'alamat'=>$request->alamat,
            'jabatan_fungsional'=>$request->jabatan_fungsional,
            'no_tlp'=>$request->no_tlp,
            'created_at'=>$createdAt
        ]);

        //Log User
        $user = Auth::user();
        $role = $user->role;
        $data = DB::table($role)->where('user_id',$user->id)->first();
        $arr['name'] = $data->nama;
$arr['id'] = $data->user_id;
        $arr['type'] = 'kapus';
        $arr['action'] = 'Telah berhasil membuat data kapus '.$request->nama.'';
        User::logInsert($arr);
        return redirect('user/kapus')->with('success','Berhasil menambahakan data Kepala Puskesmas');
    }

    public function edit($id)
    {
       $data = DB::table('kapus as kp')
                ->join('users as us','us.id','=','kp.user_id')
                ->where('kp.id',$id)
                ->select('kp.*','us.email')
                ->first();
        if(!$data)
        {
            return redirect('user/kapus')->with('error','Tidak dapat menemukan data Kepala Puskesmas');
        }
        return view('dashboard.kapus.edit',compact('data'));
    }

    public function update(Request $request,$id)
    {
       $check = DB::table('users')->where('email',$request->email_aktif)->first();
       if($check)
       {
            if($check->id != $request->user_id)
            {
                return redirect('user/kapus/edit/'.$id)
                ->with('error','Gagal mengubah data Kepala Puskesmas email '.$request->email_aktif.' sudah terpakai mohon gunakan email yang lain');
            }
       }

       $createdAt = Carbon::now('Asia/Jakarta')->format('Y-m-d H:i:s');

       if($request->password != null)
       {
            DB::table('users')->where('id',$request->user_id)->update([
                'role'=>'kapus',
                'email'=>$request->email_aktif,
                'password'=>bcrypt($request->password),
                'updated_at'=>$createdAt,
            ]);
       }else{
            DB::table('users')->where('id',$request->user_id)->update([
                'role'=>'kapus',
                'email'=>$request->email_aktif,
                'updated_at'=>$createdAt,
            ]);
       }
        

        DB::table('kapus')->where('id',$id)->update([
            'nama'=>$request->nama,
            'alamat'=>$request->alamat,
            'jabatan_fungsional'=>$request->jabatan_fungsional,
            'no_tlp'=>$request->no_tlp,
            'updated_at'=>$createdAt
        ]);

        //Log User
        $user = Auth::user();
        $role = $user->role;
        $data = DB::table($role)->where('user_id',$user->id)->first();
        $arr['name'] = $data->nama;
$arr['id'] = $data->user_id;
        $arr['type'] = 'kapus';
        $arr['action'] = 'Telah berhasil mengubah data kapus '.$request->nama.'';
        User::logInsert($arr);
        if(Auth::user()->role == 'kapus')
        {
            return redirect()->back()->with('success','Berhasil mengubah data Kepala Puskesmas');
        }
        return redirect('user/kapus')->with('success','Berhasil mengubah data Kepala Puskesmas');
    }

    public function delete($id)
    {
        $data = DB::table('kapus')->where('id',$id)->first();
        if($data)
        {
            //Log User
            $user = Auth::user();
            $role = $user->role;
            $dataRole = DB::table($role)->where('user_id',$user->id)->first();
            $arr['name'] = $dataRole->nama;
$arr['id'] = $dataRole->user_id;
            $arr['type'] = 'kapus';
            $arr['action'] = 'Telah berhasil mengahpus data kapus '.$data->nama.'';
            User::logInsert($arr);
            DB::table('users')->where('id',$data->user_id)->delete();
            DB::table('kapus')->where('id',$id)->delete();
            return redirect('user/kapus')->with('success','Berhasil menghapus data Kepala Puskesmas');
        }else{
            return redirect('user/kapus')->with('error','Tidak dapat menemukan data Kepala Puskesmas');
        }
    }
}
