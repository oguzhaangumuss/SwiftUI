//
//  CryptoViewModel.swift
//  CryptoCurrencySwiftUI
//
//  Created by Oğuzhan Gümüş on 10.02.2024.
//
// ObserableObject --> allows the object to be updated when the information inside it changes.
//
import Foundation

class CryptoListViewModel : ObservableObject {
    @Published var cryptoList = [CryptoViewModel]()
    
    let webserice = WebService()
    
    func downloadCryptos(url : URL){
        webserice.downloadCurrencies(url: url) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cryptos):
                if let cryptos = cryptos {
                    
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.self.map(CryptoViewModel.init)
                    }
                    
                }
            }
        }
    }
}

struct CryptoViewModel{
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    var currency : String {
        crypto.currency
    }
    var price : String {
        crypto.price
    }
    
}
