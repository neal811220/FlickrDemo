//
//  NAHTTPClient.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

enum NAHTTPClientError: Error {
    
    case decodeDataFail
    
    case clientError(Data)
    
    case serverError
    
    case unexpectedError
    
    case URLError
}

enum NAHTTPMethod: String {
    
    case GET
    
    case POST
    
    case PUT
}

enum NAHTTPHeaderField: String {
    
    case contentType = "Content-Type"
}

enum NAHTTPHeaderValue: String {
    
    case json = "application/json"
}

protocol NARequest {
    
    var headers: [String:String] { get }
    
    var body: Data? { get }
    
    var method: String { get }
    
    var endPoint: String { get }
}

extension NARequest {
    
    func makeRequest() -> URLRequest {
        
        let urlString = Bundle.NAValueForString(key: NAConstant.coustomUrlKey) + endPoint
        
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)

        request.allHTTPHeaderFields = headers
        
        request.httpBody = body

        request.httpMethod = method

        return request
    }
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private let decoder = JSONDecoder()
    
    private let encoder = JSONEncoder()
    
    func request(_ naRequest: NARequest, completion: @escaping (Result<Data, Error>) -> Void ) {
        
        URLSession.shared.dataTask(with: naRequest.makeRequest()) { (data, response, error) in
            
            guard error == nil else {

                return completion(Result.failure(error!))
            }
            
            let httpResponse = response as! HTTPURLResponse
            
            let statusCode = httpResponse.statusCode
            
            switch statusCode {
                
            case 200..<300:
                
                completion(Result.success(data!))
                
            case 400..<500:
                
                completion(Result.failure(NAHTTPClientError.clientError(data!)))
                
            case 500..<600:
                
                completion(Result.failure(NAHTTPClientError.serverError))
                
            default: return
                
                completion(Result.failure(NAHTTPClientError.unexpectedError))
            }
        }.resume()
    }
}
