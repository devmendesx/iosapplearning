//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let storyService = StoryService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(story: storyService.stories[0])
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let story: Story = storyService.checkChoice(currentAnswer: sender.currentTitle!)
        self.updateUI(story: story)
    }
    
    func updateUI(story: Story?){
            storyLabel.text = story?.title
            choice1Button.setTitle(story?.choice1.description, for: .normal)
            choice2Button.setTitle(story?.choice2.description, for: .normal)
    }
}

