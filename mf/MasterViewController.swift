//
//  MasterViewController.swift
//  MyFaves2
//
//  Created by Charles Konkol on 6/26/21.
//  Copyright © 2021 RockValleyCollege. All rights reserved.
//  Updated 6/26/21

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    // 1) comment out var objects line
    //var objects = [Any]()
    
    // 2) declare and initialize two arrays
    var ListOfPhotos:[UIImage] = []
    var ListOfFavs:[String]?
    var FavDetails:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 3) Comment out below lines
        //        navigationItem.leftBarButtonItem = editButtonItem
        //
        //        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        //        navigationItem.rightBarButtonItem = addButton
        //        if let split = splitViewController {
        //            let controllers = split.viewControllers
        //            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        //        }
        
        // 4) Add items to 2 arrays
        //Menus
        ListOfPhotos = [
            UIImage(named: "FoTR.jpg")!,
            UIImage(named: "TT.jpg")!,
            UIImage(named: "RoTK.jpg")!,
            UIImage(named: "Fallout.jpeg")!,
            UIImage(named: "Godfather.jpg")!,
            UIImage(named: "IronMan.jpg")!,
            UIImage(named: "GOTG.jpg")!,
            UIImage(named: "InfinityWar.jpg")!,
            UIImage(named: "Inglorious.jpg")!,
            UIImage(named: "Hoosiers.jpg")!
        ]
        
        ListOfFavs = ["The Lord of the Rings: The Fellowship of the Ring","The Lord of the Rings: The Two Towers","The Lord of the Rings: The Return of the King", "Mission: Impossible - Fallout","The Godfather","Iron Man","Guardians of the Galaxy","Avengers: Infinity War","Inglourious Basterds","Hoosiers"]
        FavDetails = ["https://www.imdb.com/title/tt0120737/?ref_=nv_sr_srsg_0","https://www.imdb.com/title/tt0167261/?ref_=nv_sr_srsg_6","https://www.imdb.com/title/tt0167260/?ref_=nv_sr_srsg_3", "https://www.imdb.com/title/tt4912910/?ref_=nv_sr_srsg_2","https://www.imdb.com/title/tt0068646/?ref_=nv_sr_srsg_0","https://www.imdb.com/title/tt0371746/?ref_=nv_sr_srsg_3","https://www.imdb.com/title/tt2015381/?ref_=nv_sr_srsg_0","https://www.imdb.com/title/tt4154756/?ref_=nv_sr_srsg_0","https://www.imdb.com/title/tt0361748/?ref_=nv_sr_srsg_1","https://www.imdb.com/title/tt0091217/?ref_=nv_sr_srsg_0"]
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 5) Comment out func insertNewObject.
    //Select from line finc InsertNewObject to }
    //and use shortcut command: [Command] [/] to comment all lines
    
    //    func insertNewObject(_ sender: Any) {
    //        objects.insert(NSDate(), at: 0)
    //        let indexPath = IndexPath(row: 0, section: 0)
    //        tableView.insertRows(at: [indexPath], with: .automatic)
    //    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                // 6) replace code with below code until line 75
                let object = FavDetails![indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.weburl = (object as AnyObject as? String)!
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = ListOfFavs![indexPath.row]
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 7) Replace objects.count with ListOfFavs!.count
        return ListOfFavs!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 8) Replace code with below code until }
        cell.textLabel!.text = ListOfFavs![indexPath.row]
        let imagename:UIImage = ListOfPhotos[indexPath.row]
        cell.imageView?.image = imagename.resize(maxWidthHeight: 30)
        cell.detailTextLabel?.text = ">>"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        //9) Make below false
        return false
    }
    
    // 10) Comment out override func tableView(tableView  - shortcut command: [Command] [/]
    
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            objects.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //        } else if editingStyle == .insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    //        }
    //    }
    
    
}
//10 Add image extension
extension UIImage {
    
    func resize(maxWidthHeight : Double)-> UIImage? {
        
        let actualHeight = Double(size.height)
        let actualWidth = Double(size.width)
        var maxWidth = 0.0
        var maxHeight = 0.0
        
        if actualWidth > actualHeight {
            maxWidth = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualWidth)
            maxHeight = (actualHeight * per) / 100.0
        }else{
            maxHeight = maxWidthHeight
            let per = (100.0 * maxWidthHeight / actualHeight)
            maxWidth = (actualWidth * per) / 100.0
        }
        
        let hasAlpha = true
        let scale: CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: maxWidth, height: maxHeight), !hasAlpha, scale)
        self.draw(in: CGRect(origin: .zero, size: CGSize(width: maxWidth, height: maxHeight)))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
}
