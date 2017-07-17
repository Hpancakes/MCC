//
//  ComicViewController.swift
//  My ComicBook Collection
//
//  Created by JoseLuis Lara VIllanueva on 7/16/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var NameComicTxtField: UITextField!
    @IBOutlet weak var sagaTxtField: UITextField!
    @IBOutlet weak var numeroTxtField: UITextField!
    @IBOutlet weak var CompañiaTxtField: UITextField!
    @IBOutlet weak var PortadaImgView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func CameraBtn(_ sender: Any) {
    }

    @IBAction func PhotosBtn(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

   
    @IBAction func dateBtn(_ sender: Any) {
    }
    
    @IBAction func addmeBtn(_ sender: Any) {
    }
 
    
}
