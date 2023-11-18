<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Usuario;

class Usuarios extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $codigo, $nombre, $telefono, $direccion;
    public $updateMode = false;

    public function render()
    {
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.usuarios.view', [
            'usuarios' => Usuario::latest()
						->orWhere('codigo', 'LIKE', $keyWord)
						->orWhere('nombre', 'LIKE', $keyWord)
						->orWhere('telefono', 'LIKE', $keyWord)
						->orWhere('direccion', 'LIKE', $keyWord)
						->paginate(10),
        ]);
    }
	
    public function cancel()
    {
        $this->resetInput();
        $this->updateMode = false;
    }
	
    private function resetInput()
    {		
		$this->codigo = null;
		$this->nombre = null;
		$this->telefono = null;
		$this->direccion = null;
    }

    public function store()
    {
        $this->validate([
		'codigo' => 'required',
		'nombre' => 'required',
		'telefono' => 'required',
		'direccion' => 'required',
        ]);

        Usuario::create([ 
			'codigo' => $this-> codigo,
			'nombre' => $this-> nombre,
			'telefono' => $this-> telefono,
			'direccion' => $this-> direccion
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Usuario Successfully created.');
    }

    public function edit($id)
    {
        $record = Usuario::findOrFail($id);

        $this->selected_id = $id; 
		$this->codigo = $record-> codigo;
		$this->nombre = $record-> nombre;
		$this->telefono = $record-> telefono;
		$this->direccion = $record-> direccion;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'codigo' => 'required',
		'nombre' => 'required',
		'telefono' => 'required',
		'direccion' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Usuario::find($this->selected_id);
            $record->update([ 
			'codigo' => $this-> codigo,
			'nombre' => $this-> nombre,
			'telefono' => $this-> telefono,
			'direccion' => $this-> direccion
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Usuario Successfully updated.');
        }
    }

    public function destroy($id)
    {
        if ($id) {
            $record = Usuario::where('id', $id);
            $record->delete();
        }
    }
}
