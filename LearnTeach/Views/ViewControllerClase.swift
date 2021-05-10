//
//  ViewControllerClase.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 4/5/21.
//

import UIKit

class ViewControllerClase: UIViewController {
    
    // Outles de la vista
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var collectionViewDatos: UICollectionView!
    @IBOutlet weak var viewDatos: UIView!
    @IBOutlet weak var tablaAlumnos: UITableView!
    
    @IBOutlet weak var fieldProfesor: UITextField!
    @IBOutlet weak var fieldDescripcion: UITextView!
    @IBOutlet weak var fieldPrecio: UITextField!
    @IBOutlet weak var fieldCategoria: UITextField!
    
    @IBOutlet weak var nombreNuevoAlumno: UITextField!
    @IBOutlet weak var btnApuntarse: UIButton!
    
    var iD:Int = 0 //
    var clase:Clase = Clase() // Declaramos la variable de destino que recibira los datos de la clase a mostrar
    let colorRojoClaro = #colorLiteral(red: 1, green: 0.4274509804, blue: 0.4117647059, alpha: 0.6538690476)
    var arrayMuestraDatos:Array<Array<String>> = [] // // Array para mostrar los datos de los alumnos apuntados en esa clase
    var stringNuevoNombre:String = "" // String para guardar el nombre del alumno nuevo
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tablaAlumnos.dataSource = self
        tablaAlumnos.tableFooterView = UIView()
        
        // Mostramos el titulo de clase por encima del banner con el logo
        tituloLabel.text = clase.nombre
        tituloLabel.font = UIFont(name: "Avenir-Light", size: 28.0)
        tituloLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        tituloLabel.backgroundColor = colorRojoClaro
        tituloLabel.textColor = .white
        
        // Mostramos el resto de información
        viewDatos.layer.cornerRadius = 15.0
        fieldProfesor.text = clase.nombreProfesor
        fieldProfesor.isUserInteractionEnabled = false
        fieldDescripcion.text = clase.descripcion
        fieldDescripcion.isUserInteractionEnabled = false
        fieldDescripcion.layer.cornerRadius = 8.0
        fieldPrecio.text = String(clase.precioHora)
        fieldPrecio.isUserInteractionEnabled = false
        if clase.categoria == 1 {
            fieldCategoria.text = "ESO y Bachiller"
        } else if clase.categoria == 2 {
            fieldCategoria.text = "Universidad"
        } else {
            fieldCategoria.text = "Otros"
        }
        fieldCategoria.isUserInteractionEnabled = false
        
        // Personalizamos los botones y recogemos el nombre del nuevo alumno
        btnApuntarse.layer.cornerRadius = 4.0
        btnApuntarse.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 0.7957327706)
        btnApuntarse.tintColor = .white
        nombreNuevoAlumno.placeholder = "Nombre nuevo alumno"
        
        
        	
    }
    
    // Accion del boton apuntarse que añadira un String nuevo a la lista de alumnos de la clase mostrada
    @IBAction func btnApuntarseAction(_ sender: UIButton) {
        stringNuevoNombre = nombreNuevoAlumno.text!
        self.clase.alumnos.append(stringNuevoNombre)
        self.tablaAlumnos.reloadData()
    }
    
}

// Extension para mostrar en la tabla los nombres de los alumnos apuntados a la clase
extension ViewControllerClase:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clase.alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "myCcell")
        }
        
        cell!.textLabel?.text = clase.alumnos[indexPath.row]
        
        return cell!
    }
    
    
}

