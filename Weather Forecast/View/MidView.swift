//
//  MidView.swift
//  Weather Forecast
//
//  Created by Michael Craun on 5/9/20.
//  Copyright © 2020 Michael Craun. All rights reserved.
//

import SwiftUI

struct MidView: View {
    @ObservedObject var forecastModel: ForecastViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("\(forecastModel.currentCity), \(forecastModel.currentCountry)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                Text(forecastModel.day)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .bold()
            }
            Spacer()
        }.padding(.trailing, 200)
    }
}

//struct MidView_Previews: PreviewProvider {
//    static var previews: some View {
//        MidView()
//    }
//}
