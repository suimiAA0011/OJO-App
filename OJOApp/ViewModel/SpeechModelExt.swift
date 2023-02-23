//
//  SpeechModelExt.swift
//  OJOApp
//
//  Created by ShahadQadi on 03/08/1444 AH.
//

import Foundation
import Speech
import SwiftUI

extension SpeechModel{
    
    
    func requestAuthorization(){
        SFSpeechRecognizer.requestAuthorization { authStatus in
            
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.buttonEnabeled = true
                    
                case .denied:
                    self.buttonEnabeled = false
                    
                case .restricted:
                    self.buttonEnabeled = false
                    
                case .notDetermined:
                    self.buttonEnabeled = false
                default:
                    print("error")
                }
            }
        }
    }
    
    func startRecording() throws {
        
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .measurement, options: .interruptSpokenAudioAndMixWithOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            var isFinal = false
            
            if(result?.bestTranscription.formattedString != nil){
                DispatchQueue.main.async {
                    
                    self.inputString = result?.bestTranscription.formattedString ?? ""
                    let splittedString = self.inputString.components(separatedBy: " ")
                    let wordCheck = "حمار غبي كلب حيوان"
                    let WordSplitted = wordCheck.components(separatedBy: " ")
                    let goodwordCheck = "اسف"
                    var badWord = 0
                    var goodWord = 0
                    
                    for inputElement in splittedString{
                        for wordElement in WordSplitted{
                            
                            if inputElement == wordElement {
                                print(wordElement)
                                badWord += 1
                                
                                
                            }
                        }
                        print(badWord)
                        
                        if badWord == 2{
                            
                            self.Pics = "upsetOJO"
//                            for inputElement in splittedString{
//                                if inputElement == goodwordCheck {
//                                    print(inputElement)
//                                    self.Pics = "OJO"
//                                    goodWord += 1
//                                    // self.Pics = "upsetOJO"
//                                   // badWord = 0
//                                    self.Pics = "upsetOJO"
//                                }
//
//                            }
                            
                        }
                        else if badWord > 2 {
                            
                            self.Pics = "sadOJO"
                            for inputElement in splittedString{
                                if inputElement == goodwordCheck {
                                    print(inputElement)
                                    self.Pics = "OJO"
                                    goodWord += 1
                                   
                                    badWord = 0
                                    self.Pics = "sadOJO"
                                }
                                
                            }
                      
                        }
                        
                        else if badWord == 0{
                            self.Pics = "OJO"
                            
                        }
                        
                    }
                    
                }
                
            }
            
            if(result?.isFinal != nil)
            {  isFinal = (result?.isFinal)!}
            
            if isFinal || error != nil {
                let command = result?.bestTranscription.formattedString
                
                if command != nil {
                    self.audioEngine.inputNode.removeTap(onBus: 0)
                    
                    self.audioEngine.stop()
                    
                    self.recognitionRequest?.endAudio()
                    
                }
                
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
            
        }
        
        audioEngine.prepare()
        try audioEngine.start()
        
    }
    
    public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            self.buttonEnabeled = true
        } else {
            self.buttonEnabeled = false
        }
    }
    
    
    
}

