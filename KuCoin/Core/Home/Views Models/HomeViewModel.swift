//
//  HomeViewModel.swift
//  KuCoin
//
//  Created by Morning Star on 07/08/24.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    @Published var coins = [Coin]()
    @Published var TopMovingCoin = [Coin]()
    
    init(){
        fetchcoindata()
    }
    
    func fetchcoindata(){
        let urlstring = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        guard let url = URL(string: urlstring) else{ return}
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error{
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Respose code\(response.statusCode)")
            }
            
            
            guard let data = data else { return}
            do{
                let coins = try JSONDecoder().decode([Coin].self,from:data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoin()
                }
            } catch let error{
                print("DEBUG: Faild to decode with error: \(error)")
                
            }
        }.resume()
    }
    func configureTopMovingCoin(){
        let topmovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.TopMovingCoin = Array(topmovers.prefix(5))
    }
    
}
