//
//  MoviesListContainer.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import UIKit
import Swinject

public class MoviesListContainer {
    static var sharedContainer = Container()
    
    public static func createModule() -> UIViewController {
        
        
        return MoviesListViewController()
    }
}
