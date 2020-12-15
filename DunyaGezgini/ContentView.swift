//
//  ContentView.swift
//  DunyaGezgini
//
//  Created by Abdulkadir Kocak on 09.12.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahreneitValue: String=""
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    func convertToCelcius() -> String {
        
        if let value = Double(fahreneitValue){
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            let celciusValue = fahrenheit.converted(to:.celsius)
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
            
        }else{
            return "???"
        }
     
    }
    var body: some View {
        VStack{
            TextField("value",text:$fahreneitValue)
                .keyboardType(.decimalPad)
            .font(Font.system(size: 64)).multilineTextAlignment(.center)
            Text("Fahrenheit")
            Text("is actually").foregroundColor(.gray)
            Text(convertToCelcius()).font(Font.system(size: 64))
            Text("degress Celcius")
            Text("Abdulkadir Koçakk")
            Spacer()
        }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
