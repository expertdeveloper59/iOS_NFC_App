//
//  CardParentView.swift
//  Statis
//
//  Created by Fateh Khan on 06/02/2021.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import SwiftUI

struct CardParentView: View {
    let screenBounds = UIScreen.main.bounds
    @State var index = 0
    let questions = [
        Question(question: "Choose your Username?", TFtitle: "Username", image: "card1"),
        Question(question: "Password?", TFtitle: "Password", image: "card2"),
        Question(question: "First name & Last name?", TFtitle: "First name & Last name", image: "card3"),
        Question(question: "What’s your Email Address?", TFtitle: "Email Address", image: "card3"),
        Question(question: "Whats you Job Position?", TFtitle: "Job Position", image: "card5"),
        Question(question: "Where do you work?", TFtitle: "Company", image: "card6"),
        Question(question: "Whats your website?", TFtitle: "Website", image: "card7"),
        Question(question: "What is your social media?", TFtitle: "Username 4", image: "card8"),
        Question(question: "What is your Address?", TFtitle: "Address", image: "card9"),
        Question(question: "What is your phone number?", TFtitle: "Phone Number", image: "card10"),
        Question(question: "Do you want to be visible to people near you?", TFtitle: "Visible", image: "card10")
    ]

    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                ProgressIndicator(screenBounds: UIScreen.main.bounds, divider: $index)
                CardContents(questionTitle: questions[index].questionTitle, textFieldTitle: questions[index].textFieldTitle, questionSrNo: index+1, imageName: questions[index].imageName)
                    .padding(.horizontal)
                self.roundedRectCustomButton(title: "Next", backgroundColor: .green, width: screenBounds.width/1.2, height: 55) {
                    if index < questions.count-1 {
                        index += 1
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            CardBackgroundView()
        }
    }
}

struct CardContents: View {
    var questionTitle: String
    var textFieldTitle: String
    var questionSrNo: Int
    var imageName: String
    var screenBounds = UIScreen.main.bounds
    
    var body: some View {
        Image(imageName)
            .frame(width: screenBounds.width/1.2, height: screenBounds.height/3, alignment: .center)
            .aspectRatio(contentMode: ContentMode.fit)
        HStack {
            Text("\(questionSrNo). \(questionTitle)")
                .font(.custom("Poppins-Medium", size: 19))
                .foregroundColor(Color("CardQuesColor"))
            Spacer()
        }
        .padding(.vertical)
        CustomFieldText(name: .constant(""), label: "\(textFieldTitle)")
    }
}

struct CardBackgroundView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Wave(graphWidth: 1, amplitude: 0.2)
                    .foregroundColor(Color("AppGreen"))
                    .frame(height: 150)
                    .opacity(0.5)
            }
            VStack {
                Spacer()
                Wave(graphWidth: 1, amplitude: 0.2)
                    .foregroundColor(Color("AppGreen"))
                    .frame(height: 120)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProgressIndicator: View {
    let screenBounds: CGRect
    @Binding var divider: Int
    @State var progressWidth: CGFloat = 0
    var body: some View {
        VStack(alignment: .trailing) {
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray)
                    .frame(height: 8)
                    .opacity(0.3)
                Capsule()
                    .fill(Color("AppGreen"))
                    .frame(width: CGFloat((screenBounds.width/CGFloat(11)) * CGFloat(divider)), height: 8)
            }
            HStack {
                Text("Step 1")
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(Color("AppGreen"))
                Spacer()
                Text("1/11")
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.gray)
                    .opacity(0.4)
            }
        }
        .onAppear {
            progressWidth = CGFloat((screenBounds.width/CGFloat(11)) * CGFloat(divider))
        }
    }
    
}

struct Wave: Shape {
    let graphWidth: CGFloat
    let amplitude: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let origin = CGPoint(x: 0, y: height * 0.60)
        
        var path = Path()
        path.move(to: origin)
        
        var endY: CGFloat = 0.0
        let step = 5.0
        for angle in stride(from: step, through: Double(width) * (step * step), by: step) {
            let x = origin.x + CGFloat(angle/600) * width * graphWidth
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
            endY = y
        }
        path.addLine(to: CGPoint(x: width, y: endY))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: origin.y))
        
        return path
    }
}

