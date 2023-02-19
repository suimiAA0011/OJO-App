//
//  Onboarding.swift
//  OJOApp
//
//  Created by ShahadQadi on 16/07/1444 AH.
//

import SwiftUI

struct Onboarding: View {
    @State private var currentTab = 0
    let screenColor = Color("Background")
    @State var txt = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Background").ignoresSafeArea()
                VStack{
                    TabView(selection: $currentTab,
                            content:  {
                        
                        ForEach(OnboardingData.list) { viewData in
                            OnboardingView(data: viewData)
                                .tag(viewData.id)
                        }
                        
                    })
                    
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    // .background(Color("Color1"))
                    
                    
//                    Button(action: {
                
                        // Add action for button
                    NavigationLink {
                        MainPage(title: txt)
                            .navigationBarBackButtonHidden()
                    }label: {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 70)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("Ora"))
                                
                            )
                        
                    }
                    .shadow(radius: 10)
                    Spacer()
                    
                }
                
                
            }
        }.onAppear{
            SoundManager.instance.plavSound()
        }
        
    }
    
    
    struct Onboarding_Previews: PreviewProvider {
        static var previews: some View {
            Onboarding()
        }
    }
    
    
}
