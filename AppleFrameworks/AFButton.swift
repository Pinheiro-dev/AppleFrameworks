//
//  AFButton.swift
//  AppleFrameworks
//
//  Created by Matheus Pinheiro on 10/04/24.
//

import SwiftUI

struct AFButton: View {
    let title: String
    
    var body: some View {
        Text(title)
        .font(.title2)
        .fontWeight(.semibold)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .background(.red)
        .clipShape(.rect(cornerRadius: 10))   
    }
}

#Preview {
    AFButton(title: "Learn More")
}
