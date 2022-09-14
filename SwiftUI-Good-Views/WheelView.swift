//
//  WheelView.swift
//  SwiftUI-Good-Views
//
//  Created by yilmaz on 14.09.2022.
//

import SwiftUI

//
//  CirclePercentileView.swift
//  BestForDiet
//
//  Created by yilmaz on 5.09.2022.
//

import SwiftUI

struct myVal : Equatable {
    let id = UUID()
    let val : String
}

enum Direction {
    case left
    case right
}

struct WheelView: View {
    // Circle Radius
    @State var radius : Double = 150
    // Direction of swipe
    @State var direction = Direction.left
    // index of the number at the bottom of the circle
    @State var chosenIndex = 0
    // degree of circle and hue
//    @Binding var degree : Double
    @State var degree = 90.0
    let array : [myVal]
    let circleSize : Double
    
    @State var isChange = 0.0
    
    var body: some View {
        ZStack {
            let anglePerCount = Double.pi * 2.0 / Double(array.count)
            let drag = DragGesture()
                .onChanged { value in
                    
                    if isChange == 0 {
                        isChange = value.location.x
                        return
                    }
                    
                    
                    
                    
                    if isChange > value.location.x {
                        direction = .left
                        moveWheel()
                    } else if isChange < value.location.x {
                        direction = .right
                        moveWheel()
                    }
                   //here I call the function to move the wheel
                    isChange = value.location.x
                    print("yilmaz")
                }
          // MARK: WHEEL STACK - BEGINNING
            ZStack {
                ForEach(0..<array.count) { index in
                    let angle = Double(index) * anglePerCount
                    let xOffset = CGFloat(radius * cos(angle))
                    let yOffset = CGFloat(radius * sin(angle))
                    Text("\(array[index].val)")
                        .rotationEffect(Angle(radians: angle + Double.pi/2))
                        .offset(x: xOffset, y: yOffset )
                }
            }
            .rotationEffect(Angle(degrees: degree))
            .gesture(drag)
            .onAppear() {
                radius = circleSize/2 - 30 // 30 is for padding
            }
           // MARK: WHEEL STACK - END
        }
    }
    
    func moveWheel() {
        withAnimation {
            if direction == .left {
                degree += 2
                if chosenIndex == 0 {
                    chosenIndex = array.count - 1
                } else {
                    chosenIndex -= 1
                }
            } else {
                degree -= 2
                if chosenIndex == 0 {
                    chosenIndex = array.count - 1
                } else {
                    chosenIndex += 1
                }
            }
        }
    }
}


struct WheelView_Previews: PreviewProvider {
    
    static var previews: some View {
        WheelView(array: [myVal(val: "0"), myVal(val: "1"), myVal(val: "2"), myVal(val: "3"), myVal(val: "4"), myVal(val: "5"), myVal(val: "6"), myVal(val: "7"), myVal(val: "8"), myVal(val: "9")], circleSize: 400)
    }
}
