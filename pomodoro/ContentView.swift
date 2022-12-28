//
//  ContentView.swift
//  pomodoro
//
//  Created by Andres Daniel  on 16/12/22.
//

import SwiftUI


func formatHour(num: Int) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .abbreviated
    
    let formattedString = formatter.string(from: TimeInterval(num))!
    return formattedString
}

func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

func DarkMode() -> Void {
    
}
struct ContentView: View {
    @State private var count = 0
    @State private var time = ""
    
    @Environment(\.colorScheme) private var colorScheme
        var body: some View {
            VStack {
                Text("\(time)")
                    .padding()
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Button("Start", action: {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.count += 1
                        time = formatHour(num: count)
                    }
                }) 
            }
        }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
