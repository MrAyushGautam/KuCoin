//
//  HomeView.swift
//  KuCoin
//
//  Created by Morning Star on 07/08/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                //Top Mover View
               TopMoverView(viewmodel: viewModel)
                
                Divider()
                
                //All Coins View
                AllCoinView(viewModel: viewModel)
                
            }
            .navigationTitle("Live Prices")
        }
    }
}
