//
//  ViewController.swift
//  MediaPlayground
//
//  Created by John Ray on 12/9/14.
//  Copyright (c) 2014 John E. Ray. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var toggleFullscreen: UISwitch!
    @IBOutlet weak var toggleCamera: UISwitch!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var displayNowPlaying: UILabel!
    @IBOutlet weak var musicPlayButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var movieRegion: UIView!
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var musicPlayer: MPMusicPlayerController!
    var moviePlayer: MPMoviePlayerController!
    
    
    @IBAction func playMovie(sender: AnyObject) {
        view.addSubview(moviePlayer.view)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playMovieFinished:",
            name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer)
        
        if toggleFullscreen.on {
            moviePlayer.setFullscreen(true, animated: true)
        }
        
        moviePlayer.play()
    }
    
    func playMovieFinished(notification: NSNotification) {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer)
        moviePlayer.view.removeFromSuperview()
    }

    @IBAction func recordAudio(sender: AnyObject) {
        if recordButton.titleLabel!.text == "Record Audio" {
            audioRecorder.record()
            recordButton.setTitle("Stop Recording", forState: UIControlState.Normal)
        } else {
            audioRecorder.stop()
            recordButton.setTitle("Record Audio", forState: UIControlState.Normal)
        }
        
        let soundFileURL: NSURL = NSURL.fileURLWithPath(NSTemporaryDirectory()+"sound.caf")!
        audioPlayer = AVAudioPlayer(contentsOfURL: soundFileURL, error: nil)
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
                sender as UIButton
            imagePicker.popoverPresentationController!.sourceRect =
                (sender as UIButton).bounds
        }
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func applyFilter(sender: AnyObject) {
        let imageToFilter: CIImage = CIImage(image: self.displayImageView.image)
        
        let activeFilter: CIFilter = CIFilter(name: "CISepiaTone")
        activeFilter.setDefaults()
        activeFilter.setValue(0.75, forKey: "inputIntensity")
        activeFilter.setValue(imageToFilter, forKey: "inputImage")
        
        let filteredImage: CIImage = activeFilter.valueForKey("outputImage") as CIImage
        
        let myNewImage: UIImage = UIImage(CIImage: filteredImage)!
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
                sender as UIButton
            musicPicker.popoverPresentationController!.sourceRect =
                (sender as UIButton).bounds
        }
        
        presentViewController(musicPicker, animated: true, completion: nil)
    }

    @IBAction func playMusic(sender: AnyObject) {
        if musicPlayButton.titleLabel!.text == "Play Music" {
            musicPlayer.play()
            musicPlayButton.setTitle("Pause Music", forState: UIControlState.Normal)
    
            let currentSong: MPMediaItem = musicPlayer.nowPlayingItem
            displayNowPlaying.text = currentSong.valueForProperty(MPMediaItemPropertyTitle) as String!
        } else {
            musicPlayer.pause()
            musicPlayButton.setTitle("Play Music", forState: UIControlState.Normal)
            displayNowPlaying.text = "No Song Playing"
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let movieFile: String =
            NSBundle.mainBundle().pathForResource("movie", ofType: "m4v")!
        moviePlayer =
            MPMoviePlayerController(contentURL: NSURL(fileURLWithPath: movieFile))
        moviePlayer.allowsAirPlay = true
        moviePlayer.view.frame=self.movieRegion.frame
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord,
            error: nil)
        
        // Setup the audio recorder
        let soundFileURL: NSURL = NSURL.fileURLWithPath(NSTemporaryDirectory()+"sound.caf")!
        let soundSetting: Dictionary<NSObject,AnyObject> = [AVSampleRateKey: 44100.0,
            AVFormatIDKey: kAudioFormatMPEG4AAC,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.High.rawValue]
        
        audioRecorder = AVAudioRecorder(URL: soundFileURL,
            settings: soundSetting, error: nil)
        
        // Setup the audio player
        let noSoundFileURL: NSURL =
            NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("norecording", ofType: "wav")!)!
        audioPlayer = AVAudioPlayer(contentsOfURL: noSoundFileURL, error: nil)
        
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
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController!, didPickMediaItems mediaItemCollection: MPMediaItemCollection!) {
        musicPlayer.setQueueWithItemCollection(mediaItemCollection)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        displayImageView.image = info[UIImagePickerControllerOriginalImage] as UIImage!
    }


}

