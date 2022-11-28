//
//  AudioRecordingManager.swift
//  ToNotey
//
//  Created by Andrei Tanc on 25.11.2022.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

// needed for fetching audio record
struct Recording {
    let fileURL: URL
    let createdAt: Date
}

class AudioRecordingManager: NSObject, ObservableObject {
    let objectWillChange = PassthroughSubject<AudioRecordingManager, Never>()
    var audioRecorder: AVAudioRecorder!
    
    var recordings = [Recording]() // for fetching
    
    var recording = false {
        didSet {
            print("did change recording to \(recording)")
            objectWillChange.send(self)
        }
    }
    
    var audioPlayer: AVAudioPlayer!
    var isPlaying = false {
        didSet {
            print("did change isPlaying to \(isPlaying)")
            objectWillChange.send(self)
        }
    }
    
    func startRecording() {
        print("starting recording")
        let recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            print("starting saving recording into file: \(audioFilename)")
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            recording = true
        } catch {
            print("Could not start recording")
        }
    }
    
    func stopRecording() {
        print("stopped recording")
        audioRecorder.stop()
        recording = false
    }
    
    func fetchRecording(forPath path: String) {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
//        let directoryContents = try? fileManager.contentsOfDirectory(at: , includingPropertiesForKeys: )
    }
    
    func fetchRecordings() {
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio))
            
            recordings.append(recording)
            recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})

            objectWillChange.send(self)
        }
    }
    
    
    func startPlayback (audio: URL) {
        print("starting playback")
        let playbackSession = AVAudioSession.sharedInstance()

        do {
            try playbackSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Playing over the device's speakers failed")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.delegate = self
            audioPlayer.play()
//            audioPlayer.duration
//            audioPlayer.currentTime
            isPlaying = true
        } catch {
            print("Playback failed.")
        }
    }
    
    func stopPlayback() {
        print("stop playback")
        audioPlayer.stop()
        isPlaying = false
    }
    
    func deleteRecording(urlsToDelete: [URL]) {
        for url in urlsToDelete {
            print(url)
            do {
                try FileManager.default.removeItem(at: url)
            } catch {
                print("File could not be deleted!")
            }
        }
        
        fetchRecordings()
    }
}

extension AudioRecordingManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            isPlaying = false
        }
    }
}

extension AudioRecordingManager {
    func getCreationDate(for file: URL) -> Date {
        if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
           let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
            return creationDate
        } else {
            return Date()
        }
    }
}

extension Date {
    func toString( dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
