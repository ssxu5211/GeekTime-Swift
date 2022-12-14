//
//  CommonList.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/11.
//

import Foundation
import UIKit
import SnapKit

class CommonListCell<ItemType>: UITableViewCell{
    var item: ItemType?
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol CommonListDelegate: AnyObject {
    func didSelectItem<Item>(_ item: Item)
}
///泛型
class CommonList<ItemType, CellType: CommonListCell<ItemType>>: UIView, UITableViewDataSource, UITableViewDelegate{
    
    var tableView: UITableView
    var items: [ItemType] {
        didSet{
            self.tableView.reloadData()
        }
    }
    weak var delegate: CommonListDelegate?
    
    let cellId: String  = "cellId"
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = 120
        items = [ItemType]()
        super.init(frame: frame)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("不支持init(coder:)初始化方法")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? CellType
        if cell == nil {
            cell = CellType(style: .subtitle, reuseIdentifier: cellId)
            
        }
        cell?.item = items[indexPath.row]
        return cell!
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = self.delegate{
            let product =  items[indexPath.row]
            delegate.didSelectItem(product)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func setupSubviews() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
//        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}
