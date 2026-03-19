//
//  CartListView.swift
//  CartCollab-IOS-26-Yash
//
//  Created by Desai, Yash T on 3/4/26.
//

import SwiftUI

struct CartListView: View {
    @State var carts: [CartModel] = [
        CartModel(id: "1", data: ["cartName" : "Cart 1", "cartCreatedBy" : "Jane Doe", "cartImageId" : "cart.circle"])!,
        CartModel(id: "2", data: ["cartName" : "Cart 2", "cartCreatedBy" : "John Doe", "cartImageId" : "cart.fill"])!,
        CartModel(id: "3", data: ["cartName" : "Cart 3", "cartCreatedBy" : "Jora Doe", "cartImageId" : "cart.circle"])!,
        CartModel(id: "4", data: ["cartName" : "Cart 4", "cartCreatedBy" : "Jora Doe", "cartImageId" : "cart.circle"])!,
        CartModel(id: "5", data: ["cartName" : "Cart 5", "cartCreatedBy" : "Jarl Doe", "cartImageId" : "cart.circle"])!,
    ]
    
    var body: some View {
        var list = ScrollView {
            ForEach(carts, id: \.self.id) {
                (cart: CartModel) in
                CartViewModel(cart: cart)
            }
        }
        
        list
    }
}

#Preview {
    CartListView()
}
