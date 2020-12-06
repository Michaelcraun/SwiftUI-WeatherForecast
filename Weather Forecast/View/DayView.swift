//
//  DayView.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct DayView: View {
    let forecast: Forecast.Day
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading) {
                Text(String(Helper().timeConverter(timeStamp: forecast.dt ?? 0, isDay: true)))
                    .foregroundColor(.icon)
            }.offset(y: -75)
            HStack {
                Text("FUCK YOU")
            }
        }
    }
}
