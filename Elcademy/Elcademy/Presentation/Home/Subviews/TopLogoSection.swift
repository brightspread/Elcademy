//
//  TopLogoSection.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import SwiftUI

struct TopLogoSection: View {
    var body: some View {
        HStack {
            Image("Logo")
            Spacer()
            Button {
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .tint(.black)
                    .frame(width: 24, height: 24)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 64, alignment: .center)
        .padding(.horizontal, 16)
    }
}
