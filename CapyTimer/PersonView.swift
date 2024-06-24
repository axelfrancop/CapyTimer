//
//  PersonView.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/24/24.
//

import SwiftUI

struct PersonView: View {
    var body: some View {
        Image(systemName: "person.circle")
            .tint(.primary)
            .font(.system(size: 100))
    }
}

#Preview {
    PersonView()
}
