//
//  FavariteButton.swift
//  Landmarks
//
//  Created by Kuriwada Haruki on 2021-09-08.
//  Copyright © 2021 Apple. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Image(systemName: isSet ? "star.fill" :  "star")
                .foregroundColor(isSet ? .yellow : .gray)
        })
    }

}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: Binding.constant(false))
    }
}
