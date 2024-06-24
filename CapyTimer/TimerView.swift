//
//  TimerView.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/21/24.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timing = TimerModel()
    //@State var playButton = ButtonsTimerComponent()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 60) {
                    
                    
                    
                    ZStack {
                        Text(timing.formattedTime())
                            .animation(.default)
                            .contentTransition(.numericText())
                            .fontWeight(.heavy)
                            .font(.system(size: 60))
                            .alert(isPresented: $timing.showAlert, content: {
                                Alert(title: Text("hello world"))
                            })
                            
                        
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
                        
                        Picker("Time", selection: $timing.timeRemaining) {
                            ForEach(1..<61) { index in
                                Text("\(index):00").tag(index * 60)
                            }
                        }
                        .frame(maxWidth: 100, maxHeight: 100)
                        .disabled(timing.isRunning)
                        .pickerStyle(.inline)
                        
                        
                        
                        Button(action: timing.resetTimer) {
                            Image(systemName: "stop.circle")
                                .font(.system(size: 50))
                                .tint(.red)
                        }
                        .disabled(timing.isRunning)
                    }
                    
                    Toggle(isOn: $timing.shortBreak, label: {
                        Text("Short Break")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                    .disabled(timing.isRunning)
                    .frame(minWidth: 160 ,maxWidth: 160)
                    
                    
                    
                }
                .navigationTitle("CapyTimer")
                .navigationBarTitleDisplayMode(.automatic)
                .padding()
            }
            .padding(.top, 40)
        }
         
    }
}
#Preview {
    TimerView()
}
