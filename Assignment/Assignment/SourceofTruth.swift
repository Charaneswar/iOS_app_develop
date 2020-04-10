//
//  SourceofTruth.swift
//  Assignment
//
//  Created by Charan on 09/04/20.
//  Copyright © 2020 Charan. All rights reserved.
//

import SwiftUI
class SourceOfTruth: ObservableObject{
    @Published var max:String = "9"
    @Published var min:String = "0"
    @Published var slider = 0.0
    @Published var max_n = 9
    @Published var min_n = 0
    @Published var viewtag:Int? = nil
}
