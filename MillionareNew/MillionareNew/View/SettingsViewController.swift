//
//  SettingsViewController.swift
//  MillionareNew
//
//  Created by Ованес Захарян on 20.05.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .serialQuestions
        case 1:
            return .randomQuestions
        default:
            return .serialQuestions
        }
    }
    
    
    
   
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "settingsGame":
            guard let destination = segue.destination as? GameViewController else {return}
            
            destination.difficulty = selectedDifficulty
        default:
            break
        }
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        Game.shared.stateSegmentControl = selectedDifficulty

        dismiss(animated: true, completion: nil)
    }
    
    
//    var segmentControlSettings = UISegmentedControl()
//
//
//    func addComponents() {
//        segmentControlSettings = UISegmentedControl(frame: CGRect(x: 25, y: 150, width: 150, height: 50))
//        segmentControlSettings.numberOfSegments
//    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 


}
