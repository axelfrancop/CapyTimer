//
//  ButtonPlayPauseComponent.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/25/24.
//

import SwiftUI

struct ButtonPlayPauseComponent: View {
    
    @ObservedObject var timerModel: TimerModel
    
    var body: some View {
        Button(action: {
            if timerModel.isRunning {
                timerModel.stopTimer()
            } else {
                timerModel.startTimer()
            }
        }) {
            Image(systemName: timerModel.isRunning ? "pause.circle" : "play.circle")
                .font(.system(size: 50))
                .tint(.primary)
        }
    }
}

#Preview {
    ButtonPlayPauseComponent(timerModel: TimerModel())
}
