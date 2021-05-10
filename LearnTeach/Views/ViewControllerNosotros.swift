//
//  ViewControllerNosotros.swift
//  LearnTeach
//
//  Created by Raul Fernandez on 1/5/21.
//

import UIKit
import MapKit

class ViewControllerNosotros: UIViewController {
    
    // Outlets para poder modificarlos y personalizarlos
    @IBOutlet weak var tituloNosotros: UILabel!
    @IBOutlet weak var textoNosotros: UITextView!
    @IBOutlet weak var titulo2Nosotros: UILabel!
    @IBOutlet weak var mapaNosotros: MKMapView!
    
    let colorRojoClaro = #colorLiteral(red: 1, green: 0.4256298145, blue: 0.4113036256, alpha: 1)
    let colorRojo = #colorLiteral(red: 0.8901960784, green: 0.09019607843, blue: 0.1568627451, alpha: 0.8096691313)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sobre Nosotros"
        
        // Modificacion del label del titulo (Quienes somos) de la vista
        tituloNosotros.text = "¿Quiénes somos?"
        tituloNosotros.textColor = colorRojoClaro
        tituloNosotros.font = tituloNosotros.font.withSize(28)
        tituloNosotros.font = UIFont(name: "Avenir-Light", size: 28.0)
        tituloNosotros.backgroundColor = UIColor.clear
        
        // Modificacion del TextField que muestra la descripcion
        textoNosotros.backgroundColor = colorRojo
        textoNosotros.font = tituloNosotros.font.withSize(18)
        textoNosotros.layer.cornerRadius = 15.0
        textoNosotros.textColor = .white
        textoNosotros.isEditable = false
        
        // Modificacion del label del titulo 2 (Donde Estamos) de la vista
        titulo2Nosotros.text = "¿Dónde estamos?"
        titulo2Nosotros.textColor = colorRojoClaro
        titulo2Nosotros.font = tituloNosotros.font.withSize(28)
        titulo2Nosotros.font = UIFont(name: "Avenir-Light", size: 28.0)
        titulo2Nosotros.backgroundColor = UIColor.clear
        
        // Modificacion esquinas del mapa y establecer latitud y longitud de Linares
        mapaNosotros.layer.cornerRadius = 15.0
        mapaNosotros.centerCoordinate = CLLocationCoordinate2D(latitude: 38.09838054145135, longitude: -3.637116473308049)
             
    }
    
    // Utilizamos esta función sobreescrita para poner el titulo en la barra de navegacion
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Sobre Nosotros"
    }
    
}
