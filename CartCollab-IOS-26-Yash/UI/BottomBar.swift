//
//  BottomBar.swift
//  CartCollab-IOS-26-Yash
//
//  Created by Desai, Yash T on 3/4/26.
//

import SwiftUI

struct BottomBar: View {
    let CartView: AnyView
    let AccountView: AnyView
    
    init(CartView: AnyView, AccountView: AnyView) {
        self.CartView = CartView
        self.AccountView = AccountView
        UITabBar.appearance()
            .barTintColor = .clear
        UITabBar.appearance()
            .backgroundColor = .black
        UITabBar.appearance()
            .unselectedItemTintColor = .gray
    }
    
    @State var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CartView
                .tabItem{
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(0)
            
            AccountView
                .tabItem{
                    Image(systemName: "person")
                    Text("Account")
                }
                .tag(1)
        }
        .tint(.green)
    }
}

#Preview {
    BottomBar(CartView: AnyView(CartListView()), AccountView: AnyView(AccountView()))
}
