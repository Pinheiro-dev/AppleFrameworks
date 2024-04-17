//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Matheus Pinheiro on 10/04/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    
    @Binding var isShowingDetailView: Bool
    @State var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
            .padding(.horizontal, 50)
            
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(
        framework: MockData.sampleFramework,
        isShowingDetailView: .constant(false)
    )
}
