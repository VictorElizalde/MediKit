//
//  Meds.swift
//  MediKit
//
//  Created by Victor Elizalde on 4/22/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import Foundation
import UIKit

class Med: NSObject {
    var nombre : String!
    var dias : Int!
    var semanas : Int!
    var minutos : Int!
    var horas : Int!
    var identifiers = [String]()
    
    init(nombre: String, dias: Int, semanas: Int, minutos: Int, horas: Int, identifiers: [String]) {
        self.nombre = nombre
        self.dias = dias
        self.semanas = semanas
        self.minutos = minutos
        self.horas = horas
        self.identifiers = identifiers
    }
    
}
