//
//  WeatherNetwork.swift
//  WeatherMarketplace
//
//  Created by Ryan Helgeson on 1/31/24.
//

import Foundation
import SwiftUI

final class WeatherNetwork: NSObject, WeatherNetworkClient, URLSessionDelegate {
    
    private let sessionConfig: URLSessionConfiguration
    private lazy var session: URLSession = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
    
    init(sessionConfig: URLSessionConfiguration) {
        self.sessionConfig = sessionConfig
        super.init()
    }
    
    func requestData(_ router: WeatherRouter) async -> Result<Data, Error> {
        do {
            let (data, response) = try await session.data(for:  try! router.asURLRequest())
            
            guard let httpResponse = response as? HTTPURLResponse, (200..<300) ~= httpResponse.statusCode else {
                return .failure(WeatherAPIErrors.invalidResponse(nil))
            }
            return .success(data)
        } catch(let error) {
            return .failure(WeatherAPIErrors.invalidResponse(error))
        }
    }
}
