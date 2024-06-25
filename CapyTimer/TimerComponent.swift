//
//  TimerComponent.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/24/24.
//

import SwiftUI

struct TimerComponent: View {
    
    @StateObject var timerModel = TimerModel()
    
    var body: some View {
        ZStack {
            ///Timer Count Down
            Text(timerModel.formattedTime())
                .animation(.default)
                .contentTransition(.numericText())
                .fontWeight(.heavy)
                .font(.system(size: 60))
                .alert(isPresented: $timerModel.showAlert, content: {
                    Alert(title: Text("GRATZZ!"))
                })
                
                
            Circle()
                .trim(from: 0, to: 1)
                .stroke(.primary, lineWidth: 5)
                .frame(maxWidth: 300)
                .shadow(radius: 10)
        }
    }
}

#Preview {
    TimerComponent()
}
