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
                    Image(systemName: "person")
                }
                .tag(0)
            
            TimerView()
                .tabItem {
                    Image(systemName: "hourglass.circle")
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
                .tag(2)
        }
        
        
    }
}

#Preview {
    ContentView()
}
