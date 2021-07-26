//
//  ProductViewController.swift
//  E-commerce
//
//  Created by Divya on 18/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit
import Firebase

class ProductViewController: UIViewController {
    var product : [Product] = []
    var category : Category!
    let db = Firestore.firestore()
    var listener : ListenerRegistration!
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //it is called every time view appear
        
        setCategoriesListener()
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        listener.remove()
        product.removeAll()
        tableview.reloadData()
    }
    
    
    func setCategoriesListener()
    {
        listener = db.products(category: category.id).addSnapshotListener({ (snapshot, error) in
            if let err = error
            {
                print(err.localizedDescription)
                return
            }
            
            snapshot?.documentChanges.forEach({ (change) in
                let data = change.document.data()
                let newProduct = Product.init(data: data)
                switch change.type
                {
                case .added:
                    self.onDocumentAdded(change: change, productdoc: newProduct)
                case .modified:
                    self.onDocumentModified(change: change, productdoc: newProduct)
                case .removed:
                    self.onDocumentRemoved(change: change)
                }
                
            })
        })
    }
    
    
    
}
extension ProductViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        cell.configureCell(product: product[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        let selectedproduct = product[indexPath.row]
        vc.product = selectedproduct
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    func onDocumentAdded(change : DocumentChange, productdoc: Product)
    {
        let newindex = Int(change.newIndex)
        product.insert(productdoc, at: newindex)
        
        tableview.insertRows(at: [IndexPath(item: newindex, section: 0)], with: .fade)
        
    }
    func onDocumentModified(change: DocumentChange, productdoc: Product)
    {
        if change.newIndex == change.oldIndex
        {
            let index = Int(change.newIndex)
            product[index] = productdoc
            
            tableview.reloadRows(at:  [IndexPath(item: index, section: 0)], with: .none)
        }else{
            let newindex = Int(change.newIndex)
            let oldindex = Int(change.oldIndex)
            product.remove(at: oldindex)
            product.insert(productdoc, at: newindex)
            
            tableview.moveRow(at: IndexPath(item: oldindex, section: 0), to: IndexPath(item: newindex, section: 0))
             
        }
            
        
    }
    func onDocumentRemoved(change : DocumentChange)
    {
        let oldindex = Int(change.oldIndex)
        product.remove(at: oldindex)
        tableview.deleteRows(at: [IndexPath(item: oldindex, section: 0)], with: .automatic)
    }
    
}
