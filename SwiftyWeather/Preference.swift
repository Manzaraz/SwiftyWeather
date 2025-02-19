//
//  Preference.swift
//  SwiftyWeather
//
//  Created by Christian Manzaraz on 19/02/2025.
//

import Foundation
import SwiftData

@MainActor
@Model
class Preference {
    var locationName = ""
    var latString = ""
    var longString = ""
    var selectedUnit = UnitSystem.imperial
    var degreeUnitShowing = true
    
    init(
        locationName: String = "",
        latString: String = "",
        longString: String = "",
        selectedUnit: UnitSystem,
        degreeUnitShowing: Bool = true
    ) {
        self.locationName = locationName
        self.latString = latString
        self.longString = longString
        self.selectedUnit = selectedUnit
        self.degreeUnitShowing = degreeUnitShowing
    }
}

extension Preference {
  
}

