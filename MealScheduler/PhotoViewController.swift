//
//  PhotoViewController.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/03/01.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var cameraImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //撮影するときのメソッド
    @IBAction func useCamera(){
        //カメラが使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //カメラを起動
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else{
            //カメラを使えない時はエラーがコンソールに出ます
            print("error")
        }
        
    }
    
    //カメラ、カメラロールを使ったときに選択した画像をアプリ内に表示するためのメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
        
    
    //保存するときのメソッド
    @IBAction func save(){
        
        UIImageWriteToSavedPhotosAlbum(cameraImageView.image!, nil, nil, nil)
        
        //アラートを表示する
        let alert: UIAlertController = UIAlertController(title: "保存",
                                                         message: "画像を保存します",
                                                         preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { action in
                                        //ボタンが押された時の動作
                                        print("OKボタンが押されました")
                                                }
                                     )
        )
        //キャンセルボタン
        alert.addAction(UIAlertAction(title: "キャンセル",
                                      style: .cancel,
                                      handler: {action in
                                        print("キャンセル")
                                        
                                                }
                                      )
        )
    }
    
                                        
                                        
                                        
        
       
    //snsに投稿する
    @IBAction func share(_ sender: UIBarButtonItem) {
        let controller = UIActivityViewController(activityItems: [cameraImageView.image!], applicationActivities: nil)
        
        self.present(controller, animated: true, completion: nil)
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
