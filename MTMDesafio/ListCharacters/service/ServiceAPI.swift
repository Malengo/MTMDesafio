//
//  ServiceAPI.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 19/05/23.
//

import Foundation
import Alamofire

protocol ServiceAPIProtocol {
    func getAllCharacters(_ completion: @escaping (Result<[Character], ResponseError>) -> Void)
}

class ServiceAPI: ServiceAPIProtocol {
    func getAllCharacters(_ completion: @escaping (Result<[Character], ResponseError>) -> Void) {
        AF.request(CharactersConstants.Service.urlAPI).responseData { responseData in
           
            guard let response = responseData.response  else {
                completion(.failure(ResponseError.invalidUrl))
                return
            }
            
            guard response.statusCode == 200 else {
                completion(.failure(ResponseError.httpStatusCodeError(response.statusCode)))
                return
            }
            
            guard let data = responseData.data else {
                completion(.failure(ResponseError.invalidData))
                return
            }
            
            do {
                let responseApi = try JSONDecoder().decode(ResponseAPI.self, from: data)
                let characters = responseApi.results.map({$0 as Character})
                completion(.success(characters))
            } catch {
                completion(.failure(ResponseError.decodeError))
            }
        }
    }
}
