//
//  OnboardingView.swift
//  OJOApp
//
//  Created by ARWA ALSALEM on 18/07/1444 AH.
//

import SwiftUI

struct OnboardingView: View {
    var data: OnboardingData
    @State private var isAnimating: Bool = false
    @State private var currentTab = 0
    var body: some View {
        
        VStack{
            ZStack {
//                Spacer()
//                    .padding(10)
                Image(data.objectImage)
                    .scaledToFill()
            }
            
            
//            Spacer()
            VStack(spacing:10){
                Text(data.primaryText)
                    .font(.largeTitle)
                    .bold()
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                
                Text(data.secondaryText)
                    .font(.largeTitle)
                    .bold()
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                
                
                
//                Spacer()
                
                
//                Button(action: {
//                    // Add action for button
//                }, label: {
//                    Text("Get Started")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 70)
//                        .padding(.vertical, 16)
//                        .background(
//                            RoundedRectangle(cornerRadius: 20)
//                                .foregroundColor(Color("Color2"))
//
//                        )
//
//                })
//                .shadow(radius: 10)
                
                
                Spacer()
            }
            
        }
        //.background(Color("Color1"))
   

    }
    
    
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView(data: OnboardingData.list.first!)
        }
    }
}

