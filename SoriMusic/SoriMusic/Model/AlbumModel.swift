//
//  AlbumModel.swift
//  SoriMusic
//
//  Created by Woody on 12/19/24.
//

import SwiftUI

struct Songs {
    let name: String
    let featuredAritst: String
    let overAge: Bool
}

struct AlbumModel {
    let albumName: String
    let albumImage: UIImage
    let artist: String
    let songName: Songs
    let releaseDate: Date
}
