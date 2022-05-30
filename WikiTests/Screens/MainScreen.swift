import Foundation
import XCTest

class MainScreen {

    let app: XCUIApplication
    let settingsButton: XCUIElement
    let mostReadArticlesButton: XCUIElement

    init(app: XCUIApplication) {
        self.app = app
        settingsButton = app.buttons.element(boundBy: 9)
        mostReadArticlesButton = app.buttons.element(boundBy: 6)
    }
}
