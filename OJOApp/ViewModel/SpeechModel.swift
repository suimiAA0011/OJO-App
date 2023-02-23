//
//  SpeechModel.swift
//  OJOApp
//
//  Created by ShahadQadi on 03/08/1444 AH.
//
import Foundation
import Speech

class SpeechModel : SFSpeechRecognizer, ObservableObject{
    
    @Published  var speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ar-SA"))
    @Published var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    @Published var recognitionTask: SFSpeechRecognitionTask?
    @Published var audioEngine = AVAudioEngine()
    @Published var buttonEnabeled : Bool = false
    @Published var inputString : String = ""
    @Published var counted : Int = 0
    @Published var Pics : String = "OJO"
    
    
    
    
    func recordButtonTapped() {
        requestAuthorization()
        if  audioEngine.isRunning {
            
            recognitionRequest?.shouldReportPartialResults = false
            audioEngine.inputNode.removeTap(onBus: 0)
            audioEngine.stop()
            recognitionRequest?.endAudio()
            

            self.buttonEnabeled = true
            
        } else {
      
            try! startRecording()
   
            self.buttonEnabeled = false
        }
    }
    
    func viewDidAppear(_ animated: Bool) {
        
 speechRecognizer = self
requestAuthorization()
        
    }
}
