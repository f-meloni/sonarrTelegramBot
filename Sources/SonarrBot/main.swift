import ZEGBot
import Foundation


let nullableConfig = FileConfiguration(configFileName: "config.json")

if nullableConfig == nil {
    print("Config file not found")
    exit(1)
}

let config = nullableConfig!

let bot = ZEGBot(token: config.botToken)
let telegramResponder = TelegramResponder(config: config)

bot.run { (updateResult, bot) in
    switch updateResult {
    case .success(let update):
        print(update.message?.text ?? "")
        if let message = update.message,
            let commandFullText = update.message?.text {
            let commandText = String(commandFullText[String.Index(encodedOffset: 1)...])
            
            if let command = TelegramCommand(rawValue: commandText) {
                telegramResponder.respond(toCommand: command, forMessage: message)
            }
        }
    case .failure(let error):
        dump(error)
    }
}
