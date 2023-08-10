//
//  CountryModel.swift
//  CountryApp3
//
//  Created by Khushboo on 16/09/22.
//

import Foundation
import SwiftUI
import Combine

struct countries : Identifiable {
    var id = String()
    
    var country = String()
}


class CountryStore : ObservableObject {
    @Published var name = [countries]()
}
