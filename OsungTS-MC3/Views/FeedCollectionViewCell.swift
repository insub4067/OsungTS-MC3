//
//  FeedTableViewCell.swift
//  OsungTS-MC3
//
//  Created by Kim Insub on 2022/07/12.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

    var hStack = UIStackView()
    
    var spacer = UIView()
    
    // username
    private let username: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    // profileImage
    private let profileImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // ellipsis
    private let ellipsisButton: UIButton = {
        
        let button = UIButton()
        let image = UIImage(systemName: "ellipsis")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    // uiView
    private let uiView: UIView = {
        
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    // init
    override init(frame: CGRect) {
        
        super.init(frame: frame)

//        contentView.addSubview(username)
//        contentView.addSubview(profileImage)
//        contentView.addSubview(ellipsisButton)
//        contentView.addSubview(uiView)
        
        configureStackView()
//        applyConstraints()
    }
    
    // layoutSubviews
    override func layoutSubviews() {
        
        super.layoutSubviews()
//        profileImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //        username.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        //        ellipsisButton.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
    }
    
    func applyConstraints() {
        
        let profileImageConstraints = [
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 30),
            profileImage.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let usernameConstraints = [
            username.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            username.topAnchor.constraint(equalTo: contentView.topAnchor),
            username.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let ellipsisButtonConstraints = [
            ellipsisButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            ellipsisButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            ellipsisButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let uiViewConstraints = [
            uiView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            uiView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            uiView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ]
        
        NSLayoutConstraint.activate(profileImageConstraints)
        NSLayoutConstraint.activate(usernameConstraints)
        NSLayoutConstraint.activate(ellipsisButtonConstraints)
        NSLayoutConstraint.activate(uiViewConstraints)
    }
        
    // configure
    public func configure(with feed: Feed) {
        
        username.text = feed.username
        profileImage.image = UIImage(named: feed.profileImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension FeedCollectionViewCell {
    
    func configureStackView() {
        
        contentView.addSubview(hStack)
        
        addItemsInStack()
        hStack.axis = .horizontal
        hStack.distribution = .fill
        
        stackViewConstraints()
    }
   
    func stackViewConstraints() {
        
        hStack.translatesAutoresizingMaskIntoConstraints = false

        let uiStackContraints = [
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            hStack.heightAnchor.constraint(equalToConstant: 30),
        ]

        let profileImageConstraints = [
            profileImage.leadingAnchor.constraint(equalTo: hStack.leadingAnchor, constant: 10),
            profileImage.topAnchor.constraint(equalTo: hStack.topAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 30),
            profileImage.heightAnchor.constraint(equalToConstant: 30)
        ]

        let spacerConstraints = [
            spacer.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            spacer.topAnchor.constraint(equalTo: hStack.topAnchor),
            spacer.widthAnchor.constraint(equalToConstant: 10)
        ]
        
        let usernameConstraints = [
            username.leadingAnchor.constraint(equalTo: spacer.trailingAnchor, constant: 100),
            username.topAnchor.constraint(equalTo: hStack.topAnchor),
            username.widthAnchor.constraint(equalToConstant: 100),
            username.heightAnchor.constraint(equalToConstant: 30)
        ]

        let ellipsisButtonConstraints = [
            ellipsisButton.trailingAnchor.constraint(equalTo: hStack.trailingAnchor, constant: -10),
            ellipsisButton.topAnchor.constraint(equalTo: hStack.topAnchor),
            ellipsisButton.widthAnchor.constraint(equalToConstant: 30),
            ellipsisButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(uiStackContraints)
        NSLayoutConstraint.activate(profileImageConstraints)
        NSLayoutConstraint.activate(spacerConstraints)
        NSLayoutConstraint.activate(usernameConstraints)
        NSLayoutConstraint.activate(ellipsisButtonConstraints)
    }
    
    func addItemsInStack() {
        hStack.addArrangedSubview(profileImage)
        hStack.addArrangedSubview(spacer)
        hStack.addArrangedSubview(username)
        hStack.addArrangedSubview(ellipsisButton)
    }
}


