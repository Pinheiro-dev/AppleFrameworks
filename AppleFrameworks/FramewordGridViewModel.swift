//
//  FramewordGridViewModel.swift
//  AppleFrameworks
//
//  Created by Matheus Pinheiro on 11/04/24.
//

import SwiftUI

final class FramewordGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}
