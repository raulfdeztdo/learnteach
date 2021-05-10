//
//  ViewControllerCategorias.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 1/5/21.
//

import UIKit

class ViewControllerCategorias: UIViewController {

    // Outlets de los botones de las categorias
    @IBOutlet weak var btnEsoBach: UIButton!
    @IBOutlet weak var btnUniversidad: UIButton!
    @IBOutlet weak var btnOtros: UIButton!
    
    // Variable para filtrar segun que categoria sea elegida
    var seleccion:Int? = 0
    
    let colorRojoClaro = #colorLiteral(red: 1, green: 0.4274509804, blue: 0.4117647059, alpha: 0.45)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categorias"
        
        // Modificacion Titulos y estilos de los botones de categorias
        btnEsoBach.setTitle("ESO y Bachiller", for: .normal)
        btnEsoBach.titleLabel?.font = UIFont(name: "Avenir-Light", size: 34.0)
        btnEsoBach.tintColor = .white
        btnEsoBach.backgroundColor = colorRojoClaro
        
        btnUniversidad.setTitle("Universidad", for: .normal)
        btnUniversidad.titleLabel?.font = UIFont(name: "Avenir-Light", size: 34.0)
        btnUniversidad.tintColor = .white
        btnUniversidad.backgroundColor = colorRojoClaro
        
        btnOtros.setTitle("Otros", for: .normal)
        btnOtros.titleLabel?.font = UIFont(name: "Avenir-Light", size: 34.0)
        btnOtros.tintColor = .white
        btnOtros.backgroundColor = colorRojoClaro
        
    }
    
    // Utilizamos esta función sobreescrita para poner el titulo en la barra de navegacion
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Categorias"
    }
    
    // Actions de los botones
    @IBAction func btnEsoBachillerAction(_ sender: Any) {
        self.seleccion = 1;
        performSegue(withIdentifier: "segueMostrarCat", sender: self)
    }
    
    @IBAction func btnUniversidadAction(_ sender: Any) {
        self.seleccion = 2;
        performSegue(withIdentifier: "segueMostrarCat", sender: self)
    }
    
    @IBAction func btnOtrosAction(_ sender: Any) {
        self.seleccion = 3;
        performSegue(withIdentifier: "segueMostrarCat", sender: self)
    }
    
    // Configuracion del segue para enviar la variable seleccion segun que categoria haya sido clickeada
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? ViewControllerMostrarCursos {
            destino.seleccion = self.seleccion
        }
    }
    
}
