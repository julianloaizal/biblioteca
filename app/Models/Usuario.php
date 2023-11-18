<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
	use HasFactory;
	
    public $timestamps = true;

    protected $table = 'usuarios';

    protected $fillable = ['codigo','nombre','telefono','direccion'];
	
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function prestamos()
    {
        return $this->hasMany('App\Models\Prestamo', 'usuario_id', 'id');
    }
    
}
