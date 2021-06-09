//
//  Shapes.swift
//  Bullseye
//
//  Created by Scott Kriss on 6/3/21.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack{
            Circle()
//                .fill(Color.blue)
//                .inset(by: 10.0)
//                .stroke(Color.blue, lineWidth: 20.0)
                .strokeBorder(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 20.0)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Capsule()
                .fill(Color.blue)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Ellipse()
                .fill(Color.blue)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
