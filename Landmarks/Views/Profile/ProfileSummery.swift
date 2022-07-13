//
//  ProfileSummery.swift
//  Landmarks
//
//  Created by Bogdan Sevcenco on 28.06.2022.
//

import SwiftUI

struct ProfileSummery: View {
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off") ")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack{
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
                
                
                
            }
        }
    }
}

struct ProfileSummery_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummery(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
