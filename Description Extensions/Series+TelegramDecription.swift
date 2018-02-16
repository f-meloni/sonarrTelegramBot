//
//  Series+TelegramDecription.swift
//  SonarrBot
//
//  Created by Franco Meloni on 04/01/2018.
//

import SonarrAPI

extension Series {
    private var telegramBaseDescription: String {
        var result = ""
        result += "*" + self.title + "*\n"
        result += "ID: " + String(describing: self.id) + "\n"
        result += "Genres: " +  self.genres.joined(separator: ",") + "\n"
        result += "Seasons: " + String(describing: self.seasonCount) + "\n"
        result += "TVDB ID: " + String(describing: self.tvdbId) + "\n"
        result += "IMDB ID: " + String(describing: self.imdbId) + "\n"
        return result
    }
    
    var telegramDescription: String {
        var result = telegramBaseDescription
        result += "\n\n"
        return result
    }
    
    var telegramDetailedDescription: String {
        var result = telegramBaseDescription
        result += "Ratings: " + String(describing: self.ratings.votes) + "\n"
        result += "Size on disk: " + String(describing: self.sizeOnDisk) + "\n\n"
        
        result += "Monitored Seasons:"
        for season in self.seasons where season.monitored {
            result += "\n" + season.telegramDescription
        }
        
        return result
    }
}
