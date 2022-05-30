import Foundation
import XCTest

class SettingsScreen {
    let app: XCUIApplication
    let aboutWikipediaButton: XCUIElement
    let supportWikipediaButton: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        aboutWikipediaButton = app.cells.staticTexts["О приложении"].firstMatch
        supportWikipediaButton = app.cells.staticTexts["Поддержать Википедию"].firstMatch
    }
}
