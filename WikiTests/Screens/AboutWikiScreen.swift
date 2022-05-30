import Foundation
import XCTest
import SwiftUI

class AboutWikiScreen {
    let app: XCUIApplication
    let authorsSection: XCUIElement
    let translatorsSection: XCUIElement
    let licenseSection: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        authorsSection = app.staticTexts["Авторы"]
        translatorsSection = app.staticTexts["Переводчики"]
        licenseSection = app.staticTexts["Лицензия содержимого"]
    }
}
