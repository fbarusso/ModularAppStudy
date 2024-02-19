//
//  GetUserNameUseCase.swift
//
//
//  Created by MB Labs on 19/02/24.
//

import Foundation

protocol GetUserNameUseCase {
    func getUserName(completion: @escaping (_ userName: String?) -> Void)
}
