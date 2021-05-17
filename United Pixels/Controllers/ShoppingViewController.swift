//
//  ShoppingViewController.swift
//  United Pixels
//
//  Created by Ideal Cocaj on 3.4.21.
//

import UIKit

class ShoppingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells() 
      
    }
    
    func registerCells(){
        tableView.register(UINib(nibName: "ShoppingCell", bundle: nil), forCellReuseIdentifier: "ShoppingCell")
        tableView.register(UINib(nibName: "DeliveryCell", bundle: nil), forCellReuseIdentifier: "DeliveryCell")
        tableView.register(UINib(nibName: "OptionsCell", bundle: nil), forCellReuseIdentifier: "OptionsCell")
        tableView.register(UINib(nibName: "NonContactCell", bundle: nil), forCellReuseIdentifier: "NonContactCell")
    }
    @objc func didPressChangeButton(){
        if let paymentController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentViewController") as? PaymentViewController{
            self.navigationController?.pushViewController(paymentController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell", for: indexPath) as? ShoppingCell{
                cell.changeButton.addTarget(self, action: #selector(didPressChangeButton) , for: .touchUpInside)
                return cell
            }
            
        }
        else if indexPath.row == 1  {
          
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath) as? DeliveryCell{
                    return cell
                }
            
        } else if indexPath.row == 2 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "OptionsCell", for: indexPath) as? OptionsCell{
                return cell
            }
            
        }else if indexPath.row == 3 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NonContactCell", for: indexPath) as? NonContactCell{
                return cell
            }
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
        return 150
        } else if indexPath.row == 1{
            return 232
        } else if indexPath.row == 2{
            return 240
        } else if indexPath.row == 3 {
            return 90
        }
        return 0
    }
    
}
