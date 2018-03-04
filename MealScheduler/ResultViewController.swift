//
//  ResultViewController.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/03/03.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    
    @IBOutlet var resultImageView: UIImageView!
    
    let photo = Photo()
    
    let realm = try! Realm()
    
   // var photos = realm.objects(Photo).filter("id = 1").sorted(byKeyPath: "id")
    
    var resultImageview = photos

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
