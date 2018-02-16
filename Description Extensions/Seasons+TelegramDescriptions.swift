//
//  Seasons+TelegramDescriptions.swift
//  SonarrBot
//
//  Created by Franco Meloni on 01/02/2018.
//

import SonarrAPI

extension Season {
    var telegramDescription: String {
        var result = ""
        result += "Season number: " + String(describing: self.seasonNumber) + "\n"
        result += "Episodes count: " + String(describing: self.statistics.totalEpisodeCount) + "\n"
        result += "Episodes on disk: " + String(describing: self.statistics.episodeCount)
        return result
    }
}
