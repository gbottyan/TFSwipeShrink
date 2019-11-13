//
//  ExampleViewController.swift
//  TFSwipeShrink
//
//  Created by Taylor Franklin on 2/16/15.
//  Copyright (c) 2015 Taylor Franklin. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation
import AVKit
class SampleViewController: UIViewController {
    
    
    var swipeShrinkView: TFSwipeShrinkView =  TFSwipeShrinkView(frame: CGRect.zero)
    var moviePlayerController: AVPlayerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(swipeShrinkView)
        swipeShrinkView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height / 2.0)
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)

        moviePlayerController = AVPlayerViewController()
        moviePlayerController.videoGravity = .resizeAspectFill
        moviePlayerController.player = player

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        swipeShrinkView.configureSizeAndPosition(self.view.frame)
        moviePlayerController.view.frame = CGRect(x: 0, y: 0, width: swipeShrinkView.frame.size.width, height: swipeShrinkView.frame.size.height)
        swipeShrinkView.addSubview(moviePlayerController.view)
        moviePlayerController.player?.pause()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playMovie(_ sender: AnyObject) {
        
        self.swipeShrinkView.isHidden = false
        UIView.animate(withDuration: 0.4, animations: {
            self.swipeShrinkView.alpha = 1.0
        }, completion: {(done: Bool) in
           // self.moviePlayerController.player?.play()
        })
        
    }

}
