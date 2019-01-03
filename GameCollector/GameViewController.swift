//
//  GameViewController.swift
//  GameCollector
//
//  Created by Morgan Hondros on 1/2/19.
//  Copyright © 2019 Morgan Hondros. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        gameImageView.image = image
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func addTapped(_ sender: Any) {
      let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let game = Game(context: context)
        game.title = titleTextField.text
        game.image = gameImageView.image!.pngData()
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: (true))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
