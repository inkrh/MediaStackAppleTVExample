//
//  MediaStackController.swift
//  tvheadlines
//
//  Created by Robert Smith on 12/26/25.
//

import Foundation
import SwiftyJSON

class MediaStackController {
    //TODO: timing - if set retry with this URL every n hours if n>0
    private var _retry: Int = 0
    
    let accessKey = Config().accessKey
    let base_api = Config().BASE_API    
    
    public func fetchMSModel() async throws -> MediaStackModel {

        var msModel: MediaStackModel
        let url = URL(string: Config().BASE_API)
    
        let task = Task {
            do {
                print("Fetching MediaStack data"+url!.absoluteString)
                let (data, _) = try await URLSession.shared.data(from: url!)
                let json = JSON(data)
                print(json)
                return await decodeResult(json)
            }
            
        }

        let result = await task.result

        do {
            msModel = try result.get()
            return msModel
        } catch LoadError.fetchFailed {
            print("Unable to fetch.")
        } catch LoadError.decodeFailed {
            print("Unable to decode.")
        } catch {
            print("Unknown error. Give up all hope.")
        }
        throw LoadError.fetchFailed
    }
    
    func decodeResult(_ result: JSON) async -> MediaStackModel {
        let jsonDecoder = JSONDecoder()
        do {
            // decode and order by country then city
            let decodedData = try jsonDecoder.decode(MediaStackModel.self, from: Data(try result.rawData()))
            return decodedData
        } catch {
            print("Error decoding JSON: \(error)")
        }
        return TestData
    }
}

enum LoadError: Error {
    case fetchFailed, decodeFailed
}

