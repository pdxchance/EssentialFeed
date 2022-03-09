//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Deanne Chance on 2/22/22.
//

import XCTest

protocol HttpClient {
    func get(from url: URL)
}

class HTTPClientSpy : HttpClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoader {
    let client : HttpClient
    let url: URL
    
    init(url: URL, client: HttpClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url)
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = makeSUT()

        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestedDataFromURL() {
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    private func makeSUT(url: URL = URL(string: "http://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
       
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
}
