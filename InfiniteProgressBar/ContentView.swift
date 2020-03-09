//
//  ContentView.swift
//  InfiniteProgressBar
//
//  Created by Huynh Tan Phu on 3/9/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var progressDegree: Double = 10
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(lineWidth: 7)
                .foregroundColor(.blue)
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(progressDegree))
                .padding()
            
            Button(action: {
                self.startTimer()
            }){
                Text("Start Timer")
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { (timer) in
            withAnimation {
                self.progressDegree += 10
            }
            if self.progressDegree >= 360 {
                self.progressDegree = 0
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
