//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Anthony Greene on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var winStreak = 0
    @State private var isGameOver = false
    @State private var winTitle = ""
    @State private var rockPaperScissors = ["Rock", "Paper", "Scissors"]
    // 0 = rock, 1 = paper, 2 = scissors
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 15){
                Text("Rock Paper Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.black)
                Spacer()
                Spacer()
                
                VStack(spacing: 20){
                    Text("Streak: \(winStreak)")
                    
                    Text("Pick Rock, Paper, or Scissors!")
                        .font(.title3.weight(.bold))
                    
                    ForEach(0..<3) { number in
                        Button {
                            playRound(number)
                        } label: {
                            Image(rockPaperScissors[number])
                                .clipShape(.buttonBorder)
                                .shadow(radius: 5)
                                .scaledToFit()
                                .frame(width: 300, height: 175)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 0)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                }
            }
            .alert(winTitle, isPresented: $isGameOver) {
                Button("Continue", action: reset)
            } message: {
                Text("The AI chose \(rockPaperScissors[correctAnswer])!")
            }
        }
    }
    func playRound(_ number: Int){
        if correctAnswer == 0  { //rock
            if number == 1 { //paper beats rock
                winTitle = "You win! Paper beats Rock!"
                winStreak += 1
                isGameOver = true
            }
            else if number == correctAnswer{
                winTitle = "You Tied!"
                isGameOver = true
            }
            else{
                winStreak = 0
                winTitle = "You lose, \(rockPaperScissors[correctAnswer]) beats \(rockPaperScissors[number])"
                isGameOver = true
                
            }
        }
        if correctAnswer == 1 { // paper
            if number == 2 {
                winTitle = "You win! Scissors beats Paper!"
                winStreak += 1
                isGameOver = true
            }
            else if number == correctAnswer{
                winTitle = "You Tied!"
                isGameOver = true
            }
            else{
                winStreak = 0
                winTitle = "You lose, \(rockPaperScissors[correctAnswer]) beats \(rockPaperScissors[number])"
                isGameOver = true
                
            }
        }
        if correctAnswer == 2 { //Scissors
            if number == 0 {
                winTitle = "You win! Rock beats Scissors!"
                winStreak += 1
                isGameOver = true
            }
            else if number == correctAnswer{
                winTitle = "You Tied!"
                isGameOver = true
            }
            else{
                winStreak = 0
                winTitle = "You lose, \(rockPaperScissors[correctAnswer]) beats \(rockPaperScissors[number])"
                isGameOver = true
                
            }
        }
    }
    func reset(){
        correctAnswer = Int.random(in: 0...2)
    }
}



#Preview {
    ContentView()
}
