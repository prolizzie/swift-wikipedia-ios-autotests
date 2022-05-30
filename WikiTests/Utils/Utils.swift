import XCTest

func deleteApp() {
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    let icon = springboard.icons["Википедия"]
    if icon.exists {
        icon.press(forDuration: 1.3)
        sleep(1)
        springboard.buttons["Удалить приложение"].tap()
        sleep(1)
        springboard.alerts.buttons["Удалить приложение"].tap()
        sleep(1)
        springboard.alerts.buttons["Удалить"].tap()
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
