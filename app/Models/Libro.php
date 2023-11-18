<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Libro extends Model
{
	use HasFactory;
	
    public $timestamps = true;

    protected $table = 'libros';

    protected $fillable = ['codigo','titulo','ISBN','editorial','paginas'];
	
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function autoresLibros()
    {
        return $this->hasMany('App\Models\AutoresLibro', 'libro_id', 'id');
    }
    
    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function ejemplares()
    {
        return $this->hasMany('App\Models\Ejemplare', 'libros_id', 'id');
    }
    
}
