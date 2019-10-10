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
    private let playbackUrl: String
    public init(with url: String) {
        self.playbackUrl = url
        guard let streamUrl = URL(string: self.playbackUrl) else {
            return
        }

        // Create a source item based on the HLS stream URL
        let hlsSource = HLSSource(url: streamUrl)
        let sourceItem = SourceItem(adaptiveSource: hlsSource)

        // Create player configuration
        let config = PlayerConfiguration()

        // Add the source item to the configuration
        config.sourceItem = sourceItem
        self.bitmovinPlayer = BitmovinPlayer(configuration: config)
    }
    public func playerView() -> UIView? {
        guard let player = self.bitmovinPlayer else {
            return nil
        }
        return BMPBitmovinPlayerView(
            player: player,
            frame: .zero)
    }
    
    public func play(url: String) {
        self.bitmovinPlayer?.play()
    }
    
    public func pause() {
        self.bitmovinPlayer?.pause()
    }
    
    
}
