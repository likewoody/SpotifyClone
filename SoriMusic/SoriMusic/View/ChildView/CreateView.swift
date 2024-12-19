//
//  CreateView.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI

struct CreateView: View {
    
    @State var detent: PresentationDetent = .large
    
    var body: some View {
        ZStack(content: {
            Color.black.opacity(0.5)
        })
        .presentationDetents([.large, .medium, .height(250), .fraction(0.5)], selection: $detent)
    }
}

#Preview {
    VStack {
        CreateView()
    }
}
