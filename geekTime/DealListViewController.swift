//
//  DealListViewController.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/11.
//

import UIKit

class DealListViewController: BaseViewController, CommonListDelegate {
    func didSelectItem<Item>(_ item: Item) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let productList = CommonList<Deal, DealListCell>(frame: .zero)
        productList.items = FakeData.createDeals()
        productList.delegate = self;
        view.addSubview(productList)
        productList.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
