//
//  MealItemView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import SwiftUI

struct MealItemView: View {
    let id : String
    let name: String
    let thumbnail : String
    @StateObject var viewModel = MealItemViewViewModel()

    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: thumbnail)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }placeholder: {
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.gray)
                    .foregroundColor(.secondary)

            }
            .frame(width: 300, height: 300)
            .cornerRadius(30)
            .overlay(alignment: .bottomLeading) {
                Caption(text: name)
            }
        }
        .padding()
    }
}

struct Caption: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(.white)
            .bold()
            .font(.title)
            .padding()
    }
}

struct Heart: View {
    let isFavorite: Bool
    var body: some View {
        Circle()
            .overlay {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.pink)
                    
                
            }
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            
    }
}

#Preview {
    MealItemView(id: "52897", name: "Carrot Cake", thumbnail: "https://www.themealdb.com/images/media/meals/vrspxv1511722107.jpg")
}

