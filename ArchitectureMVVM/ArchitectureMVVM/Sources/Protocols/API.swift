//
//  API.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 18/06/21.
//

import Foundation

protocol API
{
    associatedtype Interactor
    var interactor: Interactor { get set }
    func callAPI()
}
