//
//  ViewController.swift
//  My ComicBook Collection
//
//  Created by JoseLuis Lara VIllanueva on 7/15/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var comics : [ComicBook] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        comics = try context.fetch(ComicBook.fetchRequest())
            tableView.reloadData()
        } catch{
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comic = comics[indexPath.row]
        performSegue(withIdentifier: "myComics", sender: comic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{ let nextVC = segue.destination as! ComicViewController
        nextVC.comic = sender as? ComicBook
        } 
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let comic = comics[indexPath.row]
        let comicNumero = comics[indexPath.row]
        cell.textLabel?.text = comic.comicbName
        cell.detailTextLabel?.text = comicNumero.numbers
        cell.imageView?.image = UIImage(data: comic.portada! as Data)
        return cell
    }
    
    


}

