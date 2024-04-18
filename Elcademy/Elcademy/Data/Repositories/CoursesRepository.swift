//
//  CoursesRepository.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation
import Combine

final class CoursesRepository: CoursesRepositoryProtocol {
    private let dataTransferService: DataTransferService
    private var bag: Set<AnyCancellable> = []
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
//https://api-rest.elice.io/org/academy/course/list/?filter_is_recommended=true&offset=0&count=10
//https://api-rest.elice.io/org/academy/course/list/?offset=10
    
    func fetchCoursesList(query: CourseQuery) async -> CoursesPage {
        await withCheckedContinuation { continuation in
            dataTransferService.getCoursesList(query: query)
                .tryCompactMap { $0 }
                .sink { 
                    switch $0 {
                        case .failure(let error):
                            print(error)
                        case .finished:
                            print("\(#function) is finished")
                    }
                } receiveValue: { 
                    continuation.resume(returning: $0)
                }
                .store(in: &bag)
        } 
    }
}
