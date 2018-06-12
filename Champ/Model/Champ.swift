//
//  Champ.swift
//  Champ
//
//  Created by apple on 6/12/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation

class Champ {
    var nameEN_Champ: String
    var nameVN_Champ: String
    var level_Champ: String
    var url_Champ: String
    
    init?(dictionary: JSON) {
        guard let nameEN_Champ = dictionary["nameEN_Champ"] as? String else { return nil }
        guard let nameVN_Champ = dictionary["nameVN_Champ"] as? String else { return nil }
        guard let level_Champ = dictionary["level_Champ"] as? String else { return nil }
        guard let url_Champ = dictionary["url_Champ"] as? String else { return nil }
        
        self.level_Champ = level_Champ
        self.nameEN_Champ = nameEN_Champ
        self.nameVN_Champ = nameVN_Champ
        self.url_Champ = url_Champ
    }
}
