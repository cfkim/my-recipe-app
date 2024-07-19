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
            Text(directions)
        }
        .padding()
    }
}

#Preview {
    DirectionsView(directions: "stir")
}
