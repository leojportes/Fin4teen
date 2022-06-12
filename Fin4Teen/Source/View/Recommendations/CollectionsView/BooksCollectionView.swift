//
//  BooksCollectionView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class BooksCollectionView: UIView, ViewCodeContract {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var tableViewContents = UITableView()
    
    // MARK: - Viewcode
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var collectionView: UICollectionView?
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120,
                                 height: 165)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(RecommendationsCollectionViewCell.self,
                                forCellWithReuseIdentifier: RecommendationsCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Livros"
        label.textColor = UIColor.setColor(color: .grayLight)
        label.font = UIFont.teenBoldFont.withSize(23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(containerView)
        containerView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        
        containerView
            .topAnchor(in: self, padding: 10)
            .leftAnchor(in: self, padding: 10)
            .rightAnchor(in: self)
            .bottomAnchor(in: self, padding: 10)
        
        titleLabel
            .topAnchor(in: containerView, padding: 4)
            .leftAnchor(in: containerView)
        
        collectionView?
            .topAnchor(in: containerView, padding: 20)
            .leftAnchor(in: containerView)
            .rightAnchor(in: containerView)
            .heightAnchor(210)
        
    }
    
    func setupConfiguration() {
        collectionView?.backgroundColor = .black
    }
    
}

// MARK: - Extensions CollectionView
extension BooksCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationsCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped livros")
    }
    
}
