//
//  ViewController.swift
//  MediaPlayground
//
//  Created by John Ray on 11/5/15.
//  Copyright © 2015 John E. Ray. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation
import MediaPlayer
import AVKit

class ViewController: UIViewController, MPMediaPickerControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var toggleCamera: UISwitch!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var displayNowPlaying: UILabel!
    @IBOutlet weak var musicPlayButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var musicPlayer: MPMusicPlayerController!
    
    @IBAction func loadMovie(sender: AnyObject) {
        let movieFilename: String =
        NSBundle.mainBundle().pathForResource("movie", ofType: "m4v")!
        let moviePlayer: AVPlayer = AVPlayer(URL: NSURL(fileURLWithPath: movieFilename))
        let playerViewController: AVPlayerViewController = childViewControllers.last as! AVPlayerViewController
        playerViewController.player = moviePlayer
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playMovieFinished:",
            name: AVPlayerItemDidPlayToEndTimeNotification, object: moviePlayer.currentItem)
    }
    
    
    func playMovieFinished(notification: NSNotification) {
        let playerViewController: AVPlayerViewController = childViewControllers.last as! AVPlayerViewController
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: AVPlayerItemDidPlayToEndTimeNotification , object: playerViewController.player!.currentItem)
        playerViewController.player = nil
    }
    
    @IBAction func recordAudio(sender: AnyObject) {
        if recordButton.titleLabel!.text == "Record Audio" {
            audioRecorder.record()
            recordButton.setTitle("Stop Recording", forState: UIControlState.Normal)
        } else {
            audioRecorder.stop()
            recordButton.setTitle("Record Audio", forState: UIControlState.Normal)
        }
        
        let soundFileURL: NSURL = NSURL.fileURLWithPath(NSTemporaryDirectory()+"sound.caf")
        audioPlayer = try? AVAudioPlayer(contentsOfURL: soundFileURL)
    }
    
    @IBAction func playAudio(sender: AnyObject) {
        audioPlayer.play()
    }
    
    @IBAction func chooseImage(sender: AnyObject) {
        let imagePicker: UIImagePickerController = UIImagePickerController()
        
        if toggleCamera.on {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        imagePicker.delegate = self
        
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.Popover
        if (imagePicker.popoverPresentationController != nil) {
            imagePicker.popoverPresentationController!.sourceView =
                sender as! UIButton
            imagePicker.popoverPresentationController!.sourceRect =
                (sender as! UIButton).bounds
        }
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func applyFilter(sender: AnyObject) {
        let imageToFilter: CIImage = CIImage(image: self.displayImageView.image!)!
        
        let activeFilter: CIFilter = CIFilter(name: "CISepiaTone")!
        activeFilter.setDefaults()
        activeFilter.setValue(0.75, forKey: "inputIntensity")
        activeFilter.setValue(imageToFilter, forKey: "inputImage")
        
        let filteredImage: CIImage = activeFilter.valueForKey("outputImage") as! CIImage
        
        let myNewImage: UIImage = UIImage(CIImage: filteredImage)
        displayImageView.image = myNewImage
    }
    
    @IBAction func chooseMusic(sender: AnyObject) {
        musicPlayer.stop()
        displayNowPlaying.text = "No Song Playing"
        musicPlayButton.setTitle("Play Music", forState: UIControlState.Normal)
        
        let musicPicker: MPMediaPickerController =
        MPMediaPickerController(mediaTypes: MPMediaType.Music)
        musicPicker.prompt = "Choose Songs to Play"
        musicPicker.allowsPickingMultipleItems = true
        musicPicker.delegate = self
        
        musicPicker.modalPresentationStyle = UIModalPresentationStyle.Popover
        if (musicPicker.popoverPresentationController != nil) {
            musicPicker.popoverPresentationController!.sourceView =
                sender as! UIButton
            musicPicker.popoverPresentationController!.sourceRect =
                (sender as! UIButton).bounds
        }
        
        presentViewController(musicPicker, animated: true, completion: nil)
    }
    
    @IBAction func playMusic(sender: AnyObject) {
        if musicPlayButton.titleLabel!.text == "Play Music" {
            musicPlayer.play()
            musicPlayButton.setTitle("Pause Music", forState: UIControlState.Normal)
            
            let currentSong: MPMediaItem = musicPlayer.nowPlayingItem!
            displayNowPlaying.text = currentSong.valueForProperty(MPMediaItemPropertyTitle) as! String!
        } else {
            musicPlayer.pause()
            musicPlayButton.setTitle("Play Music", forState: UIControlState.Normal)
            displayNowPlaying.text = "No Song Playing"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        // Setup the audio recorder
        let soundFileURL: NSURL = NSURL.fileURLWithPath(NSTemporaryDirectory()+"sound.caf")
        
        let soundSetting = [
            AVSampleRateKey: 44100.0,
            AVFormatIDKey: NSNumber(unsignedInt:kAudioFormatMPEG4AAC),
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.High.rawValue
        ]
        
        audioRecorder = try? AVAudioRecorder(URL: soundFileURL,
            settings: soundSetting)
        
        // Setup the audio player
        let noSoundFileURL: NSURL =
        NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("norecording", ofType: "wav")!)
        audioPlayer = try? AVAudioPlayer(contentsOfURL: noSoundFileURL)
        
        //Setup the music player
        musicPlayer = MPMusicPlayerController.systemMusicPlayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        musicPlayer.setQueueWithItemCollection(mediaItemCollection)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        displayImageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage!
    }
    
    
}
