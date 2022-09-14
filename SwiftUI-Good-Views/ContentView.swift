//
//  ContentView.swift
//  SwiftUI-Good-Views
//
//  Created by yilmaz on 14.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WheelView(array: [myVal(val: "0"), myVal(val: "1"), myVal(val: "2"), myVal(val: "3"), myVal(val: "4"), myVal(val: "5"), myVal(val: "6"), myVal(val: "7"), myVal(val: "8"), myVal(val: "9")], circleSize: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
