//
//  NetworkService.swift
//  project-saarah
//
//  Created by Bruno Rocha on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum NetworkServiceError: Error {
    case errorStatusCode(_ statusCode: Int)
    case notConnected
    case cancelled
    case unknown
    case invalidUrl
    case jsonDecodingError
    case dataIsNil
}

protocol NetworkServiceProtocol {
    func request(endpoint: EndpointType, completionHandler: @escaping (Result<Data?, NetworkServiceError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private var task: URLSessionTask?

    func request<T: Decodable>(endpoint: EndpointType, completionHandler: @escaping (Result<T?, NetworkServiceError>) -> Void) {
        let session = URLSession.shared

        guard let url = endpoint.url else {
            completionHandler(.failure(.invalidUrl))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
		
		if let bodyString = endpoint.body{
			if let bodyData = bodyString.data(using: String.Encoding.utf8) {
				request.httpBody = bodyData
				request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
			}
		}

        self.task = session.dataTask(with: request) { data, response, error in

            if let error = error {
                var networkError: NetworkServiceError

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
                do {
                    guard let data = data else {
                        DispatchQueue.main.async {
                            completionHandler(.failure(.dataIsNil))
                        }

                        return
                    }

                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(decodedObject))
                    }
                } catch let error {
                    #if DEBUG
                    print(error)
                    #endif

                    DispatchQueue.main.async {
                        completionHandler(.failure(.jsonDecodingError))
                    }
                }
            }

        }

        task?.resume()
    }
}
