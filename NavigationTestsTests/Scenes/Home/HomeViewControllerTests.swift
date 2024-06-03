import Foundation
import XCTest
@testable import NavigationTests

final class HomeViewControllerTests: XCTestCase {

    func test_tappingPushButton_shouldPushProfileViewController() {
        let (sut, navigationController) = makeSUT()

        tap(sut.pushViewControllerButton)

        XCTAssertEqual(navigationController.viewControllerArgs.count, 2, "Navigation Stack")

        let pushedViewController = navigationController.viewControllerArgs.last

        guard let profileViewController = pushedViewController as? ProfileViewController else {
            XCTFail("Expected ProfileViewController, but was \(String(describing: pushedViewController))")
            return
        }

        XCTAssertEqual(profileViewController.textLabel.text, "Pushed from Code")
    }

    func test_tappingPresentButton_shouldPresentProfileViewController() {
        let sut = HomeViewController()
        sut.loadViewIfNeeded()
        sut.presentViewControllerButton.sendActions(for: .touchUpInside)
    }

    // MARK: - Helpers

    private func makeSUT() -> (sut: HomeViewController, navigationControllerL: NavigationControllerMock) {
        let sut = HomeViewController()
        sut.loadViewIfNeeded()
        let navigationController = NavigationControllerMock(rootViewController: sut)
        return (sut, navigationController)
    }

    private func tap(_ button: UIButton) {
        button.sendActions(for: .touchUpInside)
    }
}
