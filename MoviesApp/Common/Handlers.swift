//
//  Handlers.swift
//  MoviesApp
//
//  Created by Shehryar on 05/09/2023.
//

import Foundation

public typealias Handler<T> = (T) -> Void

public typealias VoidHandler = () -> Void
public typealias StringHandler = Handler<String>
