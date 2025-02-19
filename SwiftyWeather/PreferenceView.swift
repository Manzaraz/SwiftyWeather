//
//  PreferenceView.swift
//  SwiftyWeather
//
//  Created by Christian Manzaraz on 18/02/2025.
//

import SwiftUI

struct PreferenceView: View {
    @State private var locationName = ""
    @State private var latString = ""
    @State private var longString = ""
    @State private var selectedUnit: UnitSystem = .imperial
    @State private var degreeUnitShowing = true
    var degreeUnit: String {
        if degreeUnitShowing {
            return selectedUnit == .imperial ? "F" : "C"
        }
        
        return ""
    }
    
    var body: some View {
        NavigationStack {
            VStack () {
                VStack (alignment: .leading) {
                    TextField("location", text: $locationName)
                        .font(.title)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
    
                    Text("Latitude")
                        .bold()
                    
                    TextField("latitude", text: $latString)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                        
                    Text("Longitud")
                        .bold()
                    
                    TextField("longitude", text: $longString)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                }
                .font(.title2)
                
                HStack {
                    Text("Units:")
                        .bold()
                    
                    Spacer()
                    
                    Picker("", selection: $selectedUnit) {
                        ForEach(UnitSystem.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                }.font(.title2)
                
                Toggle("Show F/C after temp value:", isOn: $degreeUnitShowing)
                    .font(.system(.title2, weight: .bold))
                
                HStack {
                    Spacer()
                    
                    Text("42°\(degreeUnit)")
                        .font(.system(size: 150, weight: .thin))
    
                    Spacer()
                }
                                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Save") {
                        
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    PreferenceView()
}
