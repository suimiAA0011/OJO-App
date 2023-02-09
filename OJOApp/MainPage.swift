//
//  MainPage.swift
//  OJOApp
//
//  Created by ShahadQadi on 16/07/1444 AH.
//

import SwiftUI
struct MainPage: View {
    @State var buttonChange : Bool = false
    var body: some View {
        VStack{
            ZStack{
                
                Color("Background")
                    .ignoresSafeArea()
                
                VStack (spacing: 50){
                    
                    VStack(alignment: .trailing) {
                        
                        Button {
                            buttonChange.toggle()
                        } label: {
                            Circle()
                                .fill(Color("Ora"))
                                .opacity(0.5)
                                .frame(width: 100)
                                .overlay(
                                   
                                    Image(systemName: "waveform")
                                        .resizable()
                                        .foregroundColor(Color("Ora"))
                                        .scaledToFit()
                                   
                                )
                        }
                        
                    }.padding()
                    
                    ZStack {
                        Circle()
                            .fill(buttonChange ? Color("Ora") : Color("OJOGray"))
                            .opacity(0.25).frame(width: 500, height: 500).scaleEffect(self.buttonChange ? 1 : 1)
                        Circle()
                            .fill(buttonChange ? Color("Ora") : Color("OJOGray"))
                            .opacity(0.35).frame(width: 400, height: 400).scaleEffect(self.buttonChange ? 1 : 1)
                        Circle()
                            .fill(buttonChange ? Color("Ora") : Color("OJOGray"))
                            .opacity(0.45).frame(width: 300, height: 300).scaleEffect(self.buttonChange ? 1 : 1)
                        Circle()
                            .fill(buttonChange ? Color("Ora") : Color("OJOGray"))
                            .opacity(0.5).frame(width: 200, height: 200).scaleEffect(self.buttonChange ? 1 : 1)
                        Image("OJO")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                        
                    }.animation(Animation.linear(duration: 1),value: buttonChange)
                        .onTapGesture {
                            buttonChange.toggle()
                        }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    HStack(spacing: 20) {
                        
                        Button {
                            //buttonChange.toggle()
                        } label: {
                            Circle()
                                .fill(Color("Ora"))
                                .opacity(0.5)
                                .frame(width: 150)
                                .overlay(
                                   
                                    Image("claw")
                                        .resizable()
                                        .scaledToFit()
                                )
                        }
                        
                        Button {
                            //Enum ,  buttonChange.toggle()
                        } label: {
                            Circle()
                                .fill(Color("Ora") )
                                .opacity(0.5)
                                .frame(width: 150)
                                .overlay(
                                    Image("tail")
                                        .resizable()
                                        .scaledToFit()
                                )
                        }
                        
                        Button {
                            //buttonChange.toggle()
                        } label: {
                            Circle()
                                .fill(Color("Ora") )
                                .opacity(0.5)
                                .frame(width: 150)
                                .overlay(
                                    Image("ears")
                                        .resizable()
                                        .scaledToFit()
                                )
                        }
                    }
                }
            }
        }
    }
    
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

