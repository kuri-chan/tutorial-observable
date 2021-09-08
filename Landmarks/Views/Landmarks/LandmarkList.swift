/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing a list of landmarks.
 */

import SwiftUI

struct LandmarkList: View {
    
    // if you want to interacti with data, define @EnvironmentObject and attach .modifier to that instances.
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly: Bool = true
    
    var filterdlandmarks: [Landmark] {
        
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
        
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                Toggle(isOn: $showFavoriteOnly, label: {
                    Text("is favorite?")
                })
                
                ForEach(filterdlandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

