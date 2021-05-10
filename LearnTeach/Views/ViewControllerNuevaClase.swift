//
//  ViewControllerNuevaClase.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 4/5/21.
//

import UIKit

class ViewControllerNuevaClase: UIViewController {

    // Outlets
    
    @IBOutlet weak var viewFormulario: UIView!
    @IBOutlet weak var tituloView: UILabel!
    
    @IBOutlet weak var nombreClase: UITextField!
    @IBOutlet weak var nombreProfesor: UITextField!
    @IBOutlet weak var descripcionClase: UITextView!
    @IBOutlet weak var valorPrecioHora: UITextField!
    @IBOutlet weak var modificacionPrecioHora: UIStepper!
    @IBOutlet weak var selectCategoria: UIPickerView!
    
    var _categoriaClase:Int = 1 // Variable categoria iniciada a 1 como se muestra el PickerView
    
    var arrayCategorias:Array<String> = [] // Declaracion del array que guardara las categorias para mostrarlas por el PickerView
    
    let colorBlanco = UIColor.white
    let colorRojoClaro = #colorLiteral(red: 1, green: 0.4274509804, blue: 0.4117647059, alpha: 0.6538690476)
    
    var busqueda:String? // Variable busqueda que devolvemos por el unwind con el mismo valor para que la tabla luego muestre los mismos resultados de clases
    var seleccion:Int? // Variable seleccion que devolvemos por el unwind con el mismo valor para que la tabla luego muestre los mismos resultados de clases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Nueva clase"
        
        // Personalizacion del controller View
        tituloView.text = "Nueva clase"
        tituloView.font = UIFont(name: "Avenir-Light", size: 28.0)
        tituloView.font = UIFont.boldSystemFont(ofSize: 28.0)
        tituloView.backgroundColor = colorRojoClaro
        tituloView.textColor = .white
        
        // Le añadimos las categorias al array para el PickerView
        arrayCategorias = ["ESO y Bachiller", "Universidad", "Otros"]
        
        // Delegate y DataSource del textView y PickerView
        descripcionClase.delegate = self
        selectCategoria.dataSource = self
        selectCategoria.delegate = self
        
        // Personalizacion del controller View
        viewFormulario.layer.cornerRadius = 8.0
        nombreClase.placeholder = "Nombre de la clase"
        nombreProfesor.placeholder = "Nombre del profesor"
        descripcionClase.text = "Descripcion de la clase"
        descripcionClase.textColor = UIColor.lightGray
        valorPrecioHora.text = "1.0"
        modificacionPrecioHora.layer.cornerRadius = 8.0
        modificacionPrecioHora.value = 1.0
        modificacionPrecioHora.autorepeat = true
        selectCategoria.layer.cornerRadius = 8.0
        selectCategoria.setValue(colorBlanco, forKey: "TextColor")
        
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    // Pasamos el valor del precio segun le demos al stepper para mostrarlo por pantalla y ver el precio que tendria la clase
    @IBAction func modificacionPHAction(_ sender: Any) {
        valorPrecioHora.text = String(modificacionPrecioHora.value)
    }
    
    // Configuracion del segue donde devolvemos los datos por medio del unwind para dar de alta una clase nueva y mostrarla luego en la tabla
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let claseNueva:Clase = Clase(idClase: 0, nombre: nombreClase.text!, precioHora: modificacionPrecioHora.value, descripcion: descripcionClase.text, nombreProfesor: nombreProfesor.text!, categoria: _categoriaClase)
        if let destino = segue.destination as? ViewControllerMostrarCursos {
            claseNueva.idClase = destino.arrayClases.count
            destino.arrayClases.append(claseNueva)
            destino.busqueda = busqueda
            destino.seleccion = _categoriaClase
            destino.tablaCursos.reloadData()
        }
    }
}

// Delegate del TextView para mostrar un placeholder, ya que no se podría como un TextField normal
extension ViewControllerNuevaClase:UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Descripcion de la clase"
            textView.textColor = UIColor.lightGray
        }
    }
    
}

// DataSource y Delegate para el PickerView de categorias y mostrar los datos del array para poder elegir entre ellos
extension ViewControllerNuevaClase:UIPickerViewDataSource, UIPickerViewDelegate {
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCategorias.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayCategorias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if arrayCategorias[row] == "ESO y Bachiller" {
            _categoriaClase = 1
        } else if arrayCategorias[row] == "Universidad" {
            _categoriaClase = 2
        } else {
            _categoriaClase = 3
        }
    }
    
}

