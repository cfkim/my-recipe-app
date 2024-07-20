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
            .cornerRadius(10)
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
        
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.clear]), startPoint: .bottom, endPoint: .top)
                    .frame(height: 100)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(10)
                    .overlay (alignment: .bottomLeading){
                        Text(text)
                            .padding()
                            .foregroundColor(.white)
                            .bold()
                            .font(.title3)
                            .padding()
                    }
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

