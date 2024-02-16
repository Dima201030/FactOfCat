//
//  ContentView.swift
//  FactOfCat
//
//  Created by Дима Кожемякин on 16.02.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var factOfCat: FactOfCat
    var body: some View {
        ScrollView {
            VStack {
                
                AsyncImage(url: URL(string: "\(factOfCat.urlImage)")) { image in
                    image.resizable()
                    
                } placeholder: {
                    ProgressView()
                }
                
                .frame(width: 300, height: 400)
                .cornerRadius(30)
                
                Text("\(factOfCat.fact)")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("middle number is \(factOfCat.sum)").font(.subheadline)
                
            }
        }
        .refreshable {
            factOfCat.loadFact()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(FactOfCat())
}
