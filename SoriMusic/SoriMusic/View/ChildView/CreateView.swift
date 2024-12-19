//
//  CreateView.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI

// MARK: enum
enum CreateSheetItems {
    case systemImageName, title, subTitle
    
    var playlist: String {
        switch self {
        case .systemImageName:
            "music.note"
        case .title:
            "Playlist"
        case .subTitle:
            "Build a. laylist with songs, or. pisodes"
        }
    }
    
    var blend: String {
        switch self {
        case .systemImageName:
            "hurricane.circle"
        case .title:
            "Blend"
        case .subTitle:
            "Combine tastes in a shared playlist with friends"
        }
    }
    
    var jam: String {
        switch self {
        case .systemImageName:
            "person.2.wave.2.fill"
        case .title:
            "Jam"
        case .subTitle:
            "Listen together from anywhere"
        }
    }
}


// MARK: View
struct CreateView: View {
    
    @State var detent: PresentationDetent = .fraction(0.3)
    let systemImageDefaultScale: Double = 1.8
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.3)
                .ignoresSafeArea(.all)
            VStack() {
                createContent
            }
            .limitLineAndMiniumScaleFactor()
        }
        .presentationDetents([.large, .medium, .height(250), .fraction(0.3)], selection: $detent)
    }
}

// MARK: Preview
#Preview {
    VStack {
        CreateView()
    }
}

// MARK: extension
extension CreateView {
    
    private var createContent: some View {
        VStack {
            createContent(systemImageName: CreateSheetItems.systemImageName.playlist
                          , title: CreateSheetItems.title.playlist, subTitle: CreateSheetItems.subTitle.playlist)
            
            createContent(systemImageName: CreateSheetItems.systemImageName.blend
                          , title: CreateSheetItems.title.blend, subTitle: CreateSheetItems.subTitle.blend)
            
            createContent(systemImageName: CreateSheetItems.systemImageName.jam
                          , title: CreateSheetItems.title.jam, subTitle: CreateSheetItems.subTitle.jam)
        }
    }
    
    private func createContent(systemImageName: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 15) {
            Image(systemName: systemImageName)
                .scaleEffect(systemImageDefaultScale)
                .frame(width: 0)
                .foregroundStyle(.white)
                .padding(.horizontal, 30)
            
//            Text("")
            Text("")
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.title3)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 12))
            }
            Spacer()
        }
    }
}
