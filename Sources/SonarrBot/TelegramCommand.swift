//
//  TelegramCommands.swift
//  SonarrBot
//
//  Created by Franco Meloni on 03/01/2018.
//

private let seriesCommand = "series"
private let seriesDetailCommand = "seriesDetail"

enum TelegramCommand {
    case series
    case seriesDetail(id: Int)
    
    init?(string: String) {
        let commandArray = string.split(separator: " ")
        
        switch String(commandArray[0]) {
        case seriesCommand:
            self = .series
            
        case seriesDetailCommand:
            guard commandArray.count > 1,
                let seriesId = Int(commandArray[1]) else {
                print("Series ID not valid")
                return nil
            }
            self = .seriesDetail(id: seriesId)
            
        default:
            return nil
        }
    }
}
