//
//  isNilOrEmpty.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

/**
 Determine whether Optional collection is nil or an empty collection
 :param: collection Optional collection
 :returns: true if collection is nil or if it is an empty collection, false otherwise
 */
public func isNilOrEmpty<C: CollectionType>(collection: C?) -> Bool {
  switch collection {
  case .Some(let nonNilCollection): return nonNilCollection.count == 0
  default:                          return true
  }
}

/**
 Determine whether Optional NSString is nil or an empty string
 :param: string Optional NSString
 :returns: true if string is nil or if it is an empty string, false otherwise
 */
public func isNilOrEmpty(string: NSString?) -> Bool {
  switch string {
  case .Some(let nonNilString): return nonNilString.length == 0
  default:                      return true
  }
}
/**
 Determine whether Optional String is nil or an empty string
 :param: string Optional String
 :returns: true if string is nil or if it is an empty string, false otherwise
 */
public func isNilOrEmpty(string: String?) -> Bool {
  if let str = string {
    return str.trim().characters.count == 0
  } else {
    return true
  }
}