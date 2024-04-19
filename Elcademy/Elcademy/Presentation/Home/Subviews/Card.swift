//
//  CourseCard.swift
//  Elcademy
//
//  Created by Leo on 4/19/24.
//

import SwiftUI

struct Card: View {
    let course: CoursePreview
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            image

            title
                .padding(.top, 8)
            
            shortDescription
                .padding(.top, 2)
            
            tagsList
                .padding(.top, 8)
            
            Spacer()
        }
        .foregroundStyle(.black)
        .frame(width: 200, height: 220, alignment: .leading)
    }
}

fileprivate extension Card {
    @ViewBuilder
    var image: some View {
        Group {
            if let urlString = course.imageFileURL {
                AsyncImage(url: URL(string: urlString)) {
                    $0.image?.resizable()
                        .aspectRatio(contentMode: .fit)
                }
            } else if let urlString = course.logoFileURL {
                AsyncImage(url: URL(string: urlString)) {
                    $0.image?.resizable()
                        .aspectRatio(contentMode: .fit)

                }
            } else {
                Text("No image")
                    .background(Color.black.opacity(0.1))
            }
        }
        .frame(width: 200, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    var title: some View {
        Text(course.title)
            .font(.system(size: 14).bold())
            .multilineTextAlignment(.leading)
            .lineLimit(2)
   }
    
    var shortDescription: some View {
        Text(course.shortDescription)
            .font(.system(size: 10))
            .foregroundStyle(Color(hexString: "242424"))
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
    
    var tagsList: some View {
        let chunkedList = course.taglist.chunked(into: 5)
        
        return ForEach(chunkedList, id: \.self) { list in
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    ForEach(list, id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 8).bold())
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .background(Color(hexString: "E4E4E4"))
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
