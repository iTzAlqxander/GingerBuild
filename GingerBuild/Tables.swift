//
//  Tables.swift
//  GingerBuild
//
//  Created by Alexander Masztak on 12/8/22.
//

import UIKit

class Tables
{
    var table: String
    var club: String
    var beingUsed: Bool
    var membersArray: [String]
    var isTaken: Bool

    init(table t:String, club c:String, beingUsed b:Bool, membersArray m:[String], isTaken i:Bool)
    {
        table = t
        club = c
        beingUsed = b
        membersArray = m
        isTaken = i
    }
}
