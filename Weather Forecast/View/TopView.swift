//
//  TopView.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct TopView: View {
    @ObservedObject var forecastModel: ForecastViewModel
    @State var showField: Bool = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                TextField("Enter City Name", text: $forecastModel.cityName) {
                    self.forecastModel.searchCity()
                }.padding(.all, 10)
                    .frame(width: screen.width - 50, height: 50)
                    .background(Color.lightBlue)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .offset(x: showField ? 0 : (-screen.width / 2) - 180)
                    .animation(.spring())
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .offset(x: showField ? screen.width - 90 : -30)
                    .animation(.spring())
                    .onTapGesture {
                        self.showField.toggle()
                }
            }
        }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        forecastModel.searchCity()
    }
}

//struct TopView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopView()
//    }
//}
