<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Ejemplare;

class Ejemplares extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $codigo, $localizacion, $libros_id;
    public $updateMode = false;

    public function render()
    {
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.ejemplares.view', [
            'ejemplares' => Ejemplare::latest()
						->orWhere('codigo', 'LIKE', $keyWord)
						->orWhere('localizacion', 'LIKE', $keyWord)
						->orWhere('libros_id', 'LIKE', $keyWord)
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
		$this->localizacion = null;
		$this->libros_id = null;
    }

    public function store()
    {
        $this->validate([
		'codigo' => 'required',
		'localizacion' => 'required',
        ]);

        Ejemplare::create([ 
			'codigo' => $this-> codigo,
			'localizacion' => $this-> localizacion,
			'libros_id' => $this-> libros_id
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Ejemplare Successfully created.');
    }

    public function edit($id)
    {
        $record = Ejemplare::findOrFail($id);

        $this->selected_id = $id; 
		$this->codigo = $record-> codigo;
		$this->localizacion = $record-> localizacion;
		$this->libros_id = $record-> libros_id;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'codigo' => 'required',
		'localizacion' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Ejemplare::find($this->selected_id);
            $record->update([ 
			'codigo' => $this-> codigo,
			'localizacion' => $this-> localizacion,
			'libros_id' => $this-> libros_id
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Ejemplare Successfully updated.');
        }
    }

    public function destroy($id)
    {
        if ($id) {
            $record = Ejemplare::where('id', $id);
            $record->delete();
        }
    }
}
