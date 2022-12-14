//
//  DealListCell.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/11.
//

import Foundation
import UIKit

class DealListCell: CommonListCell<Deal>{
    var progressLabel: UILabel
    var productImageView: UIImageView
    
    override var item: Deal?{
        didSet {
            if let p = self.item {
                progressLabel.text = "已经学习了 \(p.progress)%"
                textLabel?.text = p.product.name
                detailTextLabel?.text = p.product.desc
                productImageView.kf.setImage(with: URL(string: p.product.imageUrl))
            }
          
        }
    }
    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        progressLabel = UILabel()
        productImageView = UIImageView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("不支持初始化")
    }
    
    func setupSubviews() {
        
        progressLabel.textColor = UIColor.hexColor(0xF50200)
        textLabel?.font = UIFont.systemFont(ofSize: 18)
        detailTextLabel?.textColor = UIColor.lightGray
        detailTextLabel?.numberOfLines = 2;
        
        contentView.addSubview(productImageView)
        contentView.addSubview(progressLabel)
        
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
        
        progressLabel.snp.makeConstraints({ make in
            make.left.right.equalTo(textLabel!)
            make.top.equalTo(textLabel!.snp.bottom).offset(10)
        })
        
        detailTextLabel?.snp.makeConstraints({ make in
            make.left.right.equalTo(textLabel!)
            make.top.equalTo(progressLabel.snp.bottom).offset(10)
        })
        
    }
}

