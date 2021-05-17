//
//  HomeViewController.swift
//  United Pixels
//
//  Created by Ideal Cocaj on 20.3.21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var lista:[HomeModel] = []
    var filteredList: [HomeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateList()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = flowLayout
        
        
        // Do any additional setup after loading the view.
    }
    
    func populateList(){
        let item1 = HomeModel(homeImage: "Vegtables", homeTittle: "Vegetables", homePrice: 0.70, homeWeight: "1kg", homeOrigin: "Krushe", homeDescription: "Specat(Baburet)", homeItemsLeft: 12)
        
        let item2 = HomeModel(homeImage: "Fruits", homeTittle: "Fruits", homePrice: 1.00, homeWeight: nil, homeOrigin: "Rahovec", homeDescription: "Rrushat ma t'mire ever", homeItemsLeft: 35)
        
        let item3 = HomeModel(homeImage: "Bread", homeTittle: "Bread", homePrice: 0.30, homeWeight: "450g", homeOrigin: "Hasi", homeDescription: "Buke okej", homeItemsLeft: 80)
        
        let item4 = HomeModel(homeImage: "Cakes", homeTittle: "Cakes", homePrice: 1.00, homeWeight: "100g", homeOrigin: "Tetova", homeDescription: "Nese sbesoni shkoni ne Elide", homeItemsLeft: 3)
        
        lista.append(contentsOf: [item1, item2, item3, item4])
        filteredList = lista
    }
    
    func searchListFor(text: String){
        filteredList.removeAll()
        if text.isEmpty{
            filteredList = lista
        }else{
        for item in lista {
            if item.homeTittle.lowercased().contains(text.lowercased()) || item.homeOrigin.lowercased().contains(text.lowercased()){
                filteredList.append(item)
            }
        }
    }
        self.collectionView.reloadData()
    }
    
    @IBAction func didPressedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCellIdentifier", for: indexPath) as? HomeCollectionViewCell{
            let item = filteredList[indexPath.item]
            
            
            cell.itemImage.image = UIImage(named: item.homeImage)
            cell.itemTittle.text = item.homeTittle
            cell.itemsLeft.text = "(\(item.homeItemsLeft))"
            return cell
        }
        return UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.collectionView.bounds.width/2-10, height: 211)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = filteredList[indexPath.item]
        if let detailController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeDetailViewController") as? HomeDetailViewController{
            detailController.model = item
            self.navigationController?.pushViewController(detailController, animated: true)
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      searchListFor(text: searchText)
    }
}
