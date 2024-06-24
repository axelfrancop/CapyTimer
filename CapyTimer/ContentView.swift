//
//  ContentView.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    //determina qual tab vai ser aberta quando abrir o aplicativo
    
    var body: some View {
        TabView(selection: $selectedTab){
            PersonView()
                .tabItem {
                    Label("Person", systemImage: "person")
                }
                .tag(0)
            
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "hourglass.circle")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
        
        
    }
}

#Preview {
    ContentView()
}
