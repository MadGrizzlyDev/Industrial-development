//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Pavel Belov on 18.06.2021.
//

import UIKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    let profileHeader = ProfileHeaderView()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileHeader)
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeader.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeader.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
