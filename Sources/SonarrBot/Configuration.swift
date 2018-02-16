//
//  Configuration.swift
//  SonarrBot
//
//  Created by Franco Meloni on 23/01/2018.
//

import Foundation

protocol SonarrBotConfiguration {
    var host: String { get }
    var port: String { get }
    var apiToken: String { get }
    var botToken: String { get }
}

struct FileConfiguration: SonarrBotConfiguration, Codable {
    let host: String
    let port: String
    let apiToken: String
    let botToken: String
    
    init?(configFileName: String) {
        let configFilePath = "/Users/franco/XCodeProjects/SonarrBot/Resources/config.json"//FileManager.default.currentDirectoryPath + "/Resources/" + configFileName
        
        let url = URL.init(fileURLWithPath: configFilePath)
        
        guard let data = try? Data(contentsOf: url),
            let config = try? JSONDecoder().decode(FileConfiguration.self, from: data) else {
            return nil
        }
        
        self = config
    }
}
