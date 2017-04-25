//
//  HospitalsTableViewController.swift
//  MediKit
//
//  Created by Victor Elizalde on 4/22/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import UIKit

class HospitalsTableViewController: UITableViewController {

    var listaHospitales = [Hospital]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        var hospital = Hospital(nombre: "HOSPITAL UNIVERSITARIO", dir: "Av. Fco. I. Madero Pte. Col. Mitras Centro, Zona Centro", tel: "8346-7800", map: "")
        listaHospitales.append(hospital)
        
        hospital = Hospital(nombre: "HOSPITAL METROPOLITANO", dir: "Av. Adolfo López Mateos 4600 Col. Valle del Nogalar, Zona Anáhuac", tel: "8350-1405", map: "")
        listaHospitales.append(hospital)
        
        hospital = Hospital(nombre: "HOSPITAL CIMA", dir: "Frida Kahlo 180 Col. Valle Oriente, Zona Valle", tel: "8368-7777", map: "")
        listaHospitales.append(hospital)
        
        hospital = Hospital(nombre: "HOSPITAL DE ESPECIALIDADES DEL IMSS NO.25", dir: "Lincoln y Av. Gonzalitos Col. Mitras Norte, Zona Anáhuac", tel: "8371-410", map: "")
        listaHospitales.append(hospital)
        
        hospital = Hospital(nombre: "HOSPITAL SAN PEDRO", dir: "Calz. San Pedro 804 Col. Fuentes Del Valle, Zona Valle", tel: "8378-5400", map: "")
        listaHospitales.append(hospital)
        
        hospital = Hospital(nombre: "HOSPITAL SAN VICENTE", dir: "Ruperto Martínez 1200 Pte. Col. Centro, Zona Centro", tel: "8345-7777", map: "")
        listaHospitales.append(hospital)
        
        hospital = Hospital(nombre: "HOSPITAL SAN JOSÉ TEC DE MONTERREY", dir: "Av. I.Morones Prieto 3000 Pte. Col. Doctores, Zona Valle", tel: "8347-1010", map: "")
        listaHospitales.append(hospital)
        
        hospital = Hospital(nombre: "OCA HOSPITAL", dir: "Pino Suárez 645 Nte. Col. Centro, Zona Centro", tel: "8262-0000", map: "")
        listaHospitales.append(hospital)
        
        title = "Hospitales"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaHospitales.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = listaHospitales[indexPath.row].nombre

        return cell
    }

}
