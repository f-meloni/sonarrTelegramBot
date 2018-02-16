//
//  TelegramResponder.swift
//  SonarrBot
//
//  Created by Franco Meloni on 03/01/2018.
//

import SonarrAPI
import ZEGBot

struct TelegramResponder {
    let config: SonarrBotConfiguration
    let sonarrAPI: SonarrAPI
    
    init(config: SonarrBotConfiguration) {
        self.config = config
        self.sonarrAPI = SonarrAPI(host: config.host, port: config.port, apiKey: config.apiToken)
    }
    
    func respond(toCommand command: TelegramCommand, forMessage message: Message) {
        switch command {
        case .series:
            seriesCommand(forMessage: message)

        case .seriesDetail(id: let seriesId):
            seriesDetailCommand(seriesId: seriesId, forMessage: message)
        }
        
        
    }
    
    func seriesCommand(forMessage message: Message) {
        let seriesRequest = SeriesRequest(completionBlock: { (result) in
            switch result {
            case .success(let series):
                let response = series.reduce("", { (result, series) -> String in
                    return result + series.telegramDescription
                })
                
                bot.send(message: response, to: message.chat, parseMode: .markdown)
                break
            case .failure(_):
                break
            }
        })
        
        sonarrAPI.execute(request: seriesRequest)
    }
    
    func seriesDetailCommand(seriesId: Int, forMessage message: Message) {
        let seriesDetailRequest = SeriesDetailRequest(seriesID: seriesId) { (result) in
            switch result {
            case .success(let series):
                let response = series.telegramDetailedDescription
                
                bot.send(message: response, to: message.chat, parseMode: .markdown, disableWebPagePreview: false)
                if let image = series.images.first {
                    let imageURL = "http://" + self.config.host + ":" + self.config.port + image.url
                    bot.send(photo: imageURL, caption: "", to: message.chat, disableNotification: false)
                }
                break
            case .failure(_):
                break
            }
        }
        
        sonarrAPI.execute(request: seriesDetailRequest)
    }
}
