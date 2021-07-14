//
//  ContentView.swift
//  war-challenge
//
//  Created by Shepherd on 7/9/21.
//

import SwiftUI

struct ContentView: View {
    
    // Define properties to track cards and scores. State properties allow us to change them within the View code. Only this data should be available in this view, so we make these variables private
    @State private var playerCard = "card5"
    @State private var cpuCard = "card6"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                // War logo
                Image("logo")
                
                Spacer()
                
                // Cards
                HStack {
                    
                    Spacer()
                    
                    // Player card on the left
                    Image(playerCard)
                    
                    Spacer()
                    
                    // Displays the CPU card on the right
                    Image(cpuCard)
                    
                    Spacer()
                }
                
                Spacer()
                
                // MARK: Deal button
                Button(action: {
                    
                    // Generate random numbers corresponding to our image assets
                    let randomPlayerNumber = Int.random(in: 2..<15)
                    let randomCpuNumber = Int.random(in: 2..<15)
                    
                    // Change the cards + score with a button press
                    playerCard = "card\(randomPlayerNumber)"
                    cpuCard = "card\(randomCpuNumber)"
                    
                    // See who won that round, then update the score.
                    if randomPlayerNumber > randomCpuNumber {
                       playerScore += 1
                    } else if randomPlayerNumber < randomCpuNumber {
                        cpuScore += 1
                    }
    
                       }) {
                           Image("dealbutton")
                           .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                       }
                
                Spacer()
                
                // Score labels
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(cpuScore)).font(.largeTitle)
                    }
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                
                Spacer()
                
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
