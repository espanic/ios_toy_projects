//
//  NewReleaseCollectionViewCell.swift
//  Spotify
//
//  Created by 최윤호 on 2023/04/02.
//

import UIKit
import SDWebImage

class NewReleaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "NewReleaseCollectionViewCell"
    private let albumCoverImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let albumNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let numberOfTracksLabel : UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18, weight: .thin)
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(numberOfTracksLabel)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumNameLabel.text = nil
        artistNameLabel.text = nil
        numberOfTracksLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    func configure(with viewModel : NewReleaseViewModel) {
        albumNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        numberOfTracksLabel.text = "Tracks : \(viewModel.numberOfTracks)"
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        
//        albumNameLabel.lineBreakMode = .byWordWrapping
        albumNameLabel.numberOfLines = 2
    }
    
}


extension NewReleaseCollectionViewCell {
    func setupLayout(){
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfTracksLabel.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
//        albumNameLabel.backgroundColor = .red
        NSLayoutConstraint.activate([
            albumCoverImageView.widthAnchor.constraint(equalToConstant: contentView.height - 10),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: contentView.height - 10),
            albumCoverImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            
            albumNameLabel.leftAnchor.constraint(equalTo: albumCoverImageView.rightAnchor, constant: 10),
            albumNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.topAnchor),
            
            artistNameLabel.leftAnchor.constraint(equalTo: albumCoverImageView.rightAnchor, constant: 10),
            artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10),
            numberOfTracksLabel.leftAnchor.constraint(equalTo: albumCoverImageView.rightAnchor, constant: 10),
            numberOfTracksLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        
        ])
    }
}
