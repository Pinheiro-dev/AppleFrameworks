//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Matheus Pinheiro on 10/04/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FramewordGridViewModel()
            
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                            .sheet(isPresented: $viewModel.isShowingDetailView){
                                if let selectedFramework = viewModel.selectedFramework {
                                    FrameworkDetailView(
                                        framework: selectedFramework,
                                        isShowingDetailView: $viewModel.isShowingDetailView
                                    )
                                }
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
    }
}

#Preview {
    FrameworkGridView()
}
