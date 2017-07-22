//
//  ComicSelectViewController.swift
//  My ComicBook Collection
//
//  Created by JoseLuis Lara VIllanueva on 7/22/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class ComicSelectViewController: UIViewController {
    
    var comic : ComicBook? = nil
    
    @IBOutlet weak var ComicTitle: UILabel!
    @IBOutlet weak var ComicTitle2: UILabel!
    @IBOutlet weak var sagaTitle: UILabel!
    @IBOutlet weak var numeroComic: UILabel!
    @IBOutlet weak var readSwitch: UILabel!
    @IBOutlet weak var fechaTitle: UILabel!
    @IBOutlet weak var portadaImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ComicTitle.text = comic?.comicbName
        ComicTitle2.text = comic?.comicbName
        sagaTitle.text = comic?.saga
        numeroComic.text = comic?.numbers
        
       // portadaImg = UIImagePNGRepresentation(PortadaImgView.image!)! as NSData
        

        // Do any additional setup after loading the view.
    }

    @IBAction func eraseBtn(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(comic!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }


}
