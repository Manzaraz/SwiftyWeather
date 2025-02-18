//
//  WeatherView.swift
//  SwiftyWeather
//
//  Created by Christian Manzaraz on 18/02/2025.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.75), Color.teal.opacity(0.75)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Image(systemName: "cloud.sun.rain.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                        .symbolRenderingMode(.multicolor)
                    
                    
                    Text("Wild Weather")
                        .font(.largeTitle)
                    
                    Text("42°F")
                        .font(.system(size: 150, weight: .thin))
                    
                    Text("Wind 10mph - Feels Like 36°F")
                        .font(.title2)
                        .padding()
                }
                .foregroundStyle(.white)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            // TODO: Add gear click here
                        } label: {
                            Image(systemName: "gear")
                        }
                        .tint(.white)
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    WeatherView()
}
