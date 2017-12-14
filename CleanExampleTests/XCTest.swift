//
//  XCTest.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 12-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import ObjectiveC
import Mockingjay
import XCTest

let swizzleTearDown: Void = {
    guard
        let tearDown = class_getInstanceMethod(XCTest.self, #selector(XCTest.tearDown)),
        let mockingjayTearDown = class_getInstanceMethod(XCTest.self, #selector(XCTest.mockingjayTearDown))
        else { return }
    method_exchangeImplementations(tearDown, mockingjayTearDown)
}()
var mockingjayRemoveStubOnTearDownHandle: UInt8 = 0
extension XCTest {
    // MARK: Stubbing

    /// Whether Mockingjay should remove stubs on teardown
    public var mockingjayRemoveStubOnTearDown: Bool {
        get {
            let associatedResult = objc_getAssociatedObject(self, &mockingjayRemoveStubOnTearDownHandle) as? Bool
            return associatedResult ?? true
        }

        set {
            objc_setAssociatedObject(
                self,
                &mockingjayRemoveStubOnTearDownHandle,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

    @discardableResult public func stub(
        _ matcher: @escaping Matcher,
        delay: TimeInterval? = nil,
        _ builder: @escaping Builder
        ) -> Stub {
        if mockingjayRemoveStubOnTearDown {
            XCTest.mockingjaySwizzleTearDown()
        }

        return MockingjayProtocol.addStub(matcher: matcher, delay: delay, builder: builder)
    }

    public func removeStub(_ stub: Stub) {
        MockingjayProtocol.removeStub(stub)
    }

    public func removeAllStubs() {
        MockingjayProtocol.removeAllStubs()
    }

    // MARK: Teardown

    public class func mockingjaySwizzleTearDown() {
        _ = swizzleTearDown
    }

    @objc func mockingjayTearDown() {
        mockingjayTearDown()

        if mockingjayRemoveStubOnTearDown {
            MockingjayProtocol.removeAllStubs()
        }
    }

    func readJSONData(fileName: String) -> Data {
        let testBundle = Bundle(for: type(of: self))
        if let fileURL = testBundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                return data
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("File: \(fileName), not found un Bundle")
        }
    }
}
