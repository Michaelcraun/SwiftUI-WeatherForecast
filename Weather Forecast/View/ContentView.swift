//
//  ContentView.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var forecastModel: ForecastViewModel
    @State var showField: Bool = false
    
    init() {
        forecastModel = ForecastViewModel()
    }
    
    var body: some View {
        ZStack {
            BackSplash()
            VStack {
                TopView(forecastModel: forecastModel, showField: showField)
                MidView(forecastModel: forecastModel)
            }
            VStack(alignment: .center, spacing: 8) {
                Image(systemName: Helper().showWeatherIcon(item: forecastModel.currentCondition))
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.white)
                    .scaledToFit()
                TempView(forecastModel: forecastModel)
                Text("7-Day Weather Forecast")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.all, 20)
                ScrollView(.horizontal, showsIndicators: false) {
                    ForEach(forecastModel.getForecastList(), id: \.dt) { day in
                        DayView(forecast: day)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
