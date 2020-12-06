//
//  TempView.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct TempView: View {
    @ObservedObject var forecastModel: ForecastViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(forecastModel.temperature)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .bold()
                Text(forecastModel.description)
                    .foregroundColor(.secondary)
            }
            HStack(spacing: 6) {
                VStack {
                    Text(forecastModel.windSpeed)
                        .bold()
                        .foregroundColor(.secondary)
                    Text("Wind")
                        .foregroundColor(.secondary)
                }
                VStack {
                    Text(forecastModel.humidity)
                        .bold()
                        .foregroundColor(.secondary)
                    Text("Humidity")
                        .foregroundColor(.secondary)
                }
                VStack {
                    Text(forecastModel.maxTemp)
                        .bold()
                        .foregroundColor(.secondary)
                    Text("Max Temp")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
