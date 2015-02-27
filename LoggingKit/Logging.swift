//
//  Logging.swift
//  LoggingKit
//
//  Created by 林達也 on 2015/02/26.
//  Copyright (c) 2015年 林達也. All rights reserved.
//

import Foundation

/**
<#Description#>
*/
public func LOGGING_ERROR() {
    Logging.level = .Error
}

/**
<#Description#>
*/
public func LOGGING_WARN() {
    Logging.level = .Warn
}

/**
<#Description#>
*/
public func LOGGING_INFO() {
    Logging.level = .Info
}

/**
<#Description#>
*/
public func LOGGING_DEBUG() {
    Logging.level = .Debug
}

/**
<#Description#>
*/
public func LOGGING_VERBOSE() {
    Logging.level = .Verbose
}

public struct Logging {
    
    enum Level: Int, Printable {
        
        case Error = 1
        case Warn
        case Info
        case Debug
        case Verbose
        
        var description: String {
            switch self {
            case .Error:
                return "ERROR"
            case .Warn:
                return "WARN"
            case .Info:
                return "INFO"
            case .Debug:
                return "DEBUG"
            case .Verbose:
                return "VERBOSE"
            }
        }
    }
    
    static var level = Level.Error
    
    
    /**
    <#Description#>
    
    :param: object   <#object description#>
    :param: file     <#file description#>
    :param: function <#function description#>
    :param: line     <#line description#>
    */
    public static func e<T>(object: @autoclosure () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        if let (p, t) = self.printer(.Error, object, file, function, line) {
            doPrint(p, t)
        }
    }
    
    /**
    <#Description#>
    
    :param: object   <#object description#>
    :param: file     <#file description#>
    :param: function <#function description#>
    :param: line     <#line description#>
    */
    public static func w<T>(object: @autoclosure () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        if let (p, t) = self.printer(.Warn, object, file, function, line) {
            doPrint(p, t)
        }
    }
    
    /**
    <#Description#>
    
    :param: object   <#object description#>
    :param: file     <#file description#>
    :param: function <#function description#>
    :param: line     <#line description#>
    */
    public static func i<T>(object: @autoclosure () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        if let (p, t) = self.printer(.Info, object, file, function, line) {
            doPrint(p, t)
        }
    }
    
    /**
    <#Description#>
    
    :param: object   <#object description#>
    :param: file     <#file description#>
    :param: function <#function description#>
    :param: line     <#line description#>
    */
    public static func d<T>(object: @autoclosure () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        if let (p, t) = self.printer(.Debug, object, file, function, line) {
            doPrint(p, t)
        }
    }
    
    /**
    <#Description#>
    
    :param: object   <#object description#>
    :param: file     <#file description#>
    :param: function <#function description#>
    :param: line     <#line description#>
    */
    public static func v<T>(object: @autoclosure () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        if let (p, t) = self.printer(.Verbose, object, file, function, line) {
            doPrint(p, t)
        }
    }

    
    static func printer<T>(level: Level, _ t: @autoclosure () -> T!, _ file: StaticString, _ function: StaticString, _ line: Int) -> (String, T!)? {
        if self.level.rawValue > level.rawValue - 1 {
            return ("[\(level)] \(file.stringValue.lastPathComponent) - \(function)@L\(line): ", t())
        }
        return nil
    }
}

//MARK: verbose
extension Logging {
    
    public static func e<T1, T2>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2()), file, function, line)
    }
    
    public static func e<T1, T2, T3>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2(), t3()), file, function, line)
    }
    
    public static func e<T1, T2, T3, T4>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func e<T1, T2, T3, T4, T5>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ t5: @autoclosure () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: warn
extension Logging {
    
    public static func w<T1, T2>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2()), file, function, line)
    }
    
    public static func w<T1, T2, T3>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2(), t3()), file, function, line)
    }
    
    public static func w<T1, T2, T3, T4>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func w<T1, T2, T3, T4, T5>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ t5: @autoclosure () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: info
extension Logging {
    
    public static func i<T1, T2>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2()), file, function, line)
    }
    
    public static func i<T1, T2, T3>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2(), t3()), file, function, line)
    }
    
    public static func i<T1, T2, T3, T4>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func i<T1, T2, T3, T4, T5>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ t5: @autoclosure () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: debug
extension Logging {
    
    public static func d<T1, T2>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2()), file, function, line)
    }
    
    public static func d<T1, T2, T3>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2(), t3()), file, function, line)
    }
    
    public static func d<T1, T2, T3, T4>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func d<T1, T2, T3, T4, T5>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ t5: @autoclosure () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: verbose
extension Logging {
    
    public static func v<T1, T2>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2()), file, function, line)
    }
    
    public static func v<T1, T2, T3>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2(), t3()), file, function, line)
    }
    
    public static func v<T1, T2, T3, T4>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func v<T1, T2, T3, T4, T5>(t1: @autoclosure () -> T1!, _ t2: @autoclosure () -> T2!, _ t3: @autoclosure () -> T3!, _ t4: @autoclosure () -> T4!, _ t5: @autoclosure () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

private func doPrint<T>(prefix: String, t: T!) {
    print(prefix)
    println(t)
}