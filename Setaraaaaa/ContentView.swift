//
//  ContentView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 31/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "Banana")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello!")
            HStack {
                Text("Patrick")
                Text("Sinaga")
            }
            Spacer()
            Text("Haiiiii. This is my typing in swiftUI")
            Spacer()
            Button {
                
            } label: {
                Text("Finish")
                    .fontWeight(.bold)
            }
            .padding()
            .foregroundColor(.yellow)
            .background(Color.blue)
        }
        .padding()
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
