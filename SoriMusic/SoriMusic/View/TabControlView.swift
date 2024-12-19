//
//  TabControlView.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI

enum TabItemList: String {
    case home, search, your_librar, premium, create
    
    var tabName: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .your_librar:
            return "Your Library"
        case .premium:
            return "Premium"
        case .create:
            return "Create"
        }
    }
}

struct TabControlView: View {
    
    @State var selectedTab: String = "home"
    @State var isCreateOn: Bool = false
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: TabItemList.home.rawValue == selectedTab ? "house.fill" : "house")
                        Text(TabItemList.home.tabName)
                    }
                    .tag("Home")
                
                SearchView()
                    .tabItem {
                        Image(systemName: TabItemList.search.rawValue == selectedTab ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
                        Text(TabItemList.search.tabName)
                    }
                    .tag("Search")

                LibraryView()
                    .tabItem {
                        Image(systemName: TabItemList.your_librar.rawValue == selectedTab ? "rectangle.stack.person.crop.fill" : "rectangle.stack.person.crop")
                        Text(TabItemList.your_librar.tabName)
                    }
                    .tag("Your Library")
                
                PremiumView()
                    .tabItem {
                        Image(systemName: TabItemList.premium.rawValue == selectedTab ? "flame.circle.fill" : "flame.circle")
                        Text(TabItemList.premium.tabName)
                    }
                    .tag("Premium")

                Color.clear
                    .tabItem {
                        Image(systemName: "plus")
                        Text(TabItemList.create.tabName)
                    }
                    .tag("Create")
            }
            .tint(.white)
            .onChange(of: selectedTab) { newTab in
                if newTab == "create" {
                    isCreateOn = true
                    selectedTab = "home" // 선택된 탭 상태를 다시 'home'으로 리셋
                }
            }
            .sheet(isPresented: $isCreateOn) {
                CreateView()
                    .presentationDetents([.fraction(0.5)])
            }
        }
    }
}

// MARK: Preview
#Preview {
    TabControlView()
}

// MARK: extension
