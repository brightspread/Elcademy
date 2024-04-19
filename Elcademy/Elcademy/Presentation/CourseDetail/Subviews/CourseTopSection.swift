//
//  CourseTopSection.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import SwiftUI

struct CourseTopSection: View {
    let title: String
    let description: String?
    let imageFileURL: String?
    
    var body: some View {
        Group {
            if let imageFileURL {
                HStack(alignment:.center, spacing: 8) {
                    smallLogo
                    
                    Text(title)
                        .font(.system(size: 18).bold())
                }
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    largeLogo
                    
                    Text(title)
                        .font(.system(size: 28).bold())
                    
                    if let description {
                        Text(description)
                            .font(.system(size: 12))
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

fileprivate extension CourseTopSection {
    @ViewBuilder
    var smallLogo: some View {
        Image("courselogo")
            .resizable()
            .frame(width: 36, height: 36)
            .background(Color(hexString: "F3F3F3"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder
    var largeLogo: some View {
        Image("courselogo")
            .resizable()
            .frame(width: 56, height: 56)
            .background(Color(hexString: "F3F3F3"))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }

}

#Preview {
    CourseTopSection(title: "C언어 레벨 테스트", description: "나의 C언어 실력을 테스트해보세요!", imageFileURL: nil)
}
