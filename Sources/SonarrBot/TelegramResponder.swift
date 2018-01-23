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
        self.sonarrAPI = SonarrAPI(host: config.host, apiKey: config.apiToken)
    }
    
    func respond(toCommand command: TelegramCommand, forMessage message: Message) {
        var response = ""

        switch command {
        case .list:
            let listRequest = SeriesRequest(completionBlock: { (result) in
                switch result {
                case .success(let series):
                    response = series.reduce("", { (result, series) -> String in
                        return result + series.telegramDescription
                    })

                    bot.send(message: response, to: message.chat, parseMode: .markdown)
                    break
                case .failure(_):
                    break
                }
            })

            sonarrAPI.execute(request: listRequest)
            break

        }
    }
}
