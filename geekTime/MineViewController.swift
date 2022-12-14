//
//  MineViewController.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/8.
//

import UIKit
import SnapKit
class MineViewController: BaseViewController {

    var accountCell: CommonCell!
    var purchasedCell: CommonCell!
    var dealCell: CommonCell!
    var groupCell: CommonCell!

    var topView: UIView!
    var avatarView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexColor(0xF0F2F6)
        self.createTopView()
        setupListView()
    }
    func createTopView(){
        topView = UIView()
        topView.backgroundColor = .white
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(160)
        }
        avatarView = UIImageView(image: R.image.defaultAvatar())
        topView.addSubview(avatarView)
        
        avatarView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "点击登录"
        topView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(15)
            make.centerY.equalTo(avatarView)
        }
        topView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapTopView)))
    }
    
    @objc func tapTopView(){
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func didClickedPurchasedCell(){
        let dealVc = DealListViewController()
        dealVc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(dealVc, animated: true)
    }
    func setupListView() {
        let listView = UIView()
        listView.backgroundColor = .white
        view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
//            make.bottom.equalTo(groupCell)
        }
        accountCell = CommonCell(frame: CGRect(x: 0, y: 100, width: 390, height: 50))
        accountCell.title = "账户"
        accountCell.icon = R.image.column()
        listView.addSubview(accountCell)
        
        purchasedCell = CommonCell(frame: .zero)
        purchasedCell.title = "已购"
        purchasedCell.icon = R.image.book()
        listView.addSubview(purchasedCell)
        purchasedCell.addTarget(self, action: #selector(didClickedPurchasedCell), for: .touchUpInside)
        
        dealCell = CommonCell(frame: CGRect(x: 0, y: 100, width: 390, height: 50))
        dealCell.title = "商城订单"
        dealCell.icon = R.image.icon_life()
        listView.addSubview(dealCell)
        
        groupCell = CommonCell(frame: CGRect(x: 0, y: 100, width: 390, height: 50))
        groupCell.title = "我的拼团"
        groupCell.icon = R.image.icon_course()
        listView.addSubview(groupCell)
        
        accountCell.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(45)
        }
        
        purchasedCell.snp.makeConstraints { make in
            make.left.right.height.equalTo(accountCell)
            make.top.equalTo(accountCell.snp.bottom)
        }
        
        dealCell.snp.makeConstraints { make in
            make.left.right.height.equalTo(accountCell)
            make.top.equalTo(purchasedCell.snp.bottom)
        }
        
        groupCell.snp.makeConstraints { make in
            make.left.right.height.equalTo(accountCell)
            make.top.equalTo(dealCell.snp.bottom)
            make.bottom.equalToSuperview()
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
