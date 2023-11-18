<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Libro;

class Libros extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $codigo, $titulo, $ISBN, $editorial, $paginas;
    public $updateMode = false;

    public function render()
    {
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.libros.view', [
            'libros' => Libro::latest()
						->orWhere('codigo', 'LIKE', $keyWord)
						->orWhere('titulo', 'LIKE', $keyWord)
						->orWhere('ISBN', 'LIKE', $keyWord)
						->orWhere('editorial', 'LIKE', $keyWord)
						->orWhere('paginas', 'LIKE', $keyWord)
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
		$this->titulo = null;
		$this->ISBN = null;
		$this->editorial = null;
		$this->paginas = null;
    }

    public function store()
    {
        $this->validate([
		'codigo' => 'required',
		'titulo' => 'required',
		'ISBN' => 'required',
		'editorial' => 'required',
		'paginas' => 'required',
        ]);

        Libro::create([ 
			'codigo' => $this-> codigo,
			'titulo' => $this-> titulo,
			'ISBN' => $this-> ISBN,
			'editorial' => $this-> editorial,
			'paginas' => $this-> paginas
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Libro Successfully created.');
    }

    public function edit($id)
    {
        $record = Libro::findOrFail($id);

        $this->selected_id = $id; 
		$this->codigo = $record-> codigo;
		$this->titulo = $record-> titulo;
		$this->ISBN = $record-> ISBN;
		$this->editorial = $record-> editorial;
		$this->paginas = $record-> paginas;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'codigo' => 'required',
		'titulo' => 'required',
		'ISBN' => 'required',
		'editorial' => 'required',
		'paginas' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Libro::find($this->selected_id);
            $record->update([ 
			'codigo' => $this-> codigo,
			'titulo' => $this-> titulo,
			'ISBN' => $this-> ISBN,
			'editorial' => $this-> editorial,
			'paginas' => $this-> paginas
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Libro Successfully updated.');
        }
    }

    public function destroy($id)
    {
        if ($id) {
            $record = Libro::where('id', $id);
            $record->delete();
        }
    }
}
