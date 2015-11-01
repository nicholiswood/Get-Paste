//
//  ViewController.swift
//  Get Paste
//
//  Created by Nicholis Wood on 10/19/15.
//  Copyright © 2015 Nicholis Wood. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    
    //ADDED TO GITHUB
    @IBOutlet weak var iosVersionLabel: UILabel!
    @IBOutlet weak var introducedPhrase: UILabel!
    @IBOutlet weak var clipText: UILabel!
    
    //get the string from pasteboard
    var pasteboardString:String! = UIPasteboard.generalPasteboard().string
    //get iOS version of user
    let iosversion = UIDevice.currentDevice().systemVersion
    
    
    
    @IBAction func devButton(sender: AnyObject) {
        //iosVersionLabel.text = "iOS Version: \(iosversion)"
        print(iosversion)
    }
    
    
    @IBAction func getClip(sender: AnyObject) {
        //let may cause crash, consider changing to var
        let pasteboardString:String! = UIPasteboard.generalPasteboard().string
        clipText.text = pasteboardString
        //need to turn this into a string somehow String(pasteboardString) does not work.
        
        introducedPhrase.text = "This is what is on your clipboard:"
        
    }

    
    @IBAction func tweetAction(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            
            let tweetController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)

            
            tweetController.setInitialText("Here's what was on my clipboard: \(pasteboardString)")
            
            
            self.presentViewController(tweetController, animated: true, completion: nil)
        } else {
            
            let alert = UIAlertController(title: "Account Problem 😓", message: "Please log into your twitter!", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Settings", style: UIAlertActionStyle.Default, handler: {
                (UIAlertAction) in
                
                let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)
                
                if let url = settingsURL{
                    UIApplication.sharedApplication().openURL(url)
                }
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

