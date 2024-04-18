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
    
    func fetchCoursesList(query: CourseListQuery) async -> CoursesListResponse {
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
    
    func fetchCourse(query: CourseQuery) async -> CourseResponse {
        await withCheckedContinuation { continuation in
            dataTransferService.getCourse(query: query)
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
    
    func fetchLectureList(query: LectureListQuery) async -> LecturesListResponse {
        await withCheckedContinuation { continuation in
            dataTransferService.getLecturesList(query: query)
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
