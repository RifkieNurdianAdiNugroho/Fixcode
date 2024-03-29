<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use DB;
use Auth;
use Carbon\Carbon;
class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getItemIdByUserId($role,$id)
    {
        $data = DB::table($role)->where('user_id',$id)->first();
        $idItem = 0;
        if($data)
        {
            $idItem = $data->id;
        }
        return $idItem;
    }

    public static function logInsert($arr)
    {
        $ipaddress = $_SERVER['REMOTE_ADDR'];
        $createdAt = Carbon::now('Asia/Jakarta')->format('Y-m-d H:i:s');
        $user = DB::table('users')->where('id',$arr['id'])->first();
        DB::table('user_log')->insert([
            'name'=>$arr['name'].' - '.$user->kode,
            'type'=>$arr['type'],
            'action'=>$arr['action'],
            'ip'=>$ipaddress,
            'created_at'=>$createdAt

        ]);
    }
}
