//
//  MedsTableViewController.swift
//  MediKit
//
//  Created by Victor Elizalde on 4/22/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import UIKit
import UserNotifications

class MedsTableViewController: UITableViewController, protocoloAgregaMedicina {

    var listaMeds = [Med]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Medicinas"
//        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: listaMeds[indexPath.row].identifiers )
            listaMeds.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        
    }
    
    // MARK: - Metodos de protocolo Agregar Medicina
    
    func agregaMedicina(nombre: String, dias: Int, semanas: Int, minutos: Int, horas: Int, identifiers: [String]) {
        
        let medicina = Med(nombre: nombre, dias: dias, semanas: semanas, minutos: minutos, horas: horas, identifiers: identifiers);
        
        listaMeds.append(medicina)
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaMeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MedTableViewCell
        
        cell.nomLabel.text = listaMeds[indexPath.row].nombre
        
        if listaMeds[indexPath.row].dias != -1 {
            
            cell.duracionLabel.text = "\(listaMeds[indexPath.row].dias!) día(s)"
            
        } else {
            
            cell.duracionLabel.text = "\(listaMeds[indexPath.row].semanas!) semana(s)"
    
        }
        
        if listaMeds[indexPath.row].minutos != -1 {
            
            cell.dosisLabel.text = "Cada \(listaMeds[indexPath.row].minutos!) minuto(s)"
            
        } else {
            
            cell.dosisLabel.text = "Cada \(listaMeds[indexPath.row].horas!) hora(s)"
            
        }

        return cell
    }
 
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        let viewAgregar = segue.destination as! AgregarMedViewController
        viewAgregar.delegado = self
        
    }
    

}
