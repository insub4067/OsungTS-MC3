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
    
    // UpperBar
    private let feedUpperBar: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
        
    // ContentView
//    private let feedContentView: UIStackView = {
//
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
//        stackView.layer.borderWidth = 1
//
//        return stackView
//    }()
    
    private let feedContentView: UIView = {
        
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        uiView.layer.borderWidth = 1
        
        return uiView
    }()
    
    // feedContentViewUIView
    private let feedContentViewUIView: UIView = {
        
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        return uiView
    }()
    
    // feedContentViewImageView
    private let feedContentViewImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // feedContentViewTranslucenceView
    private let feedContentViewTranslucenceView: UIView = {
        
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    // feedContentViewTitleView
    private let feedContentViewTitleView: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    // feedContentViewAuthorView
    private let feedContentViewAuthorView: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // feedContentViewPauseOrPlayView
    private let feedContentViewPauseOrPlayView: UIButton = {
        
        let button = UIButton()
        let image = UIImage(systemName: "play.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setPreferredSymbolConfiguration(.init(pointSize: 30, weight: .regular, scale: .default), forImageIn: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // feedContentViewProgressBarView
    private let feedContentViewProgressBarView: UISlider = {
        
        let progressBar = UISlider()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    // username
    private let username: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    private let feedUpperBarHeight: CGFloat = 42
    
    // profileImage
    lazy var profileImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = feedUpperBarHeight / 2
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
        let image = UIImage(named: feed.image)
        feedContentViewImageView.image = image?.applyBlur_usingClamp(radius: 5)
        feedContentViewTitleView.text = feed.title
        feedContentViewAuthorView.text = feed.author
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
        addItemsInFeedContentView()
        
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
    
    func addItemsInFeedContentView() {
        
        // feedContentView
        [
            feedContentViewUIView,
            feedContentViewAuthorView,
            feedContentViewPauseOrPlayView,
            feedContentViewProgressBarView
        ]
            .forEach { feedContentView.addSubview($0) }
        
        // feedContentViewUIView
        [
            feedContentViewImageView,
            feedContentViewTranslucenceView,
            feedContentViewTitleView,
        ]
            .forEach { feedContentViewUIView.addSubview($0) }
    }
    
    func applyConstraints() {
        
        // 전체
        let feedViewContraints = [
            feedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feedView.topAnchor.constraint(equalTo: topAnchor),
            feedView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        // UpperBar
        let feedUpperBarContraints = [
            feedUpperBar.heightAnchor.constraint(equalToConstant: feedUpperBarHeight),
            feedUpperBar.widthAnchor.constraint(equalTo: feedView.widthAnchor)
        ]

        let profileImageConstraints = [
            profileImage.heightAnchor.constraint(equalTo: feedUpperBar.heightAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: feedUpperBarHeight)
        ]
        
        let usernameConstraints = [
            username.centerYAnchor.constraint(equalTo: feedUpperBar.centerYAnchor),
        ]

        let ellipsisButtonConstraints = [
            ellipsisButton.widthAnchor.constraint(equalToConstant: feedUpperBarHeight),
            ellipsisButton.heightAnchor.constraint(equalTo: feedUpperBar.heightAnchor)
        ]
        
        // ContentView
        let feedContentViewConstraints = [
            feedContentView.widthAnchor.constraint(equalTo: feedView.widthAnchor)
        ]
        
        // UIView
        let feedContentViewUIViewConstraints = [
            feedContentViewUIView.widthAnchor.constraint(equalTo: feedContentView.widthAnchor, constant: -16),
            feedContentViewUIView.heightAnchor.constraint(equalTo: feedContentView.widthAnchor, constant: -16),
            feedContentViewUIView.leftAnchor.constraint(equalTo: feedContentView.leftAnchor, constant: 8),
            feedContentViewUIView.topAnchor.constraint(equalTo: feedContentView.topAnchor, constant: 8)
        ]
        
        // image
        let feedContentViewImageViewConstraints = [
            feedContentViewImageView.widthAnchor.constraint(equalTo: feedContentViewUIView.widthAnchor),
            feedContentViewImageView.heightAnchor.constraint(equalTo: feedContentViewUIView.heightAnchor)
        ]
        
        // Translucence Filter
        let feedContentViewTranslucenceViewConstraints = [
            feedContentViewTranslucenceView.widthAnchor.constraint(equalTo: feedContentViewUIView.widthAnchor),
            feedContentViewTranslucenceView.heightAnchor.constraint(equalTo: feedContentViewUIView.heightAnchor)
        ]
        
        // title
        let feedContentViewTitleViewConstraints = [
            feedContentViewTitleView.centerXAnchor.constraint(equalTo: feedContentViewUIView.centerXAnchor),
            feedContentViewTitleView.centerYAnchor.constraint(equalTo: feedContentViewUIView.centerYAnchor)
        ]
        
        // author
        let feedContentViewAuthorViewConstraints = [
            feedContentViewAuthorView.topAnchor.constraint(equalTo: feedContentViewUIView.bottomAnchor, constant: 8),
            feedContentViewAuthorView.centerXAnchor.constraint(equalTo: feedContentView.centerXAnchor)
        ]
        
        // playPauseButton
        let feedContentViewPauseOrPlayViewConstraints = [
            feedContentViewPauseOrPlayView.topAnchor.constraint(equalTo: feedContentViewAuthorView.bottomAnchor, constant: 8),
            feedContentViewPauseOrPlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
        ]
        
        // progressBar
        let feedContentViewProgressBarViewConstraints = [
            feedContentViewProgressBarView.topAnchor.constraint(equalTo: feedContentViewAuthorView.bottomAnchor, constant: 8),
            feedContentViewProgressBarView.leadingAnchor.constraint(equalTo: feedContentViewPauseOrPlayView.trailingAnchor, constant: 16),
            feedContentViewProgressBarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ]

        [
            // FeedView
            feedViewContraints,
            
            // UpperBar
            feedUpperBarContraints,
            profileImageConstraints,
            usernameConstraints,
            ellipsisButtonConstraints,
            
            // Content
            feedContentViewConstraints,
            feedContentViewUIViewConstraints,
            feedContentViewImageViewConstraints,
            feedContentViewTranslucenceViewConstraints,
            feedContentViewTitleViewConstraints,
            feedContentViewAuthorViewConstraints,
            feedContentViewPauseOrPlayViewConstraints,
            feedContentViewProgressBarViewConstraints
        ].forEach { NSLayoutConstraint.activate($0) }
    }
}


