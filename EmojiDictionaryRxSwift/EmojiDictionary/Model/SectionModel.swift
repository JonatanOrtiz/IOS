//
//  SectionModel.swift
//  EmojiDictionary
//
//  Created by Jonatan Eduardo de Araujo on 08/04/21.
//

import Foundation
import RxDataSources

struct SectionModel {
  var header: String
  var items: [Emoji]
}

extension SectionModel: SectionModelType {
  init(original: SectionModel, items: [Emoji]) {
    self = original
    self.items = items
  }
}
