<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Prestamo;

class Prestamos extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $ejemplar_id, $usuario_id, $fecha_devolucion, $fecha_prestamo;
    public $updateMode = false;

    public function render()
    {
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.prestamos.view', [
            'prestamos' => Prestamo::latest()
						->orWhere('ejemplar_id', 'LIKE', $keyWord)
						->orWhere('usuario_id', 'LIKE', $keyWord)
						->orWhere('fecha_devolucion', 'LIKE', $keyWord)
						->orWhere('fecha_prestamo', 'LIKE', $keyWord)
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
		$this->ejemplar_id = null;
		$this->usuario_id = null;
		$this->fecha_devolucion = null;
		$this->fecha_prestamo = null;
    }

    public function store()
    {
        $this->validate([
		'ejemplar_id' => 'required',
		'usuario_id' => 'required',
		'fecha_devolucion' => 'required',
		'fecha_prestamo' => 'required',
        ]);

        Prestamo::create([ 
			'ejemplar_id' => $this-> ejemplar_id,
			'usuario_id' => $this-> usuario_id,
			'fecha_devolucion' => $this-> fecha_devolucion,
			'fecha_prestamo' => $this-> fecha_prestamo
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Prestamo Successfully created.');
    }

    public function edit($id)
    {
        $record = Prestamo::findOrFail($id);

        $this->selected_id = $id; 
		$this->ejemplar_id = $record-> ejemplar_id;
		$this->usuario_id = $record-> usuario_id;
		$this->fecha_devolucion = $record-> fecha_devolucion;
		$this->fecha_prestamo = $record-> fecha_prestamo;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'ejemplar_id' => 'required',
		'usuario_id' => 'required',
		'fecha_devolucion' => 'required',
		'fecha_prestamo' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Prestamo::find($this->selected_id);
            $record->update([ 
			'ejemplar_id' => $this-> ejemplar_id,
			'usuario_id' => $this-> usuario_id,
			'fecha_devolucion' => $this-> fecha_devolucion,
			'fecha_prestamo' => $this-> fecha_prestamo
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Prestamo Successfully updated.');
        }
    }

    public function destroy($id)
    {
        if ($id) {
            $record = Prestamo::where('id', $id);
            $record->delete();
        }
    }
}
