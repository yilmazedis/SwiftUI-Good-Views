//
//  ContentView.swift
//  SwiftUI-Good-Views
//
//  Created by yilmaz on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var degree = 90.0
    let array = Array(1...30).map { MyVal(val:"\($0)") }
    
    var body: some View {
        ZStack (alignment: .center){
            Color.orange.opacity(0.4).ignoresSafeArea()
                .hueRotation(Angle(degrees: degree))
            
            WheelView(degree: $degree, array: array, circleSize: 700)
                .offset(y: -350)
                .shadow(color: .white, radius: 16, x: 0, y: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
