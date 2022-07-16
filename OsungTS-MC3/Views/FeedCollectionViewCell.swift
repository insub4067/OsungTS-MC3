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
        stackView.spacing = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 상단
    private let feedUpperBar: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8.0
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
    func configure(with feed: Feed) {
        
        username.text = feed.username
        profileImage.image = UIImage(named: feed.profileImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension FeedCollectionViewCell {
    
    func configureFeedView() {
        // 전체
        contentView.addSubview(feedView)
        
        addItemsInfeedView()
        addItemsInFeedUpperBar()

        applyConstraints()
    }
    
    func addItemsInfeedView() {
        [feedUpperBar, feedContentView]
            .forEach { feedView.addArrangedSubview($0) }
    }
    
    func addItemsInFeedUpperBar() {
        [profileImage, username, ellipsisButton]
            .forEach { feedUpperBar.addArrangedSubview($0) }
    }
    
    func applyConstraints() {

        let feedViewContraints = [
            feedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feedView.topAnchor.constraint(equalTo: topAnchor),
            feedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        let feedUpperBarContraints = [
            feedUpperBar.heightAnchor.constraint(equalToConstant: 30.0),
            feedUpperBar.widthAnchor.constraint(equalTo: feedView.widthAnchor)
        ]

        let profileImageConstraints = [
            profileImage.heightAnchor.constraint(equalTo: feedUpperBar.heightAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 30)
        ]
        
        let usernameConstraints = [
            username.centerYAnchor.constraint(equalTo: feedUpperBar.centerYAnchor),
        ]

        let ellipsisButtonConstraints = [
            ellipsisButton.widthAnchor.constraint(equalToConstant: 30),
            ellipsisButton.heightAnchor.constraint(equalTo: feedUpperBar.heightAnchor),
        ]
        
        let feedContentViewConstraints = [
            feedContentView.widthAnchor.constraint(equalTo: feedView.widthAnchor)
        ]

        [
            feedViewContraints,
            // UpperBar
            feedUpperBarContraints,
            profileImageConstraints,
            usernameConstraints,
            ellipsisButtonConstraints,
            // Content
            feedContentViewConstraints
        ].forEach { NSLayoutConstraint.activate($0) }

        NSLayoutConstraint.activate(feedViewContraints)
    }
}


