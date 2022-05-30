import Foundation
import XCTest
import SwiftUI

class WikiTests: XCTestCase {
    
    let app = XCUIApplication(bundleIdentifier: "org.wikimedia.wikipedia")
    
    override func setUp() {
        app.launch()
        app.wait()
        
    }
    
    override func tearDown() {
        app.terminate()
        deleteApp()
    }
    
    func testMostReadScreenOpened() {
        let onboardingScreen = OnboardingScreen(app: app)
        let mainScreen = MainScreen(app: app)
        let mostReadScreen = MostReadScreen(app: app)
        onboardingScreen.skipButton.tap()
        mainScreen.mostReadArticlesButton.tap()
        mostReadScreen.mostReadPageHeader.wait()
        assert(mostReadScreen.mostReadPageHeader.exists)
    }
    
    func testAboutScreen() {
        let onboardingScreen = OnboardingScreen(app: app)
        let mainScreen = MainScreen(app: app)
        let settingsScreen = SettingsScreen(app: app)
        let aboutWikiScreen = AboutWikiScreen(app: app)
        onboardingScreen.skipButton.tap()
        mainScreen.settingsButton.wait()
        mainScreen.settingsButton.tap()
        settingsScreen.aboutWikipediaButton.tap()
        aboutWikiScreen.authorsSection.wait()
        assert(aboutWikiScreen.authorsSection.exists)
        assert(aboutWikiScreen.translatorsSection.exists)
        assert(aboutWikiScreen.licenseSection.exists)
    }
    
    func testBrowserRedirect() {
        let onboardingScreen = OnboardingScreen(app: app)
        let mainScreen = MainScreen(app: app)
        let settingsScreen = SettingsScreen(app: app)
        onboardingScreen.skipButton.tap()
        mainScreen.settingsButton.wait()
        mainScreen.settingsButton.tap()
        settingsScreen.supportWikipediaButton.tap()
        checkIsSafariOpened()
    }
}
