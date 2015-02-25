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
                return "Error"
            case .Warn:
                return "Warn"
            case .Info:
                return "Info"
            case .Debug:
                return "Debug"
            case .Verbose:
                return "Verbose"
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
    public static func e<T>(@autoclosure object: () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
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
    public static func w<T>(@autoclosure object: () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
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
    public static func i<T>(@autoclosure object: () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
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
    public static func d<T>(@autoclosure object: () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
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
    public static func v<T>(@autoclosure object: () -> T!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        if let (p, t) = self.printer(.Verbose, object, file, function, line) {
            doPrint(p, t)
        }
    }

    
    static func printer<T>(level: Level, @autoclosure _ t: () -> T!, _ file: StaticString, _ function: StaticString, _ line: Int) -> (String, T!)? {
        if self.level.rawValue > level.rawValue - 1 {
            return ("", t())
        }
        return nil
    }
}

//MARK: verbose
extension Logging {
    
    public static func e<T1, T2>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2()), file, function, line)
    }
    
    public static func e<T1, T2, T3>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2(), t3()), file, function, line)
    }
    
    public static func e<T1, T2, T3, T4>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func e<T1, T2, T3, T4, T5>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, @autoclosure _ t5: () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.e((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: warn
extension Logging {
    
    public static func w<T1, T2>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2()), file, function, line)
    }
    
    public static func w<T1, T2, T3>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2(), t3()), file, function, line)
    }
    
    public static func w<T1, T2, T3, T4>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func w<T1, T2, T3, T4, T5>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, @autoclosure _ t5: () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.w((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: info
extension Logging {
    
    public static func i<T1, T2>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2()), file, function, line)
    }
    
    public static func i<T1, T2, T3>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2(), t3()), file, function, line)
    }
    
    public static func i<T1, T2, T3, T4>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func i<T1, T2, T3, T4, T5>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, @autoclosure _ t5: () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.i((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: debug
extension Logging {
    
    public static func d<T1, T2>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2()), file, function, line)
    }
    
    public static func d<T1, T2, T3>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2(), t3()), file, function, line)
    }
    
    public static func d<T1, T2, T3, T4>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func d<T1, T2, T3, T4, T5>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, @autoclosure _ t5: () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.d((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

//MARK: verbose
extension Logging {
    
    public static func v<T1, T2>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2()), file, function, line)
    }
    
    public static func v<T1, T2, T3>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2(), t3()), file, function, line)
    }
    
    public static func v<T1, T2, T3, T4>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2(), t3(), t4()), file, function, line)
    }
    
    public static func v<T1, T2, T3, T4, T5>(@autoclosure t1: () -> T1!, @autoclosure _ t2: () -> T2!, @autoclosure _ t3: () -> T3!, @autoclosure _ t4: () -> T4!, @autoclosure _ t5: () -> T5!, _ file: StaticString = __FILE__, _ function: StaticString = __FUNCTION__, _ line: Int = __LINE__) {
        self.v((t1(), t2(), t3(), t4(), t5()), file, function, line)
    }
}

private func doPrint<T>(prefix: String, t: T!) {
    print(prefix)
    println(t)
}