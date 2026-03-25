//
//  CartListView.swift
//  CartCollab-iOS-S26
//
//  Created by Frank Pellicano on 3/4/26.
//

import SwiftUI

struct CartListView: View {
    @State private var presentAddCartView = false
    @State var carts: [CartModel] = []
    
    /*= [
        CartModel(id: "1", data: ["cartName" : "Cart 1", "cartCreatedBy" : "Jane Doe", "cartImageId" : "cart.circle"])!,
        CartModel(id: "2", data: ["cartName" : "Cart 2", "cartCreatedBy" : "John Doe", "cartImageId" : "cart.fill"])!,
        CartModel(id: "3", data: ["cartName" : "Cart 3", "cartCreatedBy" : "Jora Doe", "cartImageId" : "cart.circle"])!,
        CartModel(id: "4", data: ["cartName" : "Cart 4", "cartCreatedBy" : "Jora Doe", "cartImageId" : "cart.circle"])!,
        CartModel(id: "5", data: ["cartName" : "Cart 5", "cartCreatedBy" : "Jarl Doe", "cartImageId" : "cart.circle"])!,
    ]*/
    
    var body: some View {
        let list = ScrollView {
            ForEach(carts, id: \.self.id) {
                (cart: CartModel) in
                CartViewModel(cart: cart)
            }
        }
        
        let button = VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: clickAddCart) {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color(.BADDAD))
                        .frame(width: 75, height: 75)
                        .overlay(
                            Label("Add Cart", systemImage: "plus")
                                .labelStyle(.iconOnly)
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                        ) .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 50))
                        
                }
            }
        }
        
        VStack {
            Text("Cart Collab")
                .font(.system(size: 50, weight: .bold))
            ZStack{
                list
                button
            }
        } .sheet(isPresented: $presentAddCartView){
            AddCartView(carts: $carts)
                .presentationDetents([.medium, .large])
        }
    }
    
    private func clickAddCart(){
        self.presentAddCartView = true
        
    }
}

#Preview {
    CartListView()
}
