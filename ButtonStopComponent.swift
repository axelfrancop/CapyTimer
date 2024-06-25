//
//  ButtonStopComponent.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/25/24.
//

import SwiftUI

struct ButtonStopComponent: View {
    @ObservedObject var timerModel: TimerModel
    
    var body: some View {
        Button(action: timerModel.resetTimer) {
            Image(systemName: "stop.circle")
                .font(.system(size: 50))
                .tint(.red)
        }
        .disabled(timerModel.isRunning)
    }
}

#Preview {
    ButtonStopComponent(timerModel: TimerModel())
}
