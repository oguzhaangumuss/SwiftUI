//
//  WebService.swift
//  CryptoCurrencySwiftUI
//
//  Created by Oğuzhan Gümüş on 10.02.2024.
//
// Url , Escaping , enum

import Foundation

class WebService {
    
    func downloadCurrenciesAsync(url : URL) async throws -> [CryptoCurrency]{
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    }
    
    //Escaping func
    /*func downloadCurrencies(url: URL, completion : @escaping(Result <[CryptoCurrency]?,DownloadError>) -> Void ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error)
                completion(.failure(DownloadError.badUrl))
            }
            guard let data = data , error == nil else {
                return completion(.failure(.noData))
            }
            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
                return completion(.failure(.dataParseError))
            }
            completion(.success(currencies))
        }.resume()
    }
    */
    enum DownloadError : Error {
        case badUrl
        case noData
        case dataParseError
    }
}
