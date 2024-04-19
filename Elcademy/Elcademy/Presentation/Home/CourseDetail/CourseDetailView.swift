//
//  CourseDetailView.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import SwiftUI
import MarkdownUI

struct CourseDetailView: View {
    let course: Course
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment:.center, spacing: 8) {
                    Image("courselogo")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .background(Color(hexString: "F3F3F3"))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text(course.title)
                        .font(.system(size: 18).bold())
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                if let urlString = course.imageFileURL {
                    AsyncImage(url: URL(string: urlString)) {
                        $0.image?.resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                } else if let urlString = course.logoFileURL {
                    AsyncImage(url: URL(string: urlString)) {
                        $0.image?.resizable()
                            .aspectRatio(contentMode: .fit)

                    }
                    .frame(maxWidth: .infinity, maxHeight: 200)
                } 
                
                if let description = course.description,
                   !description.isEmpty {
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
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .bottom) {
            Button {
                
            } label: {
                Text("수강 신청")
                    .font(.system(size: 16).bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color(hexString: "5A2ECC")) // F44336
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal, 16)
            }
        }

    }
}

#Preview {
    CourseDetailView(course: .init(id: 30, title: "코딩 테스트 중급자", code: "1213", description: "### **GraphQL 서버 구축의 실전 노하우!**\r\n\r\n이 과목에서는 GraphQL 서버의 구축과 활용법을 배워봅니다. REST API와의 비교부터 시작하여 GraphQL의 특징과 SDL 문법에 대해 깊이 이해하고, Spring 프레임워크를 활용하여 GraphQL 서버를 구축하는 방법을 익힐 수 있습니다.\r\n\r\n### **GraphQL의 이해와 적용!**\r\n\r\nGraphQL의 기본 개념과 서버 구축 방법을 배웁니다. SDL을 사용하여 스키마를 작성하고, Spring 프레임워크를 활용하여 Posts Query와 Post Mutation을 작성하는 실습을 진행합니다. 또한, TypeScript와 Apollo Server를 이용한 GraphQL 구축 방법도 배우게 됩니다.\r\n\r\n### **클라이언트와의 원활한 소통, GraphQL 쿼리와 apollo-client 활용**\r\n\r\n클라이언트와 서버 간 데이터 통신에 중점을 둡니다. GraphQL 쿼리 언어와 ApolloClient를 사용하여 클라이언트에서 데이터를 가져오고 관리하는 방법을 배웁니다. React와의 통합 및 캐시 관리 기법도 실습을 통해 익히게 됩니다.\r\n\r\n### **실전 프로젝트로 배우는 GraphQL 채팅앱의 완성**\r\n\r\n실전 프로젝트인 GraphQL 채팅앱을 구축하는 방법을 직접 경험합니다. SDL 작성, Schema 설계, Controller 작성 등 서버 구축부터 클라이언트 측 구현까지 단계별로 진행합니다. ApolloClient와 useQuery, useMutation을 활용하여 실제 데이터 통신과 동작 추가를 구현하며, 프로젝트의 완성도를 높여보세요.", imageFileURL: "https://cdn-api.elice.io/api/file/2e32e073b3134fbf8147cb25ff173b47/%EC%84%A0%ED%99%98%EA%B8%89%EC%B1%8C%EB%A6%B0%EC%A7%80%29%20%EC%8D%B8%EB%84%A4%EC%9D%BC.png?se=2024-05-02T00%3A15%3A00Z&sp=r&sv=2021-12-02&sr=b&sig=WXQjl48cQ9EErn6fL2z5soQKYpEayWJG341rF98J2Yg%3D", logoFileURL: "https://cdn-api.elice.io/api/file/2e32e073b3134fbf8147cb25ff173b47/%EC%84%A0%ED%99%98%EA%B8%89%EC%B1%8C%EB%A6%B0%EC%A7%80%29%20%EC%8D%B8%EB%84%A4%EC%9D%BC.png?se=2024-05-02T00%3A15%3A00Z&sp=r&sv=2021-12-02&sr=b&sig=WXQjl48cQ9EErn6fL2z5soQKYpEayWJG341rF98J2Yg%3D", isFree: true))
}

