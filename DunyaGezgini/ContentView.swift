//
//  ContentView.swift
//  DunyaGezgini
//
//  Created by Abdulkadir Kocak on 09.12.20.
//

import SwiftUI

struct ContentView: View {
    @State var isVisible = false
    
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
            TextField("CONVERSION_TEXT_FIELD_PLACEHOLDER ",text:$fahreneitValue)
                .keyboardType(.decimalPad)
            .font(Font.system(size: 64)).multilineTextAlignment(.center)
            Text("CONVERSION_FAHRENHEIT")
            Text("CONVERSION_IS_ACTUALLY").foregroundColor(.gray)
            Text(convertToCelcius()).font(Font.system(size: 64))
            Text("CONVERSION_DEGREES_CELCIUS")
            Text("Abdulkadir Koçak")
            Spacer()
        }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.orange)
        .opacity(isVisible ? 1.0 : 0.0)
        .offset(x:0, y: isVisible ? 0 : 20)
        .animation(.easeIn(duration: 1.0))
        .onAppear{
            self.isVisible = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
