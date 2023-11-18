<?php

namespace Database\Factories;

use App\Models\Ejemplare;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class EjemplareFactory extends Factory
{
    protected $model = Ejemplare::class;

    public function definition()
    {
        return [
			'codigo' => $this->faker->name,
			'localizacion' => $this->faker->name,
			'libros_id' => $this->faker->name,
        ];
    }
}
