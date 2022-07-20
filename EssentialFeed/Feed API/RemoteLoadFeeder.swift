//
//  RemoteLoadFeeder.swift
//  EssentialFeed
//
//  Created by Deanne Chance on 3/10/22.
//

import Foundation

public protocol HttpClient {
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client : HttpClient

    public init(url: URL, client: HttpClient) {
        self.client = client
        self.url = url
    }
    
    public func load() {
        client.get(from: url)
    }
}
