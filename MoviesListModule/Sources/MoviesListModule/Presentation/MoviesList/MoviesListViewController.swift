//
//  MoviesListViewController.swift
//  
//
//  Created by MB Labs on 06/02/24.
//

import UIKit

class MoviesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        let dataSource = MoviesListDataSourceImpl()
        dataSource.getMoviesList { data, success, error in
            print(3)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
