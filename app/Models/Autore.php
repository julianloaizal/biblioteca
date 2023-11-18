<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Autore extends Model
{
	use HasFactory;
	
    public $timestamps = true;

    protected $table = 'autores';

    protected $fillable = ['codigo','nombre'];
	
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function autoresLibros()
    {
        return $this->hasMany('App\Models\AutoresLibro', 'autor_id', 'id');
    }
    
}
