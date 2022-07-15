//
//  FeedTableViewCell.swift
//  OsungTS-MC3
//
//  Created by Kim Insub on 2022/07/12.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // 전체
    private let feedView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 상단
    private let feedUpperBar: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 상단 아래 프레임
    private let feedContentView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        stackView.layer.borderWidth = 1
        return stackView
    }()
    
    private let spacer1: UIView = {
        let view = UIView()
        return view
    }()
    
    private let spacer2: UIView = {
        let view = UIView()
        return view
    }()
    
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
    
    // init
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configureFeedView()

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
    
    func configureFeedView() {
        
        // 전체
        contentView.addSubview(feedView)
        
        addItemsInfeedView()
        addItemsInFeedUpperBar()
        addItemsInFeedContentView()
        
        applyConstraints()
    }
    
    func addItemsInfeedView() {
        feedView.addArrangedSubview(feedUpperBar)
        feedView.addArrangedSubview(spacer2)
        feedView.addArrangedSubview(feedContentView)
    }
    
    func addItemsInFeedUpperBar() {
        feedUpperBar.addArrangedSubview(profileImage)
        feedUpperBar.addArrangedSubview(spacer1)
        feedUpperBar.addArrangedSubview(username)
        feedUpperBar.addArrangedSubview(ellipsisButton)
    }
    
    func addItemsInFeedContentView() {
        
    }
    
    func applyConstraints() {
        
        let feedUpperBarContraints = [
            feedUpperBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            feedUpperBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            feedUpperBar.topAnchor.constraint(equalTo: contentView.topAnchor),
            feedUpperBar.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 30)
//            feedUpperBar.heightAnchor.constraint(equalToConstant: 30),
        ]

        let profileImageConstraints = [
            profileImage.leadingAnchor.constraint(equalTo: feedUpperBar.leadingAnchor, constant: 10),
            profileImage.topAnchor.constraint(equalTo: feedUpperBar.topAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 30),
            profileImage.heightAnchor.constraint(equalToConstant: 30)
        ]

        let spacer1Constraints = [
            spacer1.widthAnchor.constraint(equalToConstant: 10),
            spacer1.heightAnchor.constraint(equalToConstant: 10)
        ]
        
        let spacer2Constraints = [
            spacer2.widthAnchor.constraint(equalToConstant: 10),
            spacer2.heightAnchor.constraint(equalToConstant: 10)
        ]
        
        let usernameConstraints = [
            username.leadingAnchor.constraint(equalTo: spacer1.trailingAnchor, constant: 100),
            username.topAnchor.constraint(equalTo: feedUpperBar.topAnchor),
            username.widthAnchor.constraint(equalToConstant: 100),
            username.heightAnchor.constraint(equalToConstant: 30)
        ]

        let ellipsisButtonConstraints = [
            ellipsisButton.trailingAnchor.constraint(equalTo: feedUpperBar.trailingAnchor, constant: -10),
            ellipsisButton.topAnchor.constraint(equalTo: feedUpperBar.topAnchor),
            ellipsisButton.widthAnchor.constraint(equalToConstant: 30),
            ellipsisButton.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let feedContentViewConstraints = [
            feedContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            feedContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            feedContentView.topAnchor.constraint(equalTo: feedUpperBar.bottomAnchor, constant: 10),
            feedContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
        // UpperBar
        NSLayoutConstraint.activate(feedUpperBarContraints)
        NSLayoutConstraint.activate(profileImageConstraints)
        NSLayoutConstraint.activate(spacer1Constraints)
        NSLayoutConstraint.activate(usernameConstraints)
        NSLayoutConstraint.activate(ellipsisButtonConstraints)
        
        // Content
        NSLayoutConstraint.activate(feedContentViewConstraints)
        NSLayoutConstraint.activate(spacer2Constraints)
    }
}


