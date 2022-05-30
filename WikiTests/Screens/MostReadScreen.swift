import Foundation
import XCTest

class MostReadScreen {
    let app: XCUIApplication
    let mostReadPageHeader: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        mostReadPageHeader = app.staticTexts["Самые читаемые"].firstMatch
    }
}
