//
//  MealViewController.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/03/01.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choiceMeal(sender: UIButton){
        performSegueToPhotoView()
    }
    
    func performSegueToPhotoView() {
        performSegue(withIdentifier: "toPhotoView", sender: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
