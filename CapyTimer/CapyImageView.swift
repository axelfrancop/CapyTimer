//
//  CapyImageView.swift
//  CapyTimer
//
//  Created by Axel Pedroso on 6/21/24.
//

import SwiftUI

struct CapyImageView: View {
    var body: some View {
        Image("capivarasmilewithoutbackground")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 300, maxHeight: 300)
            .background(.red)
    }
}

#Preview {
    CapyImageView()
}
