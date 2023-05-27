//
//  ViewCodeProtocol.swift
//  MTMDesafio
//
//  Created by Jose Malengo on 20/05/23.
//

import UIKit

protocol ViewCodeProtocol: UIView {
    func buildViewHierachy()
    func setupCpnstraints()
    func addictionalConfiguration()
}

extension ViewCodeProtocol {
    func setupView() {
        buildViewHierachy()
        setupCpnstraints()
        addictionalConfiguration()
    }
}
