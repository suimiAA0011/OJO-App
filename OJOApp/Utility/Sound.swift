//
//  Sound.swift
//  OJOApp
//
//  Created by ARWA ALSALEM on 28/07/1444 AH.
//

import SwiftUI
import AVKit

class SoundManager{
    static let instance = SoundManager ()
    var player: AVAudioPlayer?
    func plavSound() {
        guard let url = Bundle.main.url(forResource: "OJO Arabic 3", withExtension: ".wav") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play ()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}
