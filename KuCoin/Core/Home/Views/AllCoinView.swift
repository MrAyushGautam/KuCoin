//
//  AllCoinView.swift
//  KuCoin
//
//  Created by Morning Star on 07/08/24.
//

import SwiftUI

struct AllCoinView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coin!")
                .font(.headline)
                .padding()
            HStack{
                Text("Coin")
                    
                Spacer()
                Text("Prices")
                    
            }
            .foregroundColor(.gray)
            .padding(.horizontal)
            .font(.caption)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins){ coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
        
    }
}
