//
//  CourseDescriptionSection.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import SwiftUI
import MarkdownUI

struct CourseDescriptionSection: View {
    let description: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("과목 소개")
                .font(.system(size: 14).bold())
                .foregroundStyle(Color(hexString: "524FA1"))
            
            Rectangle()// divider
                .foregroundStyle(Color(hexString: "AEAEAE"))
                .frame(height: 1)
                .padding(.vertical, 10)
            
            Markdown(description)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
    }    
}
