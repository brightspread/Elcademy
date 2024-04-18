//
//  ViewModel.swift
//  Elcademy
//
//  Created by Leo on 4/18/24.
//

import SwiftUI

protocol ViewModel: ObservableObject {
    associatedtype State
    associatedtype Action
    
    var state: State { get }
    func action(_ action: Action)
}
