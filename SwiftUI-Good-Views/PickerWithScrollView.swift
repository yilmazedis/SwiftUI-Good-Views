//
//  PickerWithScrollView.swift
//  SwiftUI-Good-Views
//
//  Created by yilmaz on 15.09.2022.
//

import SwiftUI

struct PickerWithScrollView: View {
    @State private var index = 0
    @State private var items = Array(repeating: 20, count: 0)
    
    var body: some View {
        
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<self.items.count, id: \.self) { i in
                    Text("\(i)")
                        .foregroundColor(self.index == i ? .red : .black)
                        .frame(width: 20, height: 20)
                        .gesture(TapGesture().onEnded({ self.index = i }))
                }
            }
        }
        .frame(width: 300, alignment: .leading)
        
    }
}

struct PickerWithScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PickerWithScrollView()
    }
}
