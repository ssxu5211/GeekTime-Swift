//
//  ProductList.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/8.
//

import Foundation
import UIKit
class ProductCell: CommonListCell<Product>{
    var priceLabel: UILabel
    var productImageView: UIImageView
    
    override var item: Product?{
        didSet {
            if let p = self.item {
                priceLabel.text = "￥\(p.price)"
                textLabel?.text = p.name
                detailTextLabel?.text = p.desc
                productImageView.kf.setImage(with: URL(string: p.imageUrl))
            }
          
        }
    }
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        priceLabel = UILabel()
        productImageView = UIImageView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("不支持初始化")
    }
    
    func setupSubviews() {
        
        priceLabel.textColor = UIColor.hexColor(0xF50200)
        textLabel?.font = UIFont.systemFont(ofSize: 18)
        detailTextLabel?.textColor = UIColor.lightGray
        detailTextLabel?.numberOfLines = 2;
        
        contentView.addSubview(productImageView)
        contentView.addSubview(priceLabel)
        
        productImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(100)
        }
        
        textLabel?.snp.makeConstraints({ make in
            make.left.equalTo(productImageView.snp.right).offset(15)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-15)
        })
        
        priceLabel.snp.makeConstraints({ make in
            make.left.right.equalTo(textLabel!)
            make.top.equalTo(textLabel!.snp.bottom).offset(10)
        })
        
        detailTextLabel?.snp.makeConstraints({ make in
            make.left.right.equalTo(textLabel!)
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
        })
        
    }
}

//protocol ProductListDelegate:AnyObject{
//    func didSelectProduct(_ product: Product,atIndexPath indexPath:IndexPath)
//}
//
//class ProductList: UIView, UITableViewDataSource, UITableViewDelegate{
//    
//    var tableView: UITableView
//    var items: [Product] {
//        didSet{
//            self.tableView.reloadData()
//        }
//    }
//    weak var delegate: ProductListDelegate?
//    
//    let cellId: String  = "cellId"
//    
//    override init(frame: CGRect) {
//        tableView = UITableView(frame: .zero, style: .plain)
//        tableView.rowHeight = 120
//        items = [Product]()
//        super.init(frame: frame)
//        self.setupSubviews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("不支持init(coder:)初始化方法")
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? ProductCell
//        if cell == nil {
//            cell = ProductCell.init(style: .subtitle, reuseIdentifier: cellId)
//        }
//        cell?.item = items[indexPath.row]
//        return cell!
//    }
//  
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let delegate = self.delegate{
//            let product =  items[indexPath.row]
//            delegate.didSelectProduct(product, atIndexPath: indexPath)
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }
//    
//    func setupSubviews() {
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.tableFooterView = UIView()
////        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
//        self.addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//    
//    
//}
