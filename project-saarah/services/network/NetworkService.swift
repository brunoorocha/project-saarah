//
//  NetworkService.swift
//  project-saarah
//
//  Created by Bruno Rocha on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case errorStatusCode(_ statusCode: Int)
    case notConnected
    case cancelled
    case unknown
    case invalidUrl
}

protocol NetworkServiceProtocol {
    func request(endpoint: EndpointType, completionHandler: @escaping (Result<Data?, NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private var task: URLSessionTask?

    func request(endpoint: EndpointType, completionHandler: @escaping (Result<Data?, NetworkError>) -> Void) {
        let session = URLSession.shared

        guard let url = endpoint.url else {
            completionHandler(.failure(.invalidUrl))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue

        self.task = session.dataTask(with: request) { data, response, error in

            if let error = error {
                var networkError: NetworkError

                if let errorResponse = response as? HTTPURLResponse, (400..<600).contains(errorResponse.statusCode) {
                    networkError = .errorStatusCode(errorResponse.statusCode)
                } else if (error._code == NSURLErrorNotConnectedToInternet) {
                    networkError = .notConnected
                } else if (error._code == NSURLErrorCancelled) {
                    networkError = .cancelled
                } else {
                    networkError = .unknown
                }

                DispatchQueue.main.async {
                    completionHandler(.failure(networkError))
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(.success(data))
                }
            }

        }

        task?.resume()
    }
}
