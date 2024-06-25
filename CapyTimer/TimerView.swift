//
//  TimerView.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/21/24.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject var timing = TimerModel()
    @State var showSheet: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(spacing: 60) {
                    TimerComponent(timerModel: timing)
                        .onTapGesture {
                            showSheet.toggle()
                        }
                    
                    ///Buttons Play/Stop & Picker Select Time
                    HStack(spacing: 20) {
                        ButtonPlayPauseComponent(timerModel: timing)
                        
                        ///Picker Select Time
                        PickerSelectTimeComponent(timerModel: timing)
                        
                        ///Button Stop
                        ButtonStopComponent(timerModel: timing)
                    }
                    
                    ///Short Break Toggle
                    Toggle(isOn: $timing.shortBreak, label: {
                        Text("Short Break 5min")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                    .disabled(timing.isRunning)
                    .frame(minWidth: 200 ,maxWidth: 200)
                    
                }
                .navigationTitle("CapyTimer")
                .navigationBarTitleDisplayMode(.automatic)
                .padding()
            }
            .padding(.top, 40)
        }///Show Sheet Picker Select Time
        .overlay(content: {
            ZStack{
                Color(.tertiarySystemBackground)
//                    .opacity(showSheet ? 0 : 1)
                    .offset(y: showSheet ? -1000 : -300)
                
                selectTimerView()
                    .offset(y: showSheet ? -1000 : -300)
            }
            .animation(.bouncy, value: showSheet)
            .frame(maxWidth: .infinity, maxHeight: 100)
            .disabled(timing.isRunning)
        })
    }
    
    //MARK: - Model
    @ViewBuilder
    func selectTimerView()-> some View {
        VStack{
            Picker("Time", selection: $timing.timeRemaining) {
                ForEach(1..<61) { index in
                    Text("\(index):00").tag(index * 60)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .disabled(timing.isRunning)
            .pickerStyle(.inline)
        }
    }
    
    
}


#Preview {
    TimerView()
}
