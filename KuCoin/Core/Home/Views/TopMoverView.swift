//
//  TopMoverView.swift
//  KuCoin
//
//  Created by Morning Star on 07/08/24.
//

import SwiftUI

struct TopMoverView: View {
    @StateObject var viewmodel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Mover")
                .font(.headline)
            ScrollView(.horizontal){
                HStack(spacing: 16){
                    ForEach(viewmodel.TopMovingCoin){ coin in
                        TopMoverItemView(coin: coin)
                        
                        
                    }
                    }
            }
        }
        .padding()
    }
                   
}
