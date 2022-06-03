import Foundation
import XCTest
import SwiftUI

class WikiTests: XCTestCase {
    
    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    
    override func setUp() {
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
        deleteApp()
    }
    
    func testMostReadScreenOpened() {
        let onboardingScreen = OnboardingScreen(app: app)
        let mainScreen = MainScreen(app: app)
        let mostReadScreen = MostReadScreen(app: app)
        
        onboardingScreen
            .skipButton.tap()
        mainScreen
            .mostReadArticlesButton.tap()
        assertElementExists(element: mostReadScreen.mostReadPageHeader)
    }
    
    func testAboutScreen() {
        let onboardingScreen = OnboardingScreen(app: app)
        let mainScreen = MainScreen(app: app)
        let settingsScreen = SettingsScreen(app: app)
        let aboutWikiScreen = AboutWikiScreen(app: app)
        
        onboardingScreen
            .skipButton.tap()
        waitForElementAndTap(element: mainScreen.settingsButton)
        settingsScreen
            .aboutWikipediaButton.tap()
        assertElementExists(element: aboutWikiScreen.authorsSection)
        assertElementExists(element: aboutWikiScreen.translatorsSection)
        assertElementExists(element: aboutWikiScreen.licenseSection)
    }
    
    func testBrowserRedirect() {
        let onboardingScreen = OnboardingScreen(app: app)
        let mainScreen = MainScreen(app: app)
        let settingsScreen = SettingsScreen(app: app)
        
        onboardingScreen
            .skipButton.tap()
        waitForElementAndTap(element: mainScreen.settingsButton)
        settingsScreen
            .supportWikipediaButton.tap()
        checkIsSafariOpened()
        closeSafari()
    }
}
