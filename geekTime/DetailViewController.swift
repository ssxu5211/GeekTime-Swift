//
//  DetailViewController.swift
//  geekTime
//
//  Created by 根哥 on 2022/12/9.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {
    var product: Product
    var avatarView: UIImageView!
    var nameLabel: UILabel!
    var descLabel: UILabel!
    var teacherLabel: UILabel!
    var courseCountLabel: UILabel!
    var studentCountLabel: UILabel!
    var tab: Tab!
    
    var topView: UIView!
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "详情"
        createTopView()
        createMiddle()
        createBottom()
        
      
        
        // Do any additional setup after loading the view.
    }
    
    func createTopView(){
        topView = UIView()
        topView.backgroundColor = .gray
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        avatarView = UIImageView()
        let round = RoundCornerImageProcessor(cornerRadius: 10)
        avatarView.kf.setImage(with: URL(string: product.imageUrl),placeholder: nil,options: [.processor(round)])
        topView.addSubview(avatarView)
        avatarView.snp.makeConstraints { make in
            make.left.top.equalTo(15)
            make.width.equalTo(82)
            make.height.equalTo(108)
        }
        
        nameLabel = UILabel()
        nameLabel.text = product.name
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        topView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(10)
            make.top.equalTo(avatarView)
            make.right.equalTo(topView).offset(-15)

        }
        
        descLabel = UILabel()
        descLabel.text = product.desc
        descLabel.textColor = .white
        descLabel.font = UIFont.systemFont(ofSize: 14)
        descLabel.numberOfLines = 3
        topView.addSubview(descLabel)
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.right.equalTo(nameLabel)

        }
        
        teacherLabel = UILabel()
        teacherLabel.text = "讲师: \(product.teacher)"
        teacherLabel.textColor = .white
        teacherLabel.font = UIFont.systemFont(ofSize: 14)
        topView.addSubview(teacherLabel)
        
        teacherLabel.snp.makeConstraints { make in
            make.bottom.equalTo(avatarView)
            make.left.right.equalTo(nameLabel)
        }
        
        let bookAttachment = NSTextAttachment()
        bookAttachment.image = R.image.book()
        bookAttachment.bounds = CGRectMake(-2, -5, 20, 20)
        let bookAttachmentString = NSAttributedString(attachment: bookAttachment)
        let courseCountString = NSMutableAttributedString(string: "")
        courseCountString.append(bookAttachmentString)
        
        let courseCountStringAfterIcon = NSAttributedString(string: " 共\(product.total)讲 更新至\(product.update)讲")
        courseCountString.append(courseCountStringAfterIcon)
        
        courseCountLabel = UILabel()
        courseCountLabel.textColor = .white
        courseCountLabel.font = UIFont.systemFont(ofSize: 14)
        courseCountLabel.attributedText = courseCountString
        topView.addSubview(courseCountLabel)
        courseCountLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        let studentAttachment = NSTextAttachment()
        studentAttachment.image = R.image.defaultAvatar()
        studentAttachment.bounds = CGRectMake(-2, -5, 20, 20)
        let studentAttachmentString = NSAttributedString(attachment: studentAttachment)
        let studentCountString = NSMutableAttributedString(string: "")
        studentCountString.append(studentAttachmentString)
        
        let studentCountStringAfterIcon = NSAttributedString(string: " 共\(product.studentCount)人学习")
        studentCountString.append(studentCountStringAfterIcon)
        
        studentCountLabel = UILabel()
        studentCountLabel.textColor = .white
        studentCountLabel.font = UIFont.systemFont(ofSize: 14)
        studentCountLabel.attributedText = studentCountString
        topView.addSubview(studentCountLabel)
        studentCountLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-15)
        }
        
    }
    
    func createMiddle(){
        tab = Tab(items: ["课程介绍", "课程目录"])
        view.addSubview(tab)
        tab.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
            make.height.equalTo(40)
        }
    }
    
    func createBottom(){
        
    }
}
