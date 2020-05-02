//
//  RealmProducer.swift
//  ToDoApp
//
//  Created by Mustafa ÖZDEMİR on 1.05.2020.
//  Copyright © 2020 Mustafa OZDEMIR. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmProducer{
    
    ///Eager Init
    private static var database:Realm = try! Realm()
    
    private init(){
        
    }
    public static func getRealm() -> Realm{
        return RealmProducer.database
    }
}
