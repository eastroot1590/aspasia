//
//  WorkoutSectionHeader.swift
//  Aspasia
//
//  Created by 이동근 on 2021/08/01.
//

import UIKit

class WorkoutSectionHeader: UICollectionReusableView {
    static let identifier: String = "WorkoutSectionHeader"
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var font: UIFont = UIFont.systemFont(ofSize: 16) {
        didSet {
            titleLabel.font = font
        }
    }
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}