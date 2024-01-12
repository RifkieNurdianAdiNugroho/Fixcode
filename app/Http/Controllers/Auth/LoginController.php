<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Auth;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function loginUser(Request $request)
    {
        $user = DB::table('users')->where('email',$request->email)->first();
        $arr = [];
        if($user)
        {
            if (!Hash::check($request->password, $user->password))
            {
                //Log User
                $role = $user->role;
                $data = DB::table($role)->where('user_id',$user->id)->first();
                $arr['name'] = $data->nama;
                $arr['id'] = $data->user_id;
                $arr['type'] = 'login';
                $arr['action'] = 'Telah mencoba login dan gagal karena salah menginputkan password';
                User::logInsert($arr);
                return redirect()->back()->with('error','Mohon maaf password yang anda masukkan salah, mohon cek kembali!');
            }

            if(!$user->active)
            {
                //Log User
                $role = $user->role;
                $data = DB::table($role)->where('user_id',$user->id)->first();
                $arr['name'] = $data->nama;
                $arr['id'] = $data->user_id;
                $arr['type'] = 'login';
                $arr['action'] = 'Telah mencoba login dan gagal karena belum diaktifkan oleh ahli gizi';
                User::logInsert($arr);
                return redirect()->back()->with('error','Mohon maaf akun anda belum di setujui oleh ahli gizi!');
            }
            $user = User::find($user->id);
            Auth::login($user);

            //Log User
            $role = $user->role;
            $data = DB::table($role)->where('user_id',$user->id)->first();
            $arr['name'] = $data->nama;
            $arr['id'] = $data->user_id;
            $arr['type'] = 'login';
            $arr['action'] = 'Telah mencoba login dan berhasil';
            User::logInsert($arr);
            return redirect('home');
        }
        $arr['name'] = $request->email;
        $arr['type'] = 'login';
        $arr['action'] = 'Telah mencoba login dan gagal karena salah menginputkan email';
        User::logInsert($arr);
        return redirect()->back()->with('error','Mohon maaf email anda tidak ditemukan, mohon cek kembali!');
    }

    public function logOut(Request $request)
    {
        //Log User
        $user = Auth::user();
        $role = $user->role;
        $data = DB::table($role)->where('user_id',$user->id)->first();
        $arr['name'] = $data->nama;
$arr['id'] = $data->user_id;
        $arr['type'] = 'logout';
        $arr['action'] = 'Telah berhasil logout';
        User::logInsert($arr);

        Auth::logout();
        return redirect('login');
    }   
}
