//
//  ResponseError.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 19/05/23.
//

import Foundation

enum ResponseError: Error {
    case invalidUrl
    case invalidData
    case decodeError
    case informationCharacter
    case informationEpisode
    case httpStatusCodeError(Int)
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "Url inválida"
        case .invalidData:
            return "Dados inválidos"
        case .decodeError:
            return "Error ao decodificar dados"
        case .informationCharacter:
            return "Erro ao carregar informações do personagem"
        case .informationEpisode:
            return "Erro ao carregar informações do Episodios"
        case .httpStatusCodeError(let status):
            return httpErrorDescription(status)
        }
    }
    
    func httpErrorDescription(_ status: Int) -> String {
        switch status {
        case 400:
            return "Requisição Inválida"
        case 404:
            return "O servidor não pode encontrar o recurso solicitado"
        case 501:
            return "O servidor encontrou uma situação com a qual não sabe lidar."
        default:
            return "Falha no Servidor"
        }
    }
}

