//
//  CartViewModel.swift
//  CartCollab-iOS-S26
//
//  Created by Frank Pellicano on 3/18/26.
//

import SwiftUI

struct CartViewModel: View {
    @ObservedObject var cart: CartModel
    
    var body: some View {
        Card(
            cornerRadius: 16,
            color: Color(.white), focusColor: Color(.systemRed).opacity(0.05), shadowRadius: 3,
            height: 150,
            click : {},
            longClick : {},
            views: {
                AnyView(
                    ZStack {
                        HStack{
                            Image(systemName: cart.cartImageId)
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .padding(20)
                            Spacer()
                            VStack{
                                Text(cart.cartName)
                                    .font(.system(size: 18, weight: .bold))
                                    .padding(4)
                                Text(cart.locationName)
                                    .font(.system(size: 16))
                            }
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            HStack{
                                Spacer()
                                Text(cart.shoppingDate, format: .dateTime.year().month().day())
                            }
                        } .padding(20)
                    }
                )
            }
        )
    }
}

#Preview {
    CartViewModel(cart:
                    CartModel(id: "1", data: ["cartName" : "Cart Main"])!
    )
}
