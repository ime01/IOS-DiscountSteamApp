//
//  ContentView.swift
//  DiscountSteam
//
//  Created by Elena for AP on 20/01/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var games = [Game]()
    
    var body: some View {
        
        NavigationView{
            
            List(games){ game in
                
                NavigationLink(destination: Text("\(game.title)")){
                    
                    HStack(spacing:30){
                        AsyncImage(url: URL(string: game.thumb)!){
                            image in
                            image.resizable()
                                .scaledToFill()
                        }placeholder: {
                            Color.gray.opacity(0.3)
                        }.frame(width: 100, height: 50)
                        
                        
                        
                        VStack(alignment: .leading){
                            Text("\(game.title)").bold().lineLimit(1)
                            Text("Originally: \(game.normalPrice)$").bold().lineLimit(1)
                            Text("Discounted: \(game.salePrice)$").foregroundColor(.red)
                            Text("Rating: \(game.steamRatingPercent) %").foregroundColor(.red)
                        }
                        
                       
                    }
                    
                    
                }
                
                
                
            }.onAppear(){
                Api().loadData(url: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15"){ games in
                    
                    self.games = games
                    
                }
            }
            
        }.navigationTitle("Steam Games")
    }
}

#Preview {
    ContentView()
}
