//
//  ViewController.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 27/4/21.
//

import UIKit

class ViewControllerInicial: UIViewController {
    
    // Outlets
    @IBOutlet weak var buscarBar: UISearchBar!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    let colorRojo = #colorLiteral(red: 0.8901960784, green: 0.09019607843, blue: 0.1568627451, alpha: 1)
    var seleccion:Int? = 0 // Variable selección para cuando se realice la busqueda pasar la variable por el segue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Inicio"
        
        // Ponemos el fondo del ViewControllerInicial la imagen de fondoWave
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "fondoWave")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Modificamos el boton buscar para ajustarlo al estilo de nuestra app
        buscarBar.placeholder = "Buscar clase..."
        buscarBar.searchBarStyle = .minimal
        buscarBar.searchTextField.backgroundColor = .white
        buscarBar.clipsToBounds = true
        buscarBar.barTintColor = colorRojo
        buscarBar.delegate = self
     
    }
    
    // Utilizamos esta función sobreescrita para poner el titulo en la barra de navegacion
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Inicio"
    }
    
    // Configuracion del segue para realizar la busqueda de clases segun la cadena pasada por busqueda
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerMostrarCursos {
            destino.seleccion = self.seleccion
            destino.busqueda = buscarBar.text
        }
    }
    
}

// Extension del searchBarDelegate para configurar la busuqeda con el segue
extension ViewControllerInicial: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        buscarBar.resignFirstResponder()
        self.seleccion = 4
        performSegue(withIdentifier: "segueMostrarBusqueda", sender: self)
    }
}


