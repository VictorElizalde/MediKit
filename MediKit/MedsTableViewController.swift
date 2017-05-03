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
    
    // MARK: - Metodos de protocolo Agregar Medicina
    
    func agregaMedicina(nombre: String, dias: Int, semanas: Int, minutos: Int, horas: Int, restantes: Int) {
        
        let medicina = Med(nombre: nombre, dias: dias, semanas: semanas, minutos: minutos, horas: horas, restantes: restantes);
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = listaMeds[indexPath.row].nombre
        cell.detailTextLabel?.text = "\(listaMeds[indexPath.row].restantes!)"

        return cell
    }
 
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        let viewAgregar = segue.destination as! AgregarMedViewController
        viewAgregar.delegado = self
        
    }
    

}
