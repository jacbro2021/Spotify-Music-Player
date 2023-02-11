//
//  ContentView.swift
//  mp02-MusicPlayer
//
//  Created by jacob brown on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray, Color("Color")], startPoint: .topLeading, endPoint:.bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                AlbumNameView()
                
                SongImageView()
                
                ArtistInfoView()
                
                SliderView()
                
                SongControlView()
                
                BottomView()
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AlbumNameView: View {
    var body: some View {
        HStack{
            Image(systemName: "chevron.down")
                .foregroundColor(.white)
            Spacer()
            Text("Are you Experienced")
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundColor(.white)
        }   .padding(.horizontal, 8)
            .padding(.bottom, 45)
    }
}

struct SongImageView: View {
    
    private let imgWidthHeight = 330.0
    
    var body: some View {
        Image("Image")
            .resizable()
            .scaledToFit()
            .frame(width: imgWidthHeight, height: imgWidthHeight)
    }
}

struct ArtistInfoView: View {
    
    private let heartWidthHeight = 30.0
    @State var likedSong = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack (alignment: .leading){
                    Text("Purple Haze")
                        .font(.system(size: 30, weight: .bold))
                    Text("Jimi Hendrix")
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                }   .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                Spacer()
                Button(action: {
                    self.likedSong.toggle()
                }) {
                    Image(systemName: self.likedSong == false ? "heart":"heart.fill")
                        .resizable()
                        .frame(width: heartWidthHeight,
                               height: heartWidthHeight)
                }
                    .foregroundColor(.white)
                    .padding(.horizontal, 35)
            }   .padding(.top, 35)
        }
    }
}

struct SliderView: View {
    
    @State var sliderValue: Double = 23
    private let sliderWidth = 330.0
    private let songLength: String = "2:50"
    
    var body: some View {
        VStack {
            //Text("Rating")
            //Text(
            //    String(format: "%.0f", sliderValue)
            //)
            Slider(value: $sliderValue,
                   in:0...170,
                   step: 1.0)
                .frame(width: sliderWidth)
                .accentColor(.white)
                .padding(.horizontal, 5)
            HStack {
                let minute = floor(sliderValue / 60)
                var second = sliderValue .truncatingRemainder(dividingBy: 60)
                if second < 10 {
                    Text(
                        String(format: "%.0f:0%.0f", minute, second)
                    )   .foregroundColor(.white)
                } else {
                    Text(
                        String(format: "%.0f:%.0f", minute, second)
                    )   .foregroundColor(.white)
                }
                Spacer()
                Text(songLength)
                    .foregroundColor(.white)
            }   .padding(.horizontal, 35)
        }
    }
}

struct SongControlView: View {
    
    @State var isPlaying: Bool = true
    @State var nextSongFill: Bool = false
    @State var previousSongFill: Bool = false
    private let playButton = 70.0
    private let nextSong = 40.0
    private let shuffle = 25.0
    private let buttonPadding = 10.0
    
    var body: some View {
        HStack {
            Image(systemName: "shuffle")
                .resizable()
                .frame(width: shuffle, height: shuffle)
                .foregroundColor(.white)
                .padding(.horizontal, buttonPadding)
            
            Button(action: {
                self.previousSongFill.toggle()
            }) {
                Image(systemName: self.previousSongFill == false ? "backward.end" : "backward.end.fill")
                    .resizable()
                    .frame(width: nextSong, height: nextSong)
                    .foregroundColor(.white)
                    .padding(.horizontal, buttonPadding)
            }

            Button(action: {
                self.isPlaying.toggle()
            }) {
                Image(systemName: self.isPlaying == true ? "play.circle.fill":"pause.circle.fill")
                    .resizable()
                    .frame(width: playButton, height: playButton)
                    .foregroundColor(.white)
                    .padding(.horizontal, buttonPadding)
            }
            
            Button(action: {
                self.nextSongFill.toggle()
            }) {
                Image(systemName: self.nextSongFill == false ? "forward.end" : "forward.end.fill")
                    .resizable()
                    .frame(width: nextSong, height: nextSong)
                    .foregroundColor(.white)
                    .padding(.horizontal, buttonPadding)
            }

            Image(systemName: "repeat")
                .resizable()
                .frame(width: shuffle, height: shuffle)
                .foregroundColor(.white)
                .padding(.horizontal, buttonPadding)

        }   .padding(.vertical, 5)
    }
}

struct BottomView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "hifispeaker")
            Spacer()
            Image(systemName: "square.and.arrow.up")
            Image(systemName: "line.3.horizontal.decrease")
        }   .foregroundColor(.white)
            .padding(.horizontal, 40)
            .padding(.top, 10)
    }
}
