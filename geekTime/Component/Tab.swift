//
//  Tab.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/9.
//

import UIKit

class Tab: UIView {

    var items: [String]
    var itemButtons: [UIButton]
    var selectedItemButton: UIButton!
    
    var indicatorView: UIView?
    
    var selectedColor: UIColor? {
        didSet {
            if let color = self.selectedColor {
                self.indicatorView?.backgroundColor = selectedColor
                self.itemButtons.forEach { btn in
                    btn.setTitleColor(color, for: .selected)
                }
            }else {
                self.indicatorView?.backgroundColor = UIColor.hexColor(0xf88923)
                self.itemButtons.forEach { btn in
                    btn.setTitleColor(UIColor.hexColor(0xf88923), for: .selected)
                }
            }
        }
    }
    var normalColor: UIColor
    init?(items: [String]) {
        if items.count == 1 {
            return nil
        }
        self.items = items
        itemButtons = []
        normalColor = UIColor.hexColor(0x333333)
        selectedColor = UIColor.hexColor(0xf88923)
        super.init(frame: .zero)
        self.setupSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    func setupSubviews() {
        var lastBtn: UIButton?
        
        for index in 0..<items.count {
            let btn = UIButton(type: .custom)
            btn.setTitle(items[index], for: .normal)
            btn.setTitleColor(normalColor, for: .normal)
            btn.setTitleColor(selectedColor, for: .selected)
            
            self.addSubview(btn)
            btn.snp.makeConstraints { make in
                if index == 0 {
                    make.left.equalToSuperview()
                }else{
                    make.left.equalTo(lastBtn!.snp.right)
                    make.width.equalTo(lastBtn!)
                }
                if index == items.count - 1 {
                    make.right.equalToSuperview()
                }
                make.top.bottom.equalToSuperview()
            }
            if index == 0 {
                btn.isSelected = true
                selectedItemButton = btn;
                indicatorView = UIView();
                indicatorView?.backgroundColor = selectedColor
                indicatorView?.layer.cornerRadius = 2;
                self.addSubview(indicatorView!)
                indicatorView?.snp.makeConstraints({ make in
                    make.centerX.bottom.equalTo(btn)
                    make.width.equalTo(40)
                    make.height.equalTo(4)

                })
            }
            lastBtn = btn
            itemButtons.append(btn)
            btn.addTarget(self, action: #selector(didSelectItem), for: .touchUpInside)
        }
      
    }
    
    @objc func didSelectItem(sender: UIButton){
        guard sender != selectedItemButton else{
            return
        }
        selectedItemButton.isSelected = false
        sender.isSelected = true
        selectedItemButton = sender
        UIView.animate(withDuration: 0.35) {
            self.indicatorView?.snp.remakeConstraints({ make in
                make.centerX.bottom.equalTo(sender)
                make.width.equalTo(40)
                make.height.equalTo(4)
            })
        }
  
    }

}
