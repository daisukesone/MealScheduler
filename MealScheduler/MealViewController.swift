//
//  MealViewController.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/03/01.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit
import RealmSwift


class MealViewController: UIViewController {
    
    //Realmを使う
    let photo = Photo()
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ボタンを押したときの操作
    @IBAction func choiceMeal(sender: UIButton){
        
        
        let takenPhoto = realm.object(ofType: Photo.self, forPrimaryKey: "id")
        
        //idが0のときとそれ以外で場合分け
        if takenPhoto?.id == 0{
        
            
        performSegueToPhotoView()
        } else {
        
        performSegueToResultView()
        }
    }
    
    func performSegueToPhotoView() {
        performSegue(withIdentifier: "toPhotoView", sender: nil)
    }
    
    func performSegueToResultView() {
        performSegue(withIdentifier: "toResultView", sender: nil)
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


