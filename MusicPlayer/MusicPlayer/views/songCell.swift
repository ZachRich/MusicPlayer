//
//  songCell.swift
//  MusicPlayer
//
//  Created by Zachary Rich on 4/30/20.
//  Copyright © 2020 Zachary Rich. All rights reserved.
//

import SwiftUI

struct songCell: View {
    var body: some View {
        
        
        HStack {
            
            Image(systemName: "timelapse").padding(.trailing, 10)

            
            Text("Song Title")
                
            Spacer()
            Image(systemName: "ellipsis")
                
            
            }.padding(10)
        .background(Color.black)
        .foregroundColor(Color.white)
        
    }
}

struct songCell_Previews: PreviewProvider {
    static var previews: some View {
        songCell()
    }
}
