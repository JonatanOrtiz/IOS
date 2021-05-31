//
//  ViewModel.swift
//  EmojiDictionary
//
//  Created by Curitiba on 08/04/21.
//

import Foundation
import UIKit
import RxSwift
import RxDataSources


class ViewModel {
  
  private let sectionListSubject = BehaviorSubject(value: [SectionModel(header: "", items: emojis)])
  
  func getSectionLists() -> Observable<[SectionModel]> {
    return sectionListSubject.asObservable()
  }
  
  func addItem(at indexPath: IndexPath, newItem: Emoji) {
    guard var sections = try? sectionListSubject.value() else { return }
    var currentSection = sections[indexPath.section]
    currentSection.items.append(newItem)
    sections[indexPath.section] = currentSection
    sectionListSubject.onNext(sections)
  }

  func removeItem(at indexPath: IndexPath) {
    guard var sections = try? sectionListSubject.value() else { return }
    var currentSection = sections[indexPath.section]
    currentSection.items.remove(at: indexPath.row)
    sections[indexPath.section] = currentSection
    sectionListSubject.onNext(sections)
  }
  
  func moveItem(fromIndexPath: IndexPath, toIndexPath: IndexPath) {
    guard var sections = try? sectionListSubject.value() else { return }
    var currentSection = sections[fromIndexPath.section]
    let itemToInsert = currentSection.items[fromIndexPath.row]
    currentSection.items.remove(at: fromIndexPath.row)
    currentSection.items.insert(itemToInsert, at: toIndexPath.row)
    sections[toIndexPath.section] = currentSection
    sectionListSubject.onNext(sections)
  }
}
