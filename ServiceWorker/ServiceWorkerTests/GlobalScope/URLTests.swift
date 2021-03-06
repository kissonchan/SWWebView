import XCTest
@testable import ServiceWorker

class URLTests: XCTestCase {

    func testURLExists() {

        let sw = ServiceWorker.createTestWorker(id: name)

        sw.evaluateScript("typeof(URL) != 'undefined' && self.URL == URL")
            .then { (val: Bool?) in

                XCTAssertEqual(val, true)
            }
            .assertResolves()
    }

    func testURLHashExists() {

        let sw = ServiceWorker.createTestWorker(id: name)

        sw.evaluateScript("new URL('http://www.example.com/#test').hash")
            .then { (val: String?) in

                XCTAssertEqual(val, "#test")
            }
            .assertResolves()
    }

    func testURLHashCanBeSet() {

        let sw = ServiceWorker.createTestWorker(id: name)

        sw.evaluateScript("let url = new URL('http://www.example.com/#test'); url.hash = 'test2'; url.hash")
            .then { (val: String?) in

                XCTAssertEqual(val, "#test2")
            }
            .assertResolves()
    }
}
