//
//  QSUTimeUtils.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation

public class QSUDateUtils {
  static var SimpleDateFormatter : NSDateFormatter {
    let dtf = NSDateFormatter()
    dtf.dateFormat = "yyyy-MM-dd"
    return dtf
  }
  static var LockedDateFormatter : NSDateFormatter {
    let dtf = NSDateFormatter()
    dtf.dateFormat = "dd MMM HH:ss"
    return dtf
  }
  static var APIDateFormatter : NSDateFormatter {
    let dtf = NSDateFormatter()
    dtf.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
    return dtf
  }
  static var DayMonthFormatter : NSDateFormatter {
    let dtf = NSDateFormatter()
    dtf.dateFormat = "dd MMM"
    return dtf
  }
  static var TimeFormatter : NSDateFormatter {
    let dtf = NSDateFormatter()
    dtf.dateFormat = "HH:mm"
    return dtf
  }
}

public class QSUTimeZoneUtils {
  
  // "GMT-2"
  static func getAbbreviatedTimeZone() -> String { return NSTimeZone.localTimeZone().abbreviation ?? "" }
  
  // "America/Sao_Paulo"
  static func getTimeZoneName() -> String { return NSTimeZone.localTimeZone().name }
  
  //all known timezones abbreviations
  static func timeZoneAbbreviations() -> [String:String] { return NSTimeZone.abbreviationDictionary() }
  
  //all known timezones names
  static func timeZoneNames() -> [String] { return NSTimeZone.knownTimeZoneNames() }
  
  static func isDaylightSavingTime() -> Bool {
    return NSTimeZone.localTimeZone().daylightSavingTime
  }
  
  static func daylightSavingTimeOffset() -> NSTimeInterval {
    return NSTimeZone.localTimeZone().daylightSavingTimeOffset
  }
  
  static func nextDaylightSavingTimeTransition() -> NSDate? {
    return NSTimeZone.localTimeZone().nextDaylightSavingTimeTransition
  }
  
  static func  nextDaylightSavingTimeTransitionAfterNext(dateToConsider: NSDate?) -> NSDate? {
    guard
      let nextDaylightSavingTimeTransition = dateToConsider
      else { return nil }
    return NSTimeZone.localTimeZone().nextDaylightSavingTimeTransitionAfterDate(nextDaylightSavingTimeTransition)
  }
  
  static func getDeviceLocaleWithLanguage() -> String {
    let langId = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode) as! String
    let countryId = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String
    let language = "\(langId)_\(countryId)" // en_US on my machine
    
    return language;
  }
  
  static func getDeviceLocale() -> String {
    let langId = NSLocale.currentLocale().objectForKey(NSLocaleLanguageCode) as! String
    let language = "\(langId)" // en on my machine
    
    return language;
  }
}
