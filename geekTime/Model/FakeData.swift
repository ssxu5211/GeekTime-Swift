//
//  FakeData.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/7.
//

import Foundation

class FakeData{
    private static var bannerList = [String]()
    private static var products = [Product]()
    private static var deals = [Deal]()
    
    static func createBanners()->[String]{
        if bannerList.count == 0{
            bannerList = ["https://static001.geekbang.org/resource/image/30/86/307332b7ba9556ba1e38c358ad6aab86.jpg","https://static001.geekbang.org/resource/image/a3/b8/a3c773415de0a302faf281ca7fcbb8b8.jpg?x-oss-process=image/resize,m_fill,h_236,w_690","https://static001.geekbang.org/resource/image/c1/dc/c14c7ca5d08066fa3746ea89e8161cdc.jpg?x-oss-process=image/resize,m_fill,h_236,w_690"]
        }
        return bannerList
    }
    static func createProducts()->[Product]{
        if products.count==0 {
            let p1 = Product(imageUrl: "https://static001.geekbang.org/resource/image/aa/4e/aa1005366bab254e69de8391e172394e.jpg?x-oss-process=image/resize,w_155,h_204/format,webp", name: "MongoDB高数课", desc: "Tapdata CTO、MongoDB中文社区主席、钱mongoDB大中华区首席架构师", price: 129, teacher: "唐建法", total: 49, update: 7, studentCount: 2989, detail: "MongoDB 是当前广受欢迎的NoSQL数据库，目前社会面...", courseList: "第一章:MongoDB再入门（9讲)")
            let p2 = Product(imageUrl: "https://static001.geekbang.org/resource/image/a4/e7/a4a437f23799943db8e43041653b2ee7.png?x-oss-process=image/resize,w_184,h_243/format,webp", name: "Swift实战", desc: "Swift实战 CTO、MongoDB中文社区主席、钱mongoDB大中华区首席架构师", price: 59, teacher: "王法", total: 92, update:23, studentCount: 3652, detail: "Swift实战 是当前广受欢迎的NoSQL数据库，目前社会面...", courseList: "第三章:Swift实战再入门（6讲)")
            let p3 = Product(imageUrl: "https://static001.geekbang.org/resource/image/f9/12/f992f0e18c31d2b78d18448edd905112.jpg?x-oss-process=image/resize,w_131,h_172/format,webp", name: "iOS入门", desc: "Tapdata CTO、MongoDB中文社区主席、钱mongoDB大中华区首席架构师", price: 28, teacher: "李建新", total: 28, update: 4, studentCount: 298, detail: "iOS入门 是当前广受欢迎的NoSQL数据库，目前社会面...", courseList: "第一章:MongoDB再入门（9讲)")
            let p4 = Product(imageUrl: "https://static001.geekbang.org/resource/image/65/cf/659ac6a14d19ae143d5120eb8733a0cf.png?x-oss-process=image/resize,w_155,h_155/format,webp", name: "安卓进阶", desc: "Tapdata 安卓进阶大中华区首席架构师", price: 39, teacher: "杨大根", total: 9, update: 7, studentCount: 229, detail: "安卓进阶 是当前广受欢迎的NoSQL数据库，目前社会面...", courseList: "第一章:安卓进阶再入门（1讲)")
            
            products = [p1,p2,p3,p4]
            
        }
        return products
    }
    
    static func createDeals()->[Deal]{
        if deals.count == 0 {
            deals = FakeData.createProducts().map{
                Deal(product: $0, progress: 51)
            }
        }
        return deals
    }
}
