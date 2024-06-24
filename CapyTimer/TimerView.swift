//
//  TimerView.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/21/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timing = TimerModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                Picker("Time", selection: $timing.timeRemaining) {
                    ForEach(1..<61) { index in
                        Text("\(index):00").tag(index * 60)
                    }
                }
                .disabled(timing.isRunning)
                .pickerStyle(.inline)
                
                ZStack {
                    Text(timing.formattedTime())
                        .fontWeight(.heavy)
                        .font(.system(size: 60))
                    
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(.primary, lineWidth: 10)
                        .frame(maxWidth: 300)
                        .shadow(radius: 10)
                }
                
                HStack(spacing: 20) {
                    Button(action: {
                        if timing.isRunning {
                            timing.stopTimer()
                        } else {
                            timing.startTimer()
                        }
                    }) {
                        Image(systemName: timing.isRunning ? "pause.circle" : "play.circle")
                            .font(.system(size: 50))
                            .tint(.primary)
                    }
                    
                    Button(action: timing.resetTimer) {
                        Image(systemName: "stop.circle")
                            .font(.system(size: 50))
                            .tint(.red)
                    }
                    .disabled(timing.isRunning)
                }
            }
            .navigationTitle("CapyTimer")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}
#Preview {
    TimerView()
}
