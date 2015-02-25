//
//  LoggingKitTests.swift
//  LoggingKitTests
//
//  Created by 林達也 on 2015/02/26.
//  Copyright (c) 2015年 林達也. All rights reserved.
//

import UIKit
import XCTest
//import LoggingKit

func fib(n:Int) -> Int {
    if n < 1  {return 0}
    if n == 1 {return 1}
    
    return fib(n-1)+fib(n-2)
}

func fibs(n:Int) -> [Int] {
    if n == 0 {return []}
    if n == 1 {return [1]}
    
    return fibs(n-1) + [fib(n)]
}

class LoggingKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Logging.level = .Error
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_level() {
        
        let test = [
            Logging.Level.Error: [true, false, false, false, false],
            Logging.Level.Warn: [true, true, false, false, false],
            Logging.Level.Info: [true, true, true, false, false],
            Logging.Level.Debug: [true, true, true, true, false],
            Logging.Level.Verbose: [true, true, true, true, true],
        ]
        
        for (level, expected) in test {
            Logging.level = level
            let ret1 = Logging.printer(.Error, "", "", "", 0) != nil
            let ret2 = Logging.printer(.Warn, "", "", "", 0) != nil
            let ret3 = Logging.printer(.Info, "", "", "", 0) != nil
            let ret4 = Logging.printer(.Debug, "", "", "", 0) != nil
            let ret5 = Logging.printer(.Verbose, "", "", "", 0) != nil
            XCTAssertTrue(ret1 == expected[0], "\(Logging.Level.Error)で\(level)が表示されています")
            XCTAssertTrue(ret2 == expected[1], "\(Logging.Level.Warn)で\(level)が表示されています")
            XCTAssertTrue(ret3 == expected[2], "\(Logging.Level.Info)で\(level)が表示されています")
            XCTAssertTrue(ret4 == expected[3], "\(Logging.Level.Debug)で\(level)が表示されています")
            XCTAssertTrue(ret5 == expected[4], "\(Logging.Level.Verbose)で\(level)が表示されています")
        }
        
    }
    
    func test_表示されなければ評価されない() {
        var cnt = 0
        let counter = { ++cnt }
        
        Logging.v(counter())
        XCTAssertEqual(cnt, 0, "")
        
        Logging.v(counter(), counter())
        XCTAssertEqual(cnt, 0, "")
        
        
        Logging.level = .Verbose
        
        Logging.v(counter())
        XCTAssertEqual(cnt, 1, "")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        
        self.measureBlock() {
            // Put the code you want to measure the time of here.
            for _ in 0..<100 {
                Logging.v(fibs(25))
            }
        }
    }
    
}
