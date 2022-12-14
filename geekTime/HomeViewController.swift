//
//  HomeViewController.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/8.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController, BannerViewDataSource, CommonListDelegate {
    func didSelectItem<Item>(_ item: Item) {
        if let product  = item as? Product{
            let detailVc = DetailViewController(product: product)
            //        detailVc.product = product
            detailVc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVc, animated: true)
        }
    }
    
    //    func didSelectProduct(_ product: Product, atIndexPath indexPath: IndexPath) {
    //        let detailVc = DetailViewController(product: product)
    //        detailVc.hidesBottomBarWhenPushed = true
    //        navigationController?.pushViewController(detailVc, animated: true)
    //    }
    
    func numberOfBanners(_ banner: BannerView) -> Int {
        return FakeData.createBanners().count
    }
    
    func viewForBanner(_ banner: BannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            
        }else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return imageView
        }
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 176))
        bannerView.autoScrollInterval = 3;
        bannerView.isInfinite = true
        bannerView.dataSource = self
        view.addSubview(bannerView)
        
        let productList = CommonList<Product, ProductCell>(frame: .zero)
        productList.items = FakeData.createProducts()
        productList.delegate = self;
        view.addSubview(productList)
        productList.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bannerView.snp.bottom)
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
