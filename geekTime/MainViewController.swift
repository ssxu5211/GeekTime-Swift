//
//  ViewController.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/6.
//

import UIKit


class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .white
        let homeVc = HomeViewController()
        homeVc.tabBarItem.image = R.image.home()
        homeVc.tabBarItem.selectedImage = R.image.home_selected()?.withRenderingMode(.alwaysOriginal)
        homeVc.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)

        homeVc.tabBarItem.title = "首页";
        
        let navigationHomeVc = UINavigationController(rootViewController: homeVc)
        
        let mineVc = MineViewController()
        mineVc.tabBarItem.image = R.image.mine()
        mineVc.tabBarItem.selectedImage = R.image.mine_selected()?.withRenderingMode(.alwaysOriginal)
        mineVc.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)
        mineVc.tabBarItem.title = "我的";
        
        let navigationMineVc = UINavigationController(rootViewController: mineVc)
        
        self.viewControllers = [navigationHomeVc,navigationMineVc]
//        self.addChild(homeVc)
//        self.addChild(mineVc)

        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureAppNavigationBarAppear()
    }
    
    func configureAppNavigationBarAppear(){
        
        if #available(iOS 15.0, *) {
            let app = UINavigationBarAppearance()
            app.configureWithOpaqueBackground()  // 重置背景和阴影颜色
            app.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor: UIColor.hexColor(0x222222)
            ]
            app.backgroundColor = .white // 设置导航栏背景色
            app.shadowColor = .clear
            app.backgroundEffect = nil
            UINavigationBar.appearance().scrollEdgeAppearance = app  // 带scroll滑动的页面
            UINavigationBar.appearance().standardAppearance = app // 常规页面。描述导航栏以标准高度
        }
    }

}

