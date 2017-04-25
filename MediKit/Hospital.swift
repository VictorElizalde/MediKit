//
//  Hospital.swift
//  MediKit
//
//  Created by Victor Elizalde on 4/22/17.
//  Copyright © 2017 Victor Elizalde. All rights reserved.
//

import Foundation
import UIKit

class Hospital: NSObject {
    var nombre : String = ""
    var dir : String = ""
    var tel : String = ""
    var map : String = ""
    
    init(nombre: String, dir: String, tel: String, map: String) {
        self.nombre = nombre
        self.dir = dir
        self.tel = tel
        self.map = map
    }
    
}
