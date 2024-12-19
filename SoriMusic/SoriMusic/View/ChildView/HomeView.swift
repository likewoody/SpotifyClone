//
//  HomeView.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI


// MARK: HomeView
struct HomeView: View {
    
    private let vm = HomeViewModel()
    
    /// Category
    @Environment(\.sizeCategory) private var sizeCategory
    @State private var categorySelected: String = "all"
    private let categoryDefaultScale: Double = 1.5
    private let categoryDefaultWidthSize: CGFloat = 70
    
    /// Title
//    let recommendTitle: String = "Recommend for today"
    
    /// Album
    let displayAlbumSize: CGFloat = 175
    
    var body: some View {
        ScrollView {
            VStack {
                categoryTopArea
                
                showAlbumLists(title: "Recommend for today")
                
                showAlbumLists(title: "Made For Woody Jo")
                
            }
            .padding()
        }
    }
}

// MARK: Preview
#Preview {
    HomeView()
}

// MARK: extension
extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            1.0
        case .large, .extraLarge, .extraExtraLarge:
            0.8
        default:
            0.6
        }
    }
}

// .background 와 .primary의 타입이 달라 ShapeStyle의 customBackground를 하나 만들어준다.
extension ShapeStyle where Self == Color {
    static var customBackground: Color { Color(UIColor.systemBackground) } // iOS의 기본 배경색
}

extension HomeView {
    
    // MARK: Header
    private var categoryTopArea: some View {
        HStack(spacing: 15) {

            Text(String(vm.user?.name.first ?? "U"))
                .font(.title3)
                .foregroundStyle(.background)
                .background(Circle().scale(categoryDefaultScale + 0.3).fill(.green))
//                        .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(vm.categoriesTopArea, id: \.self) { category in
                        Button(category.capitalized) {
                            withAnimation(.spring()) {
                                categorySelected = category
                            }
                        }
                        .frame(width: category == "all" ? categoryDefaultWidthSize / 2 : categoryDefaultWidthSize)
                        .foregroundStyle(
                            categorySelected == category ? .customBackground : .primary
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(
                                    categorySelected == category ? .green : .secondary
                                )
                                .scaleEffect(categoryDefaultScale)
                        )
                        .padding()
                        .lineLimit(1)
                        .minimumScaleFactor(sizeCategory.customMinScaleFactor)
                   }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    // MARK: Body
    private func showAlbumLists(title: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .bold()
//                .padding(.horizontal, 10)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<4) { index in
                        VStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: displayAlbumSize, height: displayAlbumSize)
                            
                            Text("Title")
                                .font(.headline)
                            
                            Text("Artist")
                                .font(.subheadline)
                        }
                    }
                    .padding(.trailing)
//                    .padding(10)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
