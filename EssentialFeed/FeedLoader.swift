//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Deanne Chance on 2/22/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult)->Void)
}
