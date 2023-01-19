//
//  ProblemSolvingView.swift
//  Edutainment
//
//  Created by 최윤호 on 2023/01/19.
//

import SwiftUI
struct ProblemSolvingView: View {
    @ObservedObject var settingToggle : SettingToggle
    @ObservedObject var settings : Settings
    @State private var questionIndex  = 0
    @State private var gameInProgress = false
    @State private var problems : [Problem] = []
    @State private var answer  = ""
    @State private var score = 0
    @State private var animatingCorrectAnswer = false
    @State private var animatingWrongAnswer = false
    @State private var haveAnswered = false
    @State private var resultPresented = false
    
    var formatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack(spacing : 100) {
                Image(systemName: "hand.thumbsup")
                    .font(.system(size: 64))
                    .foregroundColor(.green)
                    .modifier(Shake(animatableData: animatingCorrectAnswer ? 2 : 0))
                
                Image(systemName: "hand.thumbsdown")
                    .font(.system(size: 64))
                    .foregroundColor(.red)
                    .modifier(Shake(animatableData: animatingWrongAnswer ? 2 : 0))
            }
            Spacer()
            if(gameInProgress){
                problemUI()
            }
            if(haveAnswered){
                Button("Next Question"){
                    if(questionIndex == problems.count - 1){
                        resultPresented = true
                    }else{
                        moveTonextQuestion()
                    }
                }
                .foregroundColor(.white)
                .padding()
            }else{
                TextField("answer is", text: $answer)
                    .keyboardType(.decimalPad)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .font(.title)
                    .padding()
            }
            
            Spacer()
            Spacer()
        }
        .onAppear(perform: problemGenerator)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(role: .cancel) {
                    settingToggle.isSettingDisplayed.toggle()
                } label: {
                    Text("New game")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("\(questionIndex + 1)/\(settings.questionCount.rawValue)")
            }
        }
        .onSubmit {
            if validateAnswer() {
                score += 1
                withAnimation {
                    animatingCorrectAnswer = true
                }
                
            }else{
                withAnimation {
                    animatingWrongAnswer = true
                }
        
                
            }
            haveAnswered = true
        }
        .alert("게임결과", isPresented: $resultPresented) {
            Button("완료"){
                settingToggle.isSettingDisplayed = true
            }
        } message: {
            Text("점수는 \(score)/\(problems.count)입니다.")
        }
        
    }
    
    private func moveTonextQuestion(){
        haveAnswered = false
        questionIndex += 1
        answer = ""
        animatingCorrectAnswer = false
        animatingWrongAnswer = false
    }
    
    private func problemUI() -> some View {
        let problem = problems[questionIndex]
        return HStack{
            Text("\(problem.firstNumber)")
            Text("x")
            Text("\(problem.secondNumber) = ")
            if(haveAnswered){
                Text("\(problem.answer)")
            }else{
                Text("??")
            }
        }
        .font(.largeTitle)
        .bold()
    }
    
    func validateAnswer() ->Bool {
        let answerInt = Int(answer)
        let problem = problems[questionIndex]
        if answerInt == problem.answer {
            return true
        }
        return false
    }
    
    func problemGenerator() {
        for _ in 1...settings.questionCount.rawValue {
            let firstNumber = settings.step
            let secondNumber = Int.random(in: 2...12)
            let answer = firstNumber * secondNumber
            problems.append(Problem(firstNumber: firstNumber, secondNumber: secondNumber, answer: answer))
        }
        gameInProgress = true
    }
}

struct ProblemSolvingView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemSolvingView(settingToggle: SettingToggle(), settings: Settings())
    }
}
