//
//  ViewControllerMostrarCursos.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 3/5/21.
//

import UIKit

/*
 Este sera el ViewController que utilizaremos para mostrar las clases elegidas segun su categoria o una busqueda
 También servirá para elegir una clase y mostrarla o añadir nuevas clases
 */
class ViewControllerMostrarCursos: UIViewController {
    
    @IBOutlet weak var tablaCursos: UITableView! // Tabla mostrada segun criterios de seleccion o busqueda
    @IBOutlet weak var btnNuevaClase: UIBarButtonItem! // Boton para añadir nueva clase
    var seleccion:Int? // Variable de seleccion para mostrar la tabla con distintas clases
    var arrayClases:Array<Clase> = [] // Vector de clases donde se guardan todas las clases
    var arrayMuestraClase:Array<Clase> = [] // Vector utilizado para recoger la clase que luego se mostrara
    var claseElegida:Int = 0 // Variable para pasar la clase que se ha clickado
    var busqueda:String? // Variable que recoge el String para realizar una busqueda
    
    
    // Inicializamos cargando unos datos de clases como ejemplo
    let c1 = Clase(idClase: 0, nombre: "Matematicas 2 ESO", precioHora: 12.0, descripcion: "Clases particulares de matematicas para el curso de 2 de la ESO", nombreProfesor: "Raul Fernandez", categoria: 1)
    let c2 = Clase(idClase: 1, nombre: "Lengua 4 ESO", precioHora: 10.0, descripcion: "Clases particulares de lengua para el curso de 4 de la ESO", nombreProfesor: "Julian Lopez", categoria: 1)
    let c3 = Clase(idClase: 2, nombre: "Base de datos", precioHora: 15.0, descripcion: "Clases particulares de base de datos para la carrera de Ingenieria Informatica", nombreProfesor: "Antonio Martinez", categoria: 2)
    let c4 = Clase(idClase: 3, nombre: "Clases de piano", precioHora: 20.0, descripcion: "Clases particulares de piano para el conservatorio", nombreProfesor: "Raquel Fernandez", categoria: 3)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Clases"
        
        // Establecemos los dataSource y delegate de la tabla para poder pasarle los datos del array e implementar el segue que muestre los detalles de las clases
        tablaCursos.dataSource = self
        tablaCursos.delegate = self
        
        // Con esta línea conseguimos que no dibuje las lineas de celdas vacías
        tablaCursos.tableFooterView = UIView()
        
        // Añadimos algunos alumnos a las clases para que tengan datos
        let c1Alumnos:Array<String> = ["Antonio Perez", "Jose Lopez", "Elisa Waves"]
        let c2Alumnos:Array<String> = ["Jose Perez", "Elena Lopez"]
        let c3Alumnos:Array<String> = ["Ibai Lopez", "Daniel Lopez", "Papo MC"]
        let c4Alumnos:Array<String> = ["Jorge Martinez"]
        
        c1.alumnos = c1Alumnos
        c2.alumnos = c2Alumnos
        c3.alumnos = c3Alumnos
        c4.alumnos = c4Alumnos
        
        // Añadimos las clases creadas al array que se mostrara en la tabla
        arrayClases.append(c1)
        arrayClases.append(c2)
        arrayClases.append(c3)
        arrayClases.append(c4)
        
    }
    
    // Actualizamos mediante viewWillAppear y la funcion reloadData() la tabla para mostrar las clases nuevas añadidas
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tablaCursos.reloadData()
    }
    
    // Configuracion del boton de añadir una clase nueva para que mediante el segue vaya a la ViewControllerNuevaClase
    @IBAction func btnAddClase(_ sender: Any) {
        performSegue(withIdentifier: "segueNuevaClase", sender: self)
    }
    
    // Configuración de los segues para que pase los datos para mostrar una clase o añadir una nueva clase
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerClase {
            destino.clase = self.arrayMuestraClase[claseElegida]
            
        }
        if let destino2 = segue.destination as? ViewControllerNuevaClase {
            destino2.busqueda = self.busqueda
            destino2.seleccion = self.seleccion
        }
    }
    
    // Declaracion del unwind que devuelve los datos de una nueva clase para añadirla al ArrayClases y mostrarla en la tabla
    @IBAction func unwindNuevaClase(_ unwindSegue:UIStoryboardSegue) {}

}

// Extension para implementar el DataSource de la tabla que mostrara las clases segun la variable de seleccion o de busqueda
extension ViewControllerMostrarCursos: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var contador:Int = 0
        
        if seleccion == 1 || seleccion == 2 || seleccion == 3 {
            for cat in arrayClases {
                if cat.categoria == seleccion {
                    contador += 1
                }
            }
            return contador
        } else {
            for buscaString in arrayClases {
                if buscaString.nombre.contains(busqueda!) {
                    contador += 1
                }
            }
            return contador
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "myCcell")
            cell?.accessoryType = .disclosureIndicator
        }
        var arrayAuxiliar:Array<Clase> = []
        
        if seleccion == 1 || seleccion == 2 || seleccion == 3 {
            for buscaCat in arrayClases {
                if seleccion == buscaCat.categoria {
                    arrayAuxiliar.append(buscaCat)
                }
            }
        } else {
            for buscaString in arrayClases {
                if buscaString.nombre.contains(busqueda!) {
                    arrayAuxiliar.append(buscaString)
                }
            }
        }
        
        arrayMuestraClase = arrayAuxiliar
        cell!.textLabel?.text = arrayAuxiliar[indexPath.row].nombre
        
        return cell!
    }
    
    
}

// Extension del delegado de la tabla para mostrar los detalles de una clase
extension ViewControllerMostrarCursos:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        claseElegida = indexPath.row
        performSegue(withIdentifier: "segueMostrarClase", sender: self)
        
    }
}
