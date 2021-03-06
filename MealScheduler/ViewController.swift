//
//  ViewController.swift
//  MealScheduler
//
//  Created by 曽根大輔 on 2018/02/28.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit
import RealmSwift
import FSCalendar
import CalculateCalendarLogic





class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendar: FSCalendar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲートの設定
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
    }
    
    let japanese: Calendar = Calendar(identifier: .japanese)
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    //祝日判定を行い結果を返すメソッド(True: 祝日)
    func judgeHoliday(_ date: Date) -> Bool {
        // 祝日判定用にカレンダークラスのインスタンス
        let tmpCalender = Calendar(identifier: .japanese)
        
        //祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalender.component(.year, from: date)
        let month = tmpCalender.component(.month, from: date)
        let day = tmpCalender.component(.day, from: date)
        
        //CaltulateCalenderLogic(),祝日判定のインスタンスの生成
        let holiday = CalculateCalendarLogic()
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
        
    }
    //date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .japanese)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    
    //曜日判定(日曜日:1 〜 土曜日:7)
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .japanese)
        return tmpCalendar.component(.weekday, from: date)
        
        
    }
    
    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする（祝日は赤色で表示する）
        if self.judgeHoliday(date){
            return UIColor.red
        }
        
        //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {   //日曜日
            return UIColor.red
        }
        else if weekday == 7 {  //土曜日
            return UIColor.blue
        }
        
        return nil
    }
    
    //カレンダータップイベントの取得
    func calendar(_ calendar: FSCalendar,
                  didSelect date: Date,
                  at monthPosition: FSCalendarMonthPosition){
        
        let selectDay = getDay(date)
            
        performsegueToMealView()
        
        
        
    }
    
    //segueの設定
    func performsegueToMealView() {
        performSegue(withIdentifier: "toMealView", sender: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


