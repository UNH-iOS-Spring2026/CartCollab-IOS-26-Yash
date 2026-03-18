//
//  Card.swift
//  CartCollab-IOS-26-Yash
//
//  Created by Desai, Yash T on 3/18/26.
//

import SwiftUI

struct Card: View {
    @State private var isTap: Bool = false
    
    let cornerRadius: CGFloat
    let color: Color
    let focusColor: Color?
    let shadowRadius: CGFloat
    let width: CGFloat
    let height: CGFloat
    let click: () -> Void
    let longClick: () -> Void
    let views: () -> AnyView
    
    init(
        cornerRadius: CGFloat = 16,
        color: Color = Color(.white),
        focusColor: Color? = nil,
        shadowRadius: CGFloat = 16,
        width: CGFloat = CGFloat.infinity,
        height: CGFloat = 140,
        click: @escaping () -> Void = {},
        longClick: @escaping () -> Void = {},
        views: @escaping () -> AnyView
    ) {
        self.cornerRadius = cornerRadius
        self.color = color
        self.focusColor = focusColor
        self.shadowRadius = shadowRadius
        self.width = width
        self.height = height
        self.click = click
        self.longClick = longClick
        self.views = views
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(isTap ? focusColor ?? color : color)
                .shadow(color: .gray, radius: shadowRadius)
                .frame(maxWidth: width, minHeight: height, maxHeight: height)
                .padding()
            VStack{
                views()
            }
            .frame(maxWidth: width, maxHeight: height)
        }
        .onTapGesture {
            click()
        }
        .onLongPressGesture(
            minimumDuration: 0.3,
            pressing: {pressing in
                isTap = pressing
            },
            perform: {
                longClick()
            }
        )
    }
}

#Preview {
    Card(
        focusColor: Color(.systemBlue).opacity(0.05),
        shadowRadius: 5
    ){
        AnyView(
            Text("Card View")
        )
    }
}
