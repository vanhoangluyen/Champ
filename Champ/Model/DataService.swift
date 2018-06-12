//
//  DataService.swift
//  Champ
//
//  Created by apple on 6/12/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

typealias JSON = Dictionary<AnyHashable, Any>

class DataService {
    static let shared: DataService = DataService()
    
    var champs: [Champ] = []
    func getDataChamp(completedHandler: @escaping ([Champ]) -> Void) {
        guard let url = URL(string: "http://infomationchampion.pe.hu/showInfo.php?index=0&number=20") else { return  }
        let urlRequest = URLRequest(url: url)
        var champs : [Champ] = []
        DispatchQueue.global().async {
            let downloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return}
                guard let aData = data else {return}
                do {
                    guard let results = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? [JSON] else {return}
                    for result in results {
                        if let champ = Champ(dictionary: result) {
                            champs.append(champ)
                        }
                    }
                    DispatchQueue.main.async {
                        completedHandler(champs)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            })
            downloadTask.resume()
        }
    }
}
