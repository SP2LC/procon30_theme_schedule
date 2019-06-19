//
//  ViewController.swift
//  Schedule
//
//  Created by 垣内悠人 on 2019/06/11.
//  Copyright © 2019 垣内悠人. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var TableView: UITableView!
    
    //配列fruitsを設定
    var fruits = ["apple", "orange", "melon", "banana", "pineapple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 編集ボタンを左上に配置
        navigationItem.rightBarButtonItem = editButtonItem
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //cellの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    //tableViewの表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SampleCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = fruits[indexPath.row]
        
        return cell
    }
    
    //cellの追加
    @IBAction func tapAdd(sender: AnyObject) {
        // myItemsに追加.
        fruits.append("タイトルNEW")
        // TableViewを再読み込み.
        TableView.reloadData()
    }

    //editボタンが押された時の処理
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        TableView.isEditing = editing
    }
    /*
    //cellを削除可能に
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    //cellの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            fruits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    /*
    //cellを並び替え可能に
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //sourceIndexPath にデータの元の位置、destinationIndexPath に移動先の位置
        //CellValueを取得
        let targetTitle = fruits[sourceIndexPath.row]
        //元の位置のデータを配列から削除
        fruits.remove(at:sourceIndexPath.row)
        //移動先の位置にデータを配列に挿入
        fruits.insert(targetTitle, at: destinationIndexPath.row)
        
    }

}
