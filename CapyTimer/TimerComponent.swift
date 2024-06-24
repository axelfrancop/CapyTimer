//
//  TimerComponent.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/24/24.
//

import SwiftUI

struct TimerComponent: View {
    
    @StateObject var xxx = TimerModel()
    
    var body: some View {
        ZStack {
            Text(xxx.formattedTime())
                .fontWeight(.heavy)
                .font(.system(size: 60))
            
            Circle()
                .trim(from: 0, to: 1)
                .stroke(.primary, lineWidth: 10)
                .frame(maxWidth: 300)
                .shadow(radius: 10)
        }
    }
}

#Preview {
    TimerComponent()
}
