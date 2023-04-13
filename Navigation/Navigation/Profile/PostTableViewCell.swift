//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Pavel Belov on 18.06.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let postAuthor = UILabel()
    private let postImage = UIImageView()
    private let postDescription = UILabel()
    private let postLikes = UILabel()
    private let postViews = UILabel()
    
    var postStruct: PostFeed? {
        didSet {
            postAuthor.text = postStruct?.author
            postImage.image = UIImage(named: postStruct?.image ?? "No Image")
            postDescription.text = postStruct?.description
            postLikes.text = "Likes: \(postStruct?.likes ?? 0)"
            postViews.text = "Views: \(postStruct?.views ?? 0)"
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubviews(postAuthor)
        postAuthor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                                        postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                        postAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)])
        
        postAuthor.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postAuthor.textColor = .black
        postAuthor.textAlignment = .left
        postAuthor.numberOfLines = 2
        
        
        contentView.addSubviews(postImage)
        postImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        postImage.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 16),
                                        postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                        postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                        postImage.widthAnchor.constraint(equalTo: postImage.heightAnchor)])
        
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        
        
        contentView.addSubviews(postDescription)
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
                                        postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                        postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)])
        
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        
        
        contentView.addSubviews(postLikes)
        postLikes.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
                                        postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                        postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)])
        
        postLikes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postLikes.textColor = .black
        
        
        contentView.addSubviews(postViews)
        postViews.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                        postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
                                        postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                                        postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)])
        
        postViews.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postViews.textColor = .black
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UIView {
    func addSubviews(_ subviews: UIView...)
    {
        subviews.forEach() { addSubview($0) }
    }
}
