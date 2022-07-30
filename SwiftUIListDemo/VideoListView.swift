//
//  VideoListView.swift
//  SwiftUIListDemo
//
//  Created by Arjav Lad on 30/07/22.
//

import SwiftUI

struct VideoListView: View {
	var videos: [Video] = VideoList.topTen
	
	var body: some View {
		NavigationView {
			List(videos, id: \.id) { video in
				NavigationLink {
					VideoDetail(video: video)
				} label: {
					VideoCell(video: video)
				}
			}
			.listStyle(.grouped)
			.navigationTitle("Sean's Top 10")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		VideoListView()
			
	}
}

struct VideoCell: View {
	var video: Video
	var body: some View {
		HStack {
			Image(video.imageName)
				.resizable()
				.scaledToFit()
				.frame(height: 70)
				.cornerRadius(4)
				.padding(.vertical, 4)
			
			VStack(alignment: .leading, spacing: 5) {
				Text(video.title)
					.fontWeight(.semibold)
					.lineLimit(2)
					.minimumScaleFactor(0.5)
				
				Text(video.uploadDate)
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
		}
	}
}
