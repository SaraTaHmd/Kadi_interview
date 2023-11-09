//
//  Model.swift
//  Kadi_interview
//
//  Created by sara alhammad on 08/11/2023.
//

import Foundation

struct Posts: Codable , Identifiable {
    var userId : Int
    var id : Int
    var title : String
    var body : String
}

