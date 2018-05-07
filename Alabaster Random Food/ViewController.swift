//
//  ViewController.swift
//  Alabaster Random Food
//
//  Created by Michael Hinson on 3/6/18.
//  Copyright © 2018 Michael Hinson. All rights reserved.
//

import UIKit
//Adds an array to UISwitch to allow for attachment of data to switch. Allows access with for each loop
class UISwitchWithArray : UISwitch {
    open var array: [String]!
}
class ViewController: UIViewController {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var toggleAllSwitch: UISwitch!
    @IBOutlet weak var americanSwitch: UISwitchWithArray!
    @IBOutlet weak var healthySwitch: UISwitchWithArray!
    @IBOutlet weak var mexicanSwitch: UISwitchWithArray!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var asianSwitch: UISwitchWithArray!
    @IBOutlet weak var italianSwitch: UISwitchWithArray!
    @IBOutlet weak var fastFoodSwitch: UISwitchWithArray!
    @IBOutlet weak var otherSwitch: UISwitchWithArray!
    @IBOutlet var switchArray: [UISwitchWithArray]!//Contains all switches besides toggle switch
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = " "
        rollButton.layer.cornerRadius = 10
        rollButton.layer.borderWidth = 1
        myImageView.layer.zPosition = -5
        createArrays()//Populates restaurant arrays
        switchAction(toggleAllSwitch) //Populates Selected view with all restaurants to begin with
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Flips all switches on or off based on Toggle all Switch
    @IBAction func toggleSwitchAction(_ sender: Any) {
        if toggleAllSwitch.isOn == true {
            for element in switchArray {
                element.isOn = true
            }
        } else {
            for element in switchArray {
                element.isOn = false
            }
        }
        switchAction(toggleAllSwitch)
    }
    //Clears selected restaurants array then adds toggled on switches to selected restaurants array
    @IBAction func switchAction(_ sender: Any) {
        selectedRestaurants.removeAll()
        for element in switchArray {
            if element.isOn == true {
                selectedRestaurants += element.array
            }
        }
        if selectedRestaurants.isEmpty {
            selectedRestaurants.append("Select a genre")
        }
    }
    
    //Rolls for restaurant
    @IBAction func rollAction(_ sender: Any) {
        let randomNumber = random(arrayCount: selectedRestaurants.count)
        if !selectedRestaurants.isEmpty {
            resultsLabel.text = selectedRestaurants[randomNumber]
            selectedRestaurants.remove(at: randomNumber)
        }
        else {
            resultsLabel.text = "No remaining restaurants"
        }
        
    }
    
    //Generates a random number from 0 to array count-1
    func random(arrayCount: Int) -> Int {
        return Int(arc4random_uniform(UInt32(arrayCount)))
    }
    //Creation of arrays
    var selectedRestaurants = [String]()
    func createArrays() {
        americanSwitch.array = ["O'Charleys", "Ruby Tuesday", "Longhorn Steakhouse", "Panera Bread", "Jim 'N Nicks BBQ", "Full Moon BBQ", "Cracker Barrel", "The Depot", "Buffalo Wild Wings", "Buck Creek Pizza"]
        healthySwitch.array = ["Panera Bread", "Taziki's", "Ruby Tuesday's", "Buffalo Wild Wings", "Firehouse Subs", "Mama Goldberg's", "Moe's", "Zaxby's"]
        asianSwitch.array = ["Hunan 2", "Hibachi Super Buffet", "Mizu", "Panda House", "Panda Express","Ichicoro Imoto"]
        italianSwitch.array = ["Joe's Italian", "Olive Garden"]
        fastFoodSwitch.array = ["McDonald's", "Wendy's", "Burger King", "Taco Bell", "Steak and Shake", "Dairy Queen", "Hardee's", "Arby's", "Chick-Fil-A", "Zaxby's", "Dominoes", "Jimmy Johns", "Moe's", "Whataburger"]
        mexicanSwitch.array = ["Habaneros", "Del Toro", "LA Burrito", "Sol Azteca"]
        otherSwitch.array = ["The Purple Onion", "Taziki's", "Pizitz Food Hall" ]
    }

}

