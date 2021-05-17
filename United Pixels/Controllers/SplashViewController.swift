//
//  SplashViewController.swift
//  United Pixels
//
//  Created by Ideal Cocaj on 17.3.21.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var subtittleLabel: UILabel!
    @IBOutlet weak var orderNowButton: UIButton!
    @IBOutlet weak var bottomSheetImageIconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomSheetView.layer.cornerRadius = 16        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressOrderNowButton(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let tabBarController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
            self.navigationController?.pushViewController(tabBarController, animated: true)
        } else {
            // Fallback on earlier versions
        }
        print("This button ORDER NOW is pressed")
    }
}
