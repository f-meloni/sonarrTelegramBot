//
//  Series+TelegramDecription.swift
//  SonarrBot
//
//  Created by Franco Meloni on 04/01/2018.
//

import SonarrAPI

extension Series {
    var telegramBaseDescription: String {
        var result = ""
        result += "*" + String(describing: self.title) + "*\n"
        result += "ID: " + String(describing: self.id) + "\n"
        result += "Genres: " + String(describing: self.genres?.joined(separator: ",")) + "\n"
        result += "Seasons: " + String(describing: self.seasonCount)
        return result
    }
    
    var telegramDescription: String {
        var result = telegramBaseDescription
        result += "\n\n"
        return result
    }
    
    var telegramDetailedDescription: String {
        var result = telegramBaseDescription + "\n"
        result += "Ratings: " + String(describing: self.ratings?.votes) + "\n"
        result += "TVDB ID: " + String(describing: self.tvdbId) + "\n"
        result += "IMDB ID: " + String(describing: self.imdbId) + "\n"
        return result
    }
}
