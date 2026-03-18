//
//  CartModel.swift
//  CartCollab-IOS-26-Yash
//
//  Created by Desai, Yash T on 3/18/26.
//

import Foundation

final class CardModel: ObservableObject {
    let id: String
    
    @Published var cartName: String = ""
    @Published var cartCreatedBy: String = ""
    @Published var locationName: String = ""
    @Published var cartImageId: String = "cart.circle"
    @Published var shoppingDate: Date = Date()
    
    init(id: String) {
        self.id = id
    }
    
    convenience init?(id: String, data: [String : Any]) {
        guard let cartName = data["cartName"] as? String,
              let cartCreatedBy = data["cartCreatedBy"] as? String?,
              let locationName = data["locationName"] as? String?,
              let cartImageId = data["cartImageId"] as? String?,
              let shoppingDateTimeStamp = data["shoppingDate"] as? Double?
        else {
            return nil
        }
        
        self.init(id: id)
        self.cartName = cartName
        self.cartCreatedBy = cartCreatedBy ?? ""
        self.locationName = locationName ?? ""
        self.cartImageId = cartImageId ?? ""
        self.shoppingDate = Date(timeIntervalSince1970: shoppingDateTimeStamp ?? 0)
    }
}
