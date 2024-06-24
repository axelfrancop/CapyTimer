//
//  PickerSelectTimeComponent.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/24/24.
//

import SwiftUI

struct PickerSelectTimeComponent: View {
    
    @StateObject var xxx = TimerModel()
    
    var body: some View {
        Picker("Time", selection: $xxx.timeRemaining) {
            ForEach(1..<61) { index in
                Text("\(index):00").tag(index * 60)
            }
        }
        .disabled(xxx.isRunning)
        .pickerStyle(.inline)
    }
}

#Preview {
    PickerSelectTimeComponent()
}
