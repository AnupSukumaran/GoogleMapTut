//
//  TypeAliases.swift
//  EV Quiz
//
//  Created by Abraham VG on 18/09/18.
//  Copyright © 2018 WIS. All rights reserved.
//

import Foundation
import UIKit

typealias JSON = [String: AnyObject]
typealias Animation = (UITableViewCell, IndexPath, UITableView, UIButton) -> Void
//typealias ResultCompBlk = (Results<ModelClassResponse>) -> ()
typealias ResultStringCompBlk = (Results<String>) -> ()

let userDef = UserDefaults.standard
let storyBrd = UIStoryboard(name: "Main", bundle: nil)

