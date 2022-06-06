//
//  ContentView.swift
//  weatherapp
//
//  Created by Alex Eshtokin on 06.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack(spacing: 8){
                CityTextView(city: "Kharkiv", country: "UA")
               
                MainWeatherStatus(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", tempreture: 76)
                
                HStack(alignment: .center, spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temprature: 88)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.fill", temprature: 60)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "wind.snow", temprature: 55)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sunset.fill", temprature: 60)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "snow", temprature: 25)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change day time",
                                  backgroundColor: .white,
                                  textColor: isNight ? .black : .blue)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temprature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temprature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    isNight ? .black : .blue,
                    isNight ? .gray : Color("LightBLue")
                ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct CityTextView : View {
    var city: String
    var country: String
    
    var body: some View {
        Text("\(city), \(country)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(20)
    }
}

struct MainWeatherStatus: View {
    var imageName: String
    var tempreture: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
                    
            Text("\(tempreture)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 80)
    }
}

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
