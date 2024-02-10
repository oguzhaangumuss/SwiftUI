//
//  MainView.swift
//  CryptoCurrencySwiftUI
//
//  Created by Oğuzhan Gümüş on 10.02.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    var body: some View {
        VStack {
            NavigationView {
                List(cryptoListViewModel.cryptoList ,id:\.id) {
                    crypto in
                    VStack{
                        Text(crypto.currency)
                            
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame( maxWidth: .infinity, alignment: .leading)
                            
                        Text(crypto.price)
                            .frame( maxWidth: .infinity, alignment: .leading)
                            .font(.footnote)
                    }
                }//list
                .listStyle(PlainListStyle())
                .navigationTitle("Crypto Currencies")
            }//Navigation
            .task {
                await cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            }//Task

            /*
            .onAppear{
                
                
                cryptoListViewModel.downloadCryptos(url: URL(string:
                                                                //ab3b562e-2ed4-4c13-9e97-a47955cfd396
                                                             "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
            }
            */
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
