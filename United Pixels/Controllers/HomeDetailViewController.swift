//
//  HomeDetailViewController.swift
//  United Pixels
//
//  Created by Ideal Cocaj on 31.3.21.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    @IBOutlet weak var homeItemImage: UIImageView!
    @IBOutlet weak var homeItemPrice: UILabel!
    @IBOutlet weak var homeItemTittle: UILabel!
    @IBOutlet weak var homeItemWeight: UILabel!
    @IBOutlet weak var homeItemOrigin: UILabel!
    @IBOutlet weak var homeItemDescription: UILabel!
    @IBOutlet weak var homeItemLikeButton: UIButton!
    @IBOutlet weak var homeItemCartButton: UIButton!
    
    var model:HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        modifyUIButtons()
        fillDataFromModel()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    
    func modifyUIButtons(){
        homeItemLikeButton.layer.cornerRadius = 8
        homeItemCartButton.layer.cornerRadius = 8
        
        homeItemLikeButton.layer.borderColor = UIColor(red: 0.85, green: 0.817, blue: 0.892, alpha: 1).cgColor
        homeItemLikeButton.layer.borderWidth = 1
    }
    
    func fillDataFromModel() {
        if let model = model{
            homeItemImage.image = UIImage(named: model.homeImage)
            homeItemTittle.text = model.homeTittle
            homeItemPrice.text = "\(model.homePrice)"
            homeItemWeight.text = model.homeWeight
            homeItemOrigin.text = model.homeOrigin
            homeItemDescription.text = model.homeDescription
        }
    }
    @IBAction func didPressedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func didPressHomeItemLikeButton(_ sender: Any) {
        
        homeItemLikeButton.isSelected = !homeItemLikeButton.isSelected
        
        if homeItemLikeButton.isSelected {
            homeItemLikeButton.backgroundColor = .red
            homeItemLikeButton.setImage(UIImage(named: "Heart_Selected"), for: .normal)
            
        }
        else{
            homeItemLikeButton.backgroundColor = .white
            homeItemLikeButton.setImage(UIImage(named: "Heart"), for: .normal)
        }
    }
    
    
    
    @IBAction func didPressHomeItemCartButton(_ sender: Any) {
        
    }
    
}

