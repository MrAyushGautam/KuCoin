//
//  TopMoverItemView.swift
//  KuCoin
//
//  Created by Morning Star on 07/08/24.
//

import SwiftUI
import Kingfisher

struct TopMoverItemView: View {
    let coin: Coin
    var body: some View {
        
        VStack(alignment: .leading){
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            //coin info
            HStack(spacing: 2){
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            //coin pert change
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width:140, height: 140)
        .overlay(
        RoundedRectangle(cornerRadius: 15)
            .stroke(Color(.systemGray4), lineWidth: 2))
    }
}
