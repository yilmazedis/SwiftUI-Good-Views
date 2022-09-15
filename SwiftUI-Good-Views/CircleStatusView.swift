//
//  CircleStatusView.swift
//  SwiftUI-Good-Views
//
//  Created by yilmaz on 14.09.2022.
//

import SwiftUI

struct CircleStatusView: View {
    @Binding var progress: [CGFloat]
    
    @State private var from: CGFloat = 0
    @State private var to: CGFloat = 0
    @State private var total: CGFloat = 0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.3)
                .foregroundColor(.white)
            
            ForEach(0..<progress.count) { element in
                let a = resetPath(of: progress[element])
                Circle()
                    .trim(from: from + 0.045, to: CGFloat(min(to, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .foregroundColor(Color.green)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: 100)
            }
            
            Text(String(format: "%.0f", 2100))
                .font(.largeTitle)
                .bold()
        }.onAppear {
            total = 2100
        }
    }
    
    private func getPercentage(of number: CGFloat) -> CGFloat {
        return number / 2100
    }
    
    private func resetPath(of number: CGFloat) {
        from = to
        to = getPercentage(of: number) + from
    }
}

struct CircleStatusView_Previews: PreviewProvider {
    
    static var previews: some View {
        CircleStatusView(progress: .constant([100.0, 200.0, 300.0, 400.0, 500.0, 600.0]))
            .frame(width: 200.0, height: 200.0)
            .padding(20.0)
    }
}

