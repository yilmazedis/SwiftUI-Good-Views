//
//  PickerView.swift
//  SwiftUI-Good-Views
//
//  Created by yilmaz on 15.09.2022.
//

import SwiftUI

struct PickerView: View {
    @State var interval:TimeInterval = 0
    @State var selectedHour = 0
    @State var selectedMin = 0
    @State var selectedSecond = 0
    
    var body: some View {
        //List {
        Form {
            Section (header: Text("Interval")) {
                HStack (spacing: 0)  {
                    Picker(selection: self.$selectedHour, label: Text("Hour")) {
                        ForEach(0..<25) { hour in
                            Text("\(hour) h")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(minWidth: 100, maxWidth: .infinity)
                    .clipped()
                    
                    Picker(selection: self.$selectedMin, label: Text("Min")) {
                        ForEach(0..<60) { min in
                            Text("\(min) m")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(minWidth: 100, maxWidth: .infinity)
                    .clipped()
                    
                    Picker(selection: self.$selectedSecond, label: Text("Sec")) {
                        ForEach(0..<60) { sec in
                            Text("\(sec) s")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(minWidth: 100, maxWidth: .infinity)
                    .clipped()
                }
                .mask(Rectangle())
            }
        }//.id(UUID())
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
