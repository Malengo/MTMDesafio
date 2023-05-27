//
//  File.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 21/05/23.
//

import Foundation
import Alamofire

protocol EpisodeViewModelProtocol {
    func numberOfRows() -> Int
    func getNameOfEpisode(at position: Int) -> String
}

protocol EpisodeDetailsDelegate: AnyObject {
    func showError(_ error: ResponseError)
}

class EpisodeViewModel: EpisodeViewModelProtocol {
    
    var episodesURL: [String]
    var episodesList: [Episode] = []
    weak var delegate: EpisodeDetailsDelegate?
    
    init(episodesURL: [String]) {
        self.episodesURL = episodesURL
    }
    
    func numberOfRows() -> Int {
        episodesURL.count
    }
    
    func getEpisodes() async throws {
        for epURL in episodesURL {
            
            guard let url = URL(string: epURL) else { return }
            
            let (data, response) = try await URLSession.shared.data(for: URLRequest(url:url))
            
            guard let response = response as? HTTPURLResponse  else { return }
            
            guard response.statusCode == 200 else { return }
            
            do {
                let responseApi = try JSONDecoder().decode(Episode.self, from: data)
                self.episodesList.append(responseApi)
            } catch {
                return
            }
        }
    }
    
    func getNameOfEpisode(at position: Int) -> String {
        let episode = getEpisode(at: position)
        let episodeNumber = episode.episode ?? ""
        let episodeName = episode.name ?? ""
        return "\(episodeNumber) - \(episodeName)"
    }
    
    func showEpisodeInformation(at position: Int) {
        let episode = getEpisode(at: position)
        print(episode.episode)
        print(episode.name)
        print(episode.air_date)
    }
    
    private func getEpisode(at position: Int) -> Episode {
        guard !episodesList.isEmpty else { delegate?.showError(ResponseError.informationCharacter)
            return Episode() }
        return episodesList[position]
    }
}
