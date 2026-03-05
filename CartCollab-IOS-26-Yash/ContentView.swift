//
//  ContentView.swift
//  CartCollab-IOS-26-Yash
//
//  Created by Desai, Yash T on 3/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BottomBar(CartView: AnyView(CartListView()), AccountView:AnyView(AccountView()))
        }
    }
}

#Preview {
    ContentView()
}
