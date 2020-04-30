//
//  contentItemViewer.swift
//  MusicPlayer
//
//  Created by Zachary Rich on 4/30/20.
//  Copyright © 2020 Zachary Rich. All rights reserved.
//

import SwiftUI

struct ContentItemViewer: View {
    
    let topSpacerHeight: CGFloat = 400
    let red: Color = Color.init(red: 166/255, green: 7/255, blue: 9/255)
    @State var playButton_offset: CGFloat = 335
    
    var body: some View {
        
        ZStack {
            
            //Layer 0
            LinearGradient(gradient: Gradient(colors: [red, Color.black, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)

            //Layer 1
            VStack { // Background (Layer 1)
                
                
                Spacer()
                    .frame(height: 50)
                
                
                Image("juiceWrld")
                    .resizable()
                    .frame(width: 200, height: 200)

                
                Text("Title")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
                
                Text("subtitle")
                    .foregroundColor(.init(red:0.5 , green:0.5, blue:0.5))
                Spacer()
                
            }
            
            //Layer 2
            ScrollView {
                
                GeometryReader{geo -> AnyView? in
                    
                    let thisOffset = geo.frame(in: .global).minY
                    if thisOffset > -300 {
                        self.playButton_offset = thisOffset
                    } else {
                        self.playButton_offset = -300
                    }
                    return nil
                }
                
                VStack(spacing:0) {
                    HStack {
                        Spacer().frame(height: topSpacerHeight)
                            .background(LinearGradient(gradient: Gradient(colors:[
                                Color.clear,
                                Color.clear,
                                Color.clear,
                                Color.clear,
                                Color.black
                                ]), startPoint: .top, endPoint: .bottom))
                    }
                    
                    VStack {
                        //Iterate through songs
                        ForEach(0..<25){ indicator in
                            HStack {
                                songCell()
                                Spacer()
                            }
                        }
                    }.background(Color.black)
                }.background(Color.clear)
            }
            
            VStack{
                LinearGradient(gradient: Gradient(colors: [red, Color.clear]), startPoint:.top, endPoint:.bottom).frame(height: 330)
                Spacer()
            }.edgesIgnoringSafeArea(.all)
            
            //Layer 3
            VStack {
                Spacer()
                    .frame(height: playButton_offset + 300)
                
                HStack {
                    if playButton_offset  > -300 {
                        Text("PLAY")
                    } else {
                        Image(systemName:"play.fill")
                    }
                    
                }.foregroundColor(.white)
                    .frame(width: getPlayButtonWidth(), height: 50)
                    .background(red)
                    .cornerRadius(25)
                    .font(.system(size: 20, weight: .bold))
                    .shadow(radius: 20)
                    Spacer()
                
            }
            
            //Layer 4
            VStack {
                
                HStack {
                    
                    Image(systemName: "chevron.left")
                    Spacer()
                    Image(systemName: "ellipsis")
                    
                }.foregroundColor(.white)
                .padding()
                Spacer()
            }
        }
    }
    
    func getPlayButtonWidth() -> CGFloat{
        if playButton_offset > -150 { //
            return 240
        } else if playButton_offset <= -300 {
            return 50
        } else {
            var width: CGFloat = 240 - (190 * (((-1 * playButton_offset) - 150) / 150))
            return width
        }
    }
    
    
}

struct ContentItemViewer_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemViewer()
    }
}
