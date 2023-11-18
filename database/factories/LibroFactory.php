<?php

namespace Database\Factories;

use App\Models\Libro;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class LibroFactory extends Factory
{
    protected $model = Libro::class;

    public function definition()
    {
        return [
			'codigo' => $this->faker->name,
			'titulo' => $this->faker->name,
			'ISBN' => $this->faker->name,
			'editorial' => $this->faker->name,
			'paginas' => $this->faker->name,
        ];
    }
}
