//
//  ViewController.swift
//  Wishlist
//
//  Created by Sem Schilder on 20/05/2016.
//  Copyright © 2016 D3 - Creative Agency. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var products : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        makeSampleProduct()
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Product")
        var results : [AnyObject]?
        
        do {
            results = try context.executeFetchRequest(request)
        }catch{
            results = nil
        }
        
        if results != nil{
            self.products = results as! [Product]
        }
    }
    
    func makeSampleProduct(){
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let product = NSEntityDescription.insertNewObjectForEntityForName("Product", inManagedObjectContext: context) as! Product
        product.title = "shoes"
        product.image = UIImageJPEGRepresentation(UIImage(named: "CK-Faktum-51-1.jpg")!, 1)
        
        do {
            try context.save()
        }catch{
            print("Oh noes, something went wrong")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let product = self.products[indexPath.row]
        cell.textLabel!.text = product.title
        cell.imageView?.image = UIImage(data: product.image!)
        return cell
    }


}

