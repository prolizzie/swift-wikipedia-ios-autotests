import XCTest

func deleteApp() {
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    let icon = springboard.icons["Википедия"]
    if icon.exists {
        icon.press(forDuration: 1.3)
        waitForElementAndTap(element:  springboard.buttons["Удалить приложение"])
        waitForElementAndTap(element: springboard.alerts.buttons["Удалить приложение"])
        waitForElementAndTap(element: springboard.alerts.buttons["Удалить"])
        XCUIDevice.shared.press(.home)
    }
}

extension XCUIElement {
    @discardableResult
    func wait(_ timeout: TimeInterval = 10) -> Self {
        XCTAssertTrue(self.waitForExistence(timeout: timeout), "Element doesn't exist")
        return self
    }
    
    func waitForElementToAppear() -> XCTWaiter.Result {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        let result = XCTWaiter().wait(for: [expectation], timeout: 20)
        return result
    }
}

func checkIsSafariOpened() {
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    let isSafariOpened = safari.wait(for: .runningForeground, timeout: 30)
    assert(isSafariOpened)
    safari.terminate()
}

func assertElementExists(element: XCUIElement) {
    element.wait()
    assert(element.exists)
}

func waitForElementAndTap(element: XCUIElement) {
    assertElementExists(element: element)
    element.tap()
}
