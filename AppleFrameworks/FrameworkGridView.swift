//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Matheus Pinheiro on 10/04/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FramewordGridViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
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

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
            
            Text(framework.name)
                .lineLimit(1)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
