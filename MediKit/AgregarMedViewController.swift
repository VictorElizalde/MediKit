//
//  AgregarMedViewController.swift
//  MediKit
//
//  Created by Victor Elizalde on 4/22/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import UIKit
import UserNotifications

protocol protocoloAgregaMedicina {
    func agregaMedicina(nombre: String, dias: Int, semanas: Int, minutos: Int, horas: Int, identifiers: [String]) -> Void
    
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
    
    @IBAction func AddMed(_ sender: UIBarButtonItem) {
        
        let nom = nombreTF.text!
        
        if duracionSC.selectedSegmentIndex == 0 {
            
            let dias = Int(diaSemTF.text!)
            let semanas = -1
            
            if dias != nil {
                
                if dosisSC.selectedSegmentIndex == 0 {
                    
                    let minutos = Int(minHorTF.text!)
                    let horas = -1
                    
                    if minutos != nil {
                        
                        var restantes = (dias!*24*60)/minutos!
                        
                        if nom != "" && dias != nil && minutos != nil {
                            
                            var time = minutos!*60
                            let inter = minutos!*60
                            var identifiers = [String]()
                            
                            while(restantes != 0) {
                                
                                let content = UNMutableNotificationContent()
                                
                                content.title = "Tomate tu Medicina"
                                content.body = "\(nom) - \(restantes - 1) restantes"
                                content.sound = UNNotificationSound.default()
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(time), repeats: false)
                                let request = UNNotificationRequest(identifier: "\(nom)_\(restantes)", content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                
                                identifiers.append("\(nom)_\(restantes)")
                                
                                restantes = restantes - 1
                                time = time + inter
                            }
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias!, semanas: semanas, minutos: minutos!, horas: horas, identifiers: identifiers)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }
                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                } else {
                    
                    let horas = Int(minHorTF.text!)
                    let minutos = -1
                    
                    if horas != nil {
                        
                        var restantes = (dias!*24*60)/(horas!*60)
                        
                        if nom != "" && dias != nil && horas != nil {
                            
                            var time = horas!*60*60
                            let inter = horas!*60*60
                            var identifiers = [String]()
                            
                            while(restantes != 0) {
                                
                                let content = UNMutableNotificationContent()
                                
                                content.title = "Tomate tu Medicina"
                                content.body = "\(nom) - \(restantes - 1) restantes"
                                content.sound = UNNotificationSound.default()
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(time), repeats: false)
                                let request = UNNotificationRequest(identifier: "\(nom)_\(restantes)", content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                
                                identifiers.append("\(nom)_\(restantes)")
                                
                                restantes = restantes - 1
                                time = time + inter
                            }
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias!, semanas: semanas, minutos: minutos, horas: horas!, identifiers: identifiers)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }
                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                }
                
            } else {
                
                let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                
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
                    
                    if minutos != nil {
                        
                        var restantes = (semanas!*7*24*60)/minutos!
                        
                        if nom != "" && semanas != nil && minutos != nil {
                            
                            var time = minutos!*60
                            let inter = minutos!*60
                            var identifiers = [String]()
                            
                            while(restantes != 0) {
                                
                                let content = UNMutableNotificationContent()
                                
                                content.title = "Tomate tu Medicina"
                                content.body = "\(nom) - \(restantes - 1) restantes"
                                content.sound = UNNotificationSound.default()
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(time), repeats: false)
                                let request = UNNotificationRequest(identifier: "\(nom)_\(restantes)", content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                
                                identifiers.append("\(nom)_\(restantes)")
                                
                                restantes = restantes - 1
                                time = time + inter
                            }
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias, semanas: semanas!, minutos: minutos!, horas: horas, identifiers: identifiers)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }
                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                } else {
                    
                    let horas = Int(minHorTF.text!)
                    let minutos = -1
                    
                    if horas != nil {
                        
                        var restantes = (semanas!*7*24*60)/(horas!*60)
                        
                        if nom != "" && semanas != nil && horas != nil {
                            
                            var time = horas!*60*60
                            let inter = horas!*60*60
                            var identifiers = [String]()
                            
                            while(restantes != 0) {
                                
                                let content = UNMutableNotificationContent()
                                
                                content.title = "Tomate tu Medicina"
                                content.body = "\(nom) - \(restantes - 1) restantes"
                                content.sound = UNNotificationSound.default()
                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(time), repeats: false)
                                let request = UNNotificationRequest(identifier: "\(nom)_\(restantes)", content: content, trigger: trigger)
                                
                                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                
                                identifiers.append("\(nom)_\(restantes)")
                                
                                restantes = restantes - 1
                                time = time + inter
                            }
                            
                            delegado.agregaMedicina(nombre: nom, dias: dias, semanas: semanas!, minutos: minutos, horas: horas!, identifiers: identifiers)
                            navigationController!.popViewController(animated: true)
                            
                        } else {
                            
                            let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                            
                            alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            
                            present(alerta, animated: true, completion: nil)
                            
                        }
                        
                    } else {
                        
                        let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                        
                        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        
                        present(alerta, animated: true, completion: nil)
                        
                    }
                    
                }
                
            } else {
                
                let alerta = UIAlertController(title: "Alerta", message: "Todos los campos deben estar llenos con datos numéricos enteros", preferredStyle: .alert)
                
                alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                present(alerta, animated: true, completion: nil)
                
            }
            
        }
        
    }


    @IBAction func awayKeyboard(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
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
