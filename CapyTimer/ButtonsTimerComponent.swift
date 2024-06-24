//
//  ButtonsTimerComponent.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/24/24.
//

import SwiftUI

struct ButtonsTimerComponent: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(minWidth: 140, maxWidth: 140, minHeight: 50, maxHeight: 50)
                .foregroundColor(.green)
                .cornerRadius(15)
            
            HStack{
                Image(systemName: "hourglass.circle")
                    .foregroundStyle(.white)
                    .font(.system(size: 40))
                    
                
                Text("START")
                    .foregroundStyle(.white).bold()
                    .font(.title2)
            }
        }
    }
}

#Preview {
    ButtonsTimerComponent()
}
