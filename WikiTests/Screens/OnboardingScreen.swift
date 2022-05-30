import Foundation
import XCTest
import SwiftUI

class OnboardingScreen {
    let app: XCUIApplication
    let skipButton: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        skipButton = app.buttons.staticTexts["Пропустить"]
    }
}
