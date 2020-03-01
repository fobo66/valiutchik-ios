//
//  ContentView.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 11/3/19.
//  Copyright © 2019 Andrei Mukamolau. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let title: LocalizedStringKey = "title"
    
    var body: some View {
        NavigationView {
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .font(.largeTitle)
            }
            .padding()
            .navigationBarTitle(
                Text(title)
            )
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
