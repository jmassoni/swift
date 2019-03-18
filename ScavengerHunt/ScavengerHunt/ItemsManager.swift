//
//  ItemsManager.swift
//  ScavengerHunt
//
//  Created by Joey Massoni on 2/4/16.
//  Copyright © 2016 Joey Massoni. All rights reserved.
//

import Foundation
import UIKit

class ItemsManager {
    var itemsList = [ScavengerHuntItem]()
    
    func archivePath () -> String? {
        let directoryList =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
        return documentsPath + "/ScavengerHuntItems"
    }
        assertionFailure("Could not determine where to save.")
        return nil
    }
    
    func save() {
    if let theArchivePath = archivePath() {
        if NSKeyedArchiver.archiveRootObject(itemsList,
            toFile: theArchivePath) {
                print ("Saved Successfully")
        } else {
            assertionFailure("Could not save file.")
        }
    }
}

init () {
    if let theArchivePath = archivePath() {
        if
            NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath)
                as! [ScavengerHuntItem]
            }
        }
    }
}