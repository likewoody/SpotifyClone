//
//  TabControlView.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI

// MARK: enum
enum TabItemList: String {
    case home, search, your_librar, premium, create
    
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass.circle"
        case .your_librar:
            return "rectangle.stack.person.crop"
        case .premium:
            return "flame.circle"
        case .create:
            return "plus"
        }
    }
    
    var systemImageNameSelected: String {
        switch self {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass.circle.fill"
        case .your_librar:
            return "rectangle.stack.person.crop.fill"
        case .premium:
            return "flame.circle.fill"
        case .create:
            return "plus"  // create는 변경 없음
        }
    }
    
    var tabName: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .your_librar: return "Your Library"
        case .premium: return "Premium"
        case .create: return "Create"
        }
    }
}

// MARK: View
struct TabControlView: View {
    
    @State var selectedTab: String = "Home"
    @State var isCreateTabbed: Bool = false
    
    var body: some View {
        /*
 //        TabView {
 //            Tab(TabItemList.home.tabName, systemImage: selectedTab == TabItemList.home.tabName ? TabItemList.home.systemImageNameSelected : TabItemList.home.systemImageName) {
 //                HomeView()
 //            }
 //
 //            Tab(TabItemList.search.tabName, systemImage: selectedTab == TabItemList.search.tabName ? TabItemList.search.systemImageNameSelected : TabItemList.search.systemImageName) {
 //                SearchView()
 //            }
 //
 //            Tab(TabItemList.your_librar.tabName, systemImage: selectedTab == TabItemList.your_librar.tabName ? TabItemList.your_librar.systemImageNameSelected : TabItemList.your_librar.systemImageName) {
 //                LibraryView()
 //            }
 //
 //            Tab(TabItemList.premium.tabName, systemImage: selectedTab == TabItemList.premium.tabName ? TabItemList.premium.systemImageNameSelected : TabItemList.premium.systemImageName) {
 //                PremiumView()
 //            }
 //
 //            Tab(TabItemList.create.tabName, systemImage: selectedTab == TabItemList.create.tabName ? TabItemList.create.systemImageNameSelected : TabItemList.create.systemImageName) {
 //                CreateView()
 //            }
 //        }
         */
        ZStack {
            eachTabDisplays
            VStack {
                Spacer()
            }
        }
        .sheet(isPresented: $isCreateTabbed) {
            CreateView()
                .presentationDetents([.fraction(0.3)])
        }
        customBottomTab
    }
        
}

// MARK: Preview
#Preview {
    TabControlView()
}

// MARK: extension
extension TabControlView {
    
    private var eachTabDisplays: some View {
        VStack {
            switch selectedTab {
            case TabItemList.home.tabName:
                HomeView()
            case TabItemList.search.tabName:
                SearchView()
            case TabItemList.your_librar.tabName:
                LibraryView()
            case TabItemList.premium.tabName:
                PremiumView()
            default:
                fatalError()
            }
        }
        .opacity(isCreateTabbed ? 0.5 : 1)
        .disabled(isCreateTabbed ? true : false)
    }
    
    private func customTabItems(trueSystemName: String, falseSystemName: String, tabName: String) -> some View {
        Button {
            if tabName == "Create" {
                isCreateTabbed.toggle()
            } else {
                selectedTab = tabName
            }
        } label: {
            VStack {
                Image(systemName: selectedTab == tabName ? trueSystemName : falseSystemName)
                    .font(.system(size: 30))
                    .padding(2)
                Text(tabName)
                    .font(.system(size: 15))
            }
            .foregroundStyle(selectedTab == tabName ? .white : .gray)
        }
    }
    
    private var customBottomTab: some View {
        HStack(alignment: .bottom) {
            Group {
                Spacer()
                customTabItems(
                    trueSystemName: TabItemList.home.systemImageNameSelected, falseSystemName: TabItemList.home.systemImageName, tabName: TabItemList.home.tabName
                )
                
                Spacer()
                
                customTabItems(
                    trueSystemName: TabItemList.search.systemImageNameSelected, falseSystemName: TabItemList.search.systemImageName, tabName: TabItemList.search.tabName
                )
                
                Spacer()
                
                customTabItems(
                    trueSystemName: TabItemList.your_librar.systemImageNameSelected, falseSystemName: TabItemList.your_librar.systemImageName, tabName: TabItemList.your_librar.tabName
                )
                
                Spacer()
                
                customTabItems(
                    trueSystemName: TabItemList.premium.systemImageNameSelected, falseSystemName: TabItemList.premium.systemImageName, tabName: TabItemList.premium.tabName
                )
                Spacer()
                
                customTabItems(
                    trueSystemName: TabItemList.create.systemImageNameSelected, falseSystemName: TabItemList.create.systemImageName, tabName: TabItemList.create.tabName
                )
                Spacer()
            }
        }
        .background(.ultraThickMaterial)
    }
}
