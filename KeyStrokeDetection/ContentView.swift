//
//  ContentView.swift
//  KeyStrokeDetection
//
//  Created by Le Huang on 8/28/23.
//

import SwiftUI

struct ContentView: View {
  @State private var message = "Hello, world!"
  private let keyMessages: [CGKeyCode: String] = [
    .kVK_Space: "Space",
    .kVK_Return: "Return",
    .kVK_Delete: "Delete",
    .kVK_Escape: "Escape",
    .kVK_F1: "F1",
    .kVK_ANSI_A: "A"
    // Add more key codes and messages here
  ]
  
  var body: some View {
    VStack {
      Image(systemName: "keyboard")
        .imageScale(.large)
        .foregroundColor(.accentColor)
        .font(.system(size: 50)) // Increase icon size here
      
      Text(message)
        .font(.largeTitle) // Increase text size here
        .padding(.top, 20) // Add padding to separate text from icon
    }
    .padding()
    .onAppear{
      NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
        if let keyMessage = keyMessages[CGKeyCode(Int(event.keyCode))] {
          self.message = "You've hit the \(keyMessage) key"
        }
        return event
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
