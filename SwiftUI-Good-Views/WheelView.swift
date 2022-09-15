//
//  WheelView.swift
//  SwiftUI-Good-Views
//
//  Created by yilmaz on 14.09.2022.
//

import SwiftUI

struct MyVal : Equatable {
    let id = UUID()
    let val : String
}

enum Direction {
    case left
    case right
}

struct WheelView: View {
    // Circle Radius
    @State var radius: Double = 350
    // Direction of swipe
    @State var direction = Direction.left
    // index of the number at the bottom of the circle
    @State var chosenIndex = 0
    // degree of circle and hue
    @Binding var degree: Double
    //    @State var degree = 90.0
    let array : [MyVal]
    let circleSize : Double
    
    
    func moveWheel() {
        withAnimation(.spring()) {
            if direction == .left {
                degree += Double(360/array.count)
                if chosenIndex == 0 {
                    chosenIndex = array.count-1
                } else {
                    chosenIndex -= 1
                }
            } else {
                degree -= Double(360/array.count)
                if chosenIndex == array.count-1 {
                    chosenIndex = 0
                } else {
                    chosenIndex += 1
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            let anglePerCount = Double.pi * 2.0 / Double(array.count)
            let drag = DragGesture()
                .onEnded { value in
                    if value.startLocation.x > value.location.x + 5 {
                        direction = .left
                    } else if value.startLocation.x < value.location.x - 5 {
                        direction = .right
                    }
                    moveWheel()
                }
            // MARK: WHEEL STACK - BEGINNING
            ZStack {
                Circle().fill(EllipticalGradient(colors: [.orange,.yellow]))
                    .hueRotation(Angle(degrees: degree))
                
                ForEach(0 ..< array.count, id:\.self) { index in
                    let angle = Double(index) * anglePerCount
                    let xOffset = CGFloat(radius * cos(angle))
                    let yOffset = CGFloat(radius * sin(angle))
                    VStack (alignment: .center, spacing: 0) {
                        Text("\(array[index].val)")
                        Text("|")
                    }
                    .rotationEffect(Angle(radians: angle - Double.pi/2))
                    .offset(x: xOffset, y: yOffset)
                    .font(Font.system(chosenIndex == index ? .title : .subheadline, design: .monospaced))
                }
                
            }
            .rotationEffect(Angle(degrees: degree))
            .gesture(drag)
            .onAppear() {
                radius = circleSize/2 - 10 // 30 is for padding
            }
            // MARK: WHEEL STACK - END
        }
        .frame(width: circleSize, height: circleSize)
    }
}
