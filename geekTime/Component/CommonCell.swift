//
//  CommonCell.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/9.
//

import Foundation
import UIKit
import SnapKit

class CommonCell: UIControl {
    var title: String?{
        didSet{
            self.titleLabel.text = self.title
        }
    }
    
    var icon: UIImage!{
        didSet{
            self.iconImageView.image = self.icon
        }
    }
    var highLightView: UIView
    var titleLabel: UILabel
    var iconImageView: UIImageView
    var bottomLine: UIView
    var rightArrow: UIImageView
    
    override init(frame: CGRect) {
        highLightView = UIView()
        titleLabel = UILabel()
        iconImageView = UIImageView()
        bottomLine = UIView()
        rightArrow = UIImageView(image: R.image.icon_right_arrow())
        
        super.init(frame: frame)
        setupSubviews()
        ///这种方式没有重写isHighlighted方法动效好
//        self.addTarget(self, action: #selector(didSelectRow), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        self.addSubview(highLightView)
        
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        self.addSubview(rightArrow)
        self.addSubview(bottomLine)
        
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = UIColor.hexColor(0x222222)
        
        highLightView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        highLightView.isHidden = true
        highLightView.alpha = 0
        
        highLightView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.right.equalTo(rightArrow.snp.left).offset(-10)
        }
        
        rightArrow.snp.makeConstraints { make in
            make.right.equalTo(-15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(15)
        }
        
        bottomLine.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }

    }
    
    override var isHighlighted: Bool{
        didSet {
            if self.isHighlighted {
                self.highLightView.alpha = 1
                self.highLightView.isHidden = false
            }else {
                UIView.animate(withDuration: 0.5) {
                    self.highLightView.alpha = 0;
                } completion: { finish in
                    self.highLightView.isHidden = true
                }
            }
        }
    }
    
    @objc func didSelectRow(){
        
        self.highLightView.isHidden = false
        self.highLightView.alpha = 1

        UIView.animate(withDuration: 0.65) {
            self.highLightView.alpha = 0
        } completion: { finish in
            self.highLightView.isHidden = true
        }
    }
    
}
