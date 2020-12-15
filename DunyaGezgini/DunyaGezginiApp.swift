//
//  DunyaGezginiApp.swift
//  DunyaGezgini
//
//  Created by Abdulkadir Kocak on 09.12.20.
//

import SwiftUI

@main
struct DunyaGezginiApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                        HStack{
                            Image(systemName: "thermometer")
                            Text("Conversion")
                        }
                    }
                MapView()
                    .tabItem { HStack{
                        Image(systemName: "map")
                            Text("Map")
                        }
                    }
            }.accentColor(.red )
        }
    }
}
