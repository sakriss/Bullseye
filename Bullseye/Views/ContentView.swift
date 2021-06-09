//
//  ContentView.swift
//  Bullseye
//
//  Created by Scott Kriss on 5/17/21.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
        }
    }
    
    struct InstructionsView: View {
        @Binding var game: Game
        var body: some View {
            VStack {
                InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                BigNumberText(text: String(game.target))
            }
        }
    }
    
    struct SliderView: View {
        @Binding var sliderValue: Double
        
        var body: some View {
            HStack {
                SliderLabelText(text: "1")
                Slider(value: self.$sliderValue, in: 1...100)
                SliderLabelText(text: "100")
            }
            .padding()
        }
    }
    
    struct HitMeButton: View {
        @Binding var alertIsVisible: Bool
        @Binding var sliderValue: Double
        @Binding var game: Game
        
        var body: some View {
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!".uppercased())
                    .bold()
                    .font(.title3)
            }
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            
            .foregroundColor(.white)
            .cornerRadius(21.0)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color.white, lineWidth: 2.0)
            )
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                let points = game.points(sliderValue: roundedValue)
                return Alert(title: Text("Hello"), message: Text("The slider value is \(roundedValue)!\n" + "You scored \(points) points this round"), dismissButton: .default(Text("AwesomeSauce")){
                    game.startNewRound(points: points)
                }
                
                )
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
