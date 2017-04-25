//
//  AgregarMedViewController.swift
//  MediKit
//
//  Created by Victor Elizalde on 4/22/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import UIKit

protocol protocoloAgregaMedicina {
    func agregaMedicina(nombre: String, dias: Int, semanas: Int, minutos: Int, horas: Int, restantes: Int) -> Void
    
}

class AgregarMedViewController: UIViewController {

    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var diaSemTF: UITextField!
    @IBOutlet weak var minHorTF: UITextField!
    @IBOutlet weak var duracionSC: UISegmentedControl!
    @IBOutlet weak var dosisSC: UISegmentedControl!
    
    var delegado : protocoloAgregaMedicina!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Nueva Medicina"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func duracionPressed(_ sender: UISegmentedControl) {
        
        if duracionSC.selectedSegmentIndex == 0 {
            
            diaSemTF.placeholder = "Duración del medicamento en dias"
            
        } else {
            
            diaSemTF.placeholder = "Duración del medicamento en semanas"
            
        }
        
    }
    
    @IBAction func dosisPressed(_ sender: UISegmentedControl) {
        
        if dosisSC.selectedSegmentIndex == 0 {
            
            minHorTF.placeholder = "Tiempo entre cada dosis en minutos"
            
        } else {
            
            minHorTF.placeholder = "Tiempo entre cada dosis en horas"
            
        }
        
    }
    
    @IBAction func AgregaMed(_ sender: UIButton) {
        
        let nom = nombreTF.text!
        
        if duracionSC.selectedSegmentIndex == 0 {
            
            let dias = Int(diaSemTF.text!)
            let semanas = -1
            
            if dias != nil {
                
                if dosisSC.selectedSegmentIndex == 0 {
                    
                    let minutos = Int(minHorTF.text!)
                    let horas = -1
                    let restantes = (dias!*24*60)/minutos!
                    
                    if minutos != nil {
                        
                        if nom != "" && dias != nil && minutos != nil {
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias!, semanas: semanas, minutos: minutos!, horas: horas, restantes: restantes)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }
                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Solo se aceptan datos numéricos enteros en el campo de minutos", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                } else {
                    
                    let horas = Int(minHorTF.text!)
                    let minutos = -1
                    let restantes = (dias!*24*60)/(horas!*60)
                    
                    if horas != nil {
                        
                        if nom != "" && dias != nil && horas != nil {
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias!, semanas: semanas, minutos: minutos, horas: horas!, restantes: restantes)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }

                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Solo se aceptan datos numéricos enteros en el campo de horas", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                }
                
            } else {
                
                let alerta = UIAlertController(title: "Alerta", message: "Solo se aceptan datos numéricos enteros en el campo de dias", preferredStyle: .alert)
                
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                present(alerta, animated: true, completion: nil)

                
            }
            
            
        } else {
            
            let semanas = Int(diaSemTF.text!)
            let dias = -1
            
            if semanas != nil {
                
                if dosisSC.selectedSegmentIndex == 0 {
                    
                    let minutos = Int(minHorTF.text!)
                    let horas = -1
                    let restantes = (semanas!*7*24*60)/minutos!
                    
                    if minutos != nil {
                        
                        if nom != "" && semanas != nil && minutos != nil {
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias, semanas: semanas!, minutos: minutos!, horas: horas, restantes: restantes)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }
                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Solo se aceptan datos numéricos enteros en el campo de minutos", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                } else {
                    
                    let horas = Int(minHorTF.text!)
                    let minutos = -1
                    let restantes = (semanas!*7*24*60)/(horas!*60)
                    
                    if horas != nil {
                        
                        if nom != "" && semanas != nil && horas != nil {
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias, semanas: semanas!, minutos: minutos, horas: horas!, restantes: restantes)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }
                        
                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Solo se aceptan datos numéricos enteros en el campo de horas", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                }
                
            } else {
                
                let alerta = UIAlertController(title: "Alerta", message: "Solo se aceptan datos numéricos enteros en el campo de semanas", preferredStyle: .alert)
                
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                present(alerta, animated: true, completion: nil)
                
            }
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
