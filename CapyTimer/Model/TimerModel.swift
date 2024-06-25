//
//  TimerModel.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/24/24.
//

import Foundation


class TimerModel: ObservableObject {
    @Published var timeRemaining: Int = 1500
    @Published var isRunning: Bool = false
    @Published var shortBreak: Bool = false
    @Published var showAlert: Bool = false
    private var timer: Timer?
    
    func formattedTime() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                if self.shortBreak{
                    self.isRunning = false
                    self.shortBreakFunc()
                }else{
                    self.stopTimer()
                    self.timeRemaining = 1500
                    self.showAlert = true
                }
            }
        }
    }
    
    func shortBreakFunc() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false){_ in
            self.timeRemaining = 300
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
                self.showAlert = true
            }
        }
    }
    
    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        stopTimer()
        timeRemaining = 1500
        shortBreak = false
    }
    
}
