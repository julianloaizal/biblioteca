<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Autore;

class Autores extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $codigo, $nombre;
    public $updateMode = false;

    public function render()
    {
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.autores.view', [
            'autores' => Autore::latest()
						->orWhere('codigo', 'LIKE', $keyWord)
						->orWhere('nombre', 'LIKE', $keyWord)
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
    }

    public function store()
    {
        $this->validate([
		'codigo' => 'required',
		'nombre' => 'required',
        ]);

        Autore::create([ 
			'codigo' => $this-> codigo,
			'nombre' => $this-> nombre
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Autore Successfully created.');
    }

    public function edit($id)
    {
        $record = Autore::findOrFail($id);

        $this->selected_id = $id; 
		$this->codigo = $record-> codigo;
		$this->nombre = $record-> nombre;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'codigo' => 'required',
		'nombre' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Autore::find($this->selected_id);
            $record->update([ 
			'codigo' => $this-> codigo,
			'nombre' => $this-> nombre
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Autore Successfully updated.');
        }
    }

    public function destroy($id)
    {
        if ($id) {
            $record = Autore::where('id', $id);
            $record->delete();
        }
    }
}
