//
//  CourseLecturesSection.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import SwiftUI

struct CourseLecturesSection: View {
    let lectures: [Lecture]
    
    private let purpleColor = Color(hexString: "5A2ECC")
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text("커리큘럼")
                .font(.system(size: 14).bold())
                .foregroundStyle(Color(hexString: "524FA1"))
            
            Rectangle()// divider
                .foregroundStyle(Color(hexString: "AEAEAE"))
                .frame(height: 1)
                .padding(.vertical, 10)

            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<lectures.count, id: \.self) { i in
                    HStack(spacing: 8) {
                        VStack(spacing: 0) {
                            
                            Rectangle()
                                .frame(width: 2, height: 10)
                                .foregroundStyle(i == 0 ? .clear : purpleColor)

                            Circle()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(purpleColor)
                                .overlay {
                                    Circle()
                                        .frame(width: 12, height: 12)
                                        .foregroundStyle(.white)
                                }
                            
                            Rectangle()
                                .frame(width: 2)
                                .frame(maxHeight: .infinity)
                                .foregroundStyle(i == lectures.count - 1 ? .clear : purpleColor)
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        
                        VStack(spacing: 0) {
                            Text(lectures[i].title)
                                .font(.system(size: 18).bold())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 8)
                            Text(lectures[i].description)
                                .font(.system(size: 14))
                                .lineSpacing(4)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 4)
                                .padding(.bottom, 8)
                            
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
    }
}
