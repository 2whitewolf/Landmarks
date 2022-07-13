//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bogdan Sevcenco on 27.06.2022.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavouriteOnly = false
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavouriteOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavouriteOnly) {
                    Text("Favourites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                    LandmarkRow(landmark: landmark)
                    }
                }
              
                
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
