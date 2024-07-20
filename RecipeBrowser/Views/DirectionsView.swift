//
//  DirectionsView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/19/24.
//

import SwiftUI

struct DirectionsView: View {
    let directions : String
    var body: some View {
        ScrollView{
            if directions != "none"{
                Text(directions)
            }else{
                Spacer()
                
                HStack{
                    Text("Cannot find instructions")
                        .foregroundColor(.gray)
                    
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            
        }
        .padding()
    }
}

#Preview {
    DirectionsView(directions: "none")
}
