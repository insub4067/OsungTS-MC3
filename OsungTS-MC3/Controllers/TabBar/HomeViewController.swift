//
//  HomeController.swift
//  OsungTS-MC3
//
//  Created by Kim Insub on 2022/07/12.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var feeds: [Feed] = [
        Feed(username: "Woody", profileImage: "profileImage", title: "우럭먹다 받은 영감", hashTags: [HashTag(hashTag: "#Guitar"), HashTag(hashTag: "#Jazz")]),
        Feed(username: "Woody", profileImage: "profileImage", title: "우럭먹다 받은 영감", hashTags: [HashTag(hashTag: "#Guitar"), HashTag(hashTag: "#Jazz")]),
        Feed(username: "Woody", profileImage: "profileImage", title: "우럭먹다 받은 영감", hashTags: [HashTag(hashTag: "#Guitar"), HashTag(hashTag: "#Jazz")]),
        Feed(username: "Woody", profileImage: "profileImage", title: "우럭먹다 받은 영감", hashTags: [HashTag(hashTag: "#Guitar"), HashTag(hashTag: "#Jazz")]),
        Feed(username: "Woody", profileImage: "profileImage", title: "우럭먹다 받은 영감", hashTags: [HashTag(hashTag: "#Guitar"), HashTag(hashTag: "#Jazz")])
    ]
    
    private let feedCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(feedCollectionView)
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        
        configureNavbar()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        feedCollectionView.frame = view.bounds
    }

   
    private func configureNavbar() {
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        button.setTitle("Wavegrame", for: .normal)
        
        let barButtonItem = UIBarButtonItem(customView: button)

        navigationItem.leftBarButtonItem = barButtonItem
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "message"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "plus.square"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Cell 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feeds.count
    }
    
    // Cell 내용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as? FeedCollectionViewCell else { return UICollectionViewCell() }
        
        let feed = feeds[indexPath.row]
        cell.configure(with: feed)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30.0
    }
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 32.0, height: 524)
    }
    
}
