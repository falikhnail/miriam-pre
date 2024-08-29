<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengajuanizin extends Model
{
    use HasFactory;
    protected $table = 'pengajuan_izin';

    public $timestamps = false;
    // add fillable
    protected $fillable = [
        'kode_izin',
        'tgl_izin_dari',
        'tgl_izin_sampai',
        'nama_lengkap',
        'jabatan',
        'status',
        'status_approved',
        'keterangan',
        'doc_sid',
        'nik'
    ];
}
