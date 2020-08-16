//
//  LayoutDetailViewController.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/15/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

class LayoutDetailViewController: UIViewController {
    
    private let compositionalLayout: CompositionalLayoutProtocol
    private var layoutDetailView: LayoutDetailView!
    
    // MARK: - Initializers
    
    init(compositionalLayout: CompositionalLayoutProtocol) {
        self.compositionalLayout = compositionalLayout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        layoutDetailView = LayoutDetailView()
        view = layoutDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(with: compositionalLayout)
    }
    
    // MARK: - Private
    
    private func configureUI(with compositionalLayout: CompositionalLayoutProtocol) {
        title = compositionalLayout.title
        configureCollectionView(with: compositionalLayout)
    }
    
    private func configureCollectionView(with layout: CompositionalLayoutProtocol) {
        let collectionView = layoutDetailView.collectionView
        
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        collectionView.collectionViewLayout = layout.create()
    }
    
}

// MARK: - UICollectionViewDataSource

extension LayoutDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    
}
