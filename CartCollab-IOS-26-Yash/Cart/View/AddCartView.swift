//
//  AddCartView.swift
//  CartCollab-iOS-S26
//
//  Created by Frank Pellicano on 3/25/26.
//

import SwiftUI

struct AddCartView: View {
    
    @State private var cartName = ""
    @State private var locationName = ""
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let now = Date()
        let endDate = calendar.date(byAdding: .year, value: 5, to: now)!
        return now...endDate
    }()
    
    var body: some View {
        let title =
        Text("New Cart")
            .font(.system(size: 40, weight: .bold))
            .padding(10)

        let image = Image(systemName: "cart.badge.plus")
            .resizable()
            .frame(width: 110, height: 100, alignment: .center)
        
        
    
        let cartNameField =
        TextField("Cart Name", text: $cartName)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .font(Font.system(size: 30, design: .default))
            .padding([.leading, .trailing], 20)
    
        
        let locationNameField =
        TextField("Shopping Location", text: $locationName)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .font(Font.system(size: 30, design: .default))
            .padding([.leading, .trailing], 20)
        
        
        let shoppingDate =
        DatePicker(
            "Shopping Date",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date]
        ) .padding([.leading,.trailing], 20)
        
        let btnSave =
        Button(action: {
            //AddCart()
        }) {
            Text("Add New Cart")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 5)
        } .padding([.top, .leading],20)
        
        let btnCancel =
        Button(action: {
            //dismiss()
        }) {
            Text("Nevermind")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(maxWidth: 125)
                .background(Color.red)
                .cornerRadius(10)
                .shadow(radius: 5)
        } .padding([.top, .trailing],20)
        
        VStack {
            HStack {
                title
                image
            }
            cartNameField
            locationNameField
            shoppingDate
            
            HStack {
                btnSave
                btnCancel
            }
        }
        
    }
}

#Preview {
    AddCartView()
}
