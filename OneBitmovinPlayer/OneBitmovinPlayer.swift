//
//  OneBitmovinPlayer.swift
//  OneBitmovinPlayer
//
//  Created by Emel Elias on 2019-10-09.
//  Copyright © 2019 Emel Elias. All rights reserved.
//

import Foundation
import BitmovinPlayer
import UIKit
public class OneBitmovinPlayer: OnePlayer {
    private var bitmovinPlayer: BitmovinPlayer?
    public func playerView() -> UIView? {
        guard let streamUrl = URL(string: "https://bitmovin-a.akamaihd.net/content/MI201109210084_1/m3u8s/playlist.m3u8") else {
            return nil
        }

        // Create a source item based on the HLS stream URL
        let hlsSource = HLSSource(url: streamUrl)
        let sourceItem = SourceItem(adaptiveSource: hlsSource)

        // Create player configuration
        let config = PlayerConfiguration()

        // Add the source item to the configuration
        config.sourceItem = sourceItem
        self.bitmovinPlayer = BitmovinPlayer(configuration: config)
        let playerView = BMPBitmovinPlayerView(
            player: self.bitmovinPlayer!,
            frame: .zero)

        return playerView
    }
    
    public func play(url: String) {
        self.bitmovinPlayer?.play()
    }
    
    public func pause() {
        
    }
    
    
}
