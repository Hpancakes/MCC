//
//  ComicViewController.swift
//  My ComicBook Collection
//
//  Created by JoseLuis Lara VIllanueva on 7/16/17.
//  Copyright © 2017 Pachuca Inc. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var NameComicTxtField: UITextField!
    @IBOutlet weak var sagaTxtField: UITextField!
    @IBOutlet weak var numeroTxtField: UITextField!
    @IBOutlet weak var CompañiaTxtField: UITextField!
    @IBOutlet weak var PortadaImgView: UIImageView!
 
    
    var imagePicker = UIImagePickerController()
    var comic : ComicBook? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker.delegate = self
       

    }

    @IBAction func CameraBtn(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func PhotosBtn(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        PortadaImgView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
   
    
    @IBAction func addmeBtn(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let comicBook = ComicBook(context: context)
        comicBook.comicbName = NameComicTxtField.text
        comicBook.numbers = numeroTxtField.text
        comicBook.saga = sagaTxtField.text
        comicBook.portada = UIImagePNGRepresentation(PortadaImgView.image!)! as NSData
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
        
        
        
    }
    
    
 
    
}
