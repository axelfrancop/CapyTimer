//
//  PickerSelectTimeComponent.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/24/24.
//

import SwiftUI

struct PickerSelectTimeComponent: View {
    
    @ObservedObject var timerModel: TimerModel
    
    var body: some View {
        Picker("Time", selection: $timerModel.timeRemaining) {
            ForEach(1..<61) { index in
                Text("\(index):00").tag(index * 60)
            }
        }
        .frame(maxWidth: 100, maxHeight: 100)
        .disabled(timerModel.isRunning)
        .pickerStyle(.inline)
    }
}

#Preview {
    PickerSelectTimeComponent(timerModel: TimerModel())
}
