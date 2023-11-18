<?php

namespace Database\Factories;

use App\Models\Usuario;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UsuarioFactory extends Factory
{
    protected $model = Usuario::class;

    public function definition()
    {
        return [
			'codigo' => $this->faker->name,
			'nombre' => $this->faker->name,
			'telefono' => $this->faker->name,
			'direccion' => $this->faker->name,
        ];
    }
}
