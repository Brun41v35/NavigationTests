import Foundation
import XCTest
@testable import NavigationTests

final class HomeViewControllerTests: XCTestCase {

    func test_tappingPushButton_shouldPushProfileViewController() {
        let sut = HomeViewController()
        sut.loadViewIfNeeded()
        let navigationController = UINavigationController(rootViewController: sut)

        tap(sut.pushViewControllerButton)

        executeRunLoop()

        XCTAssertEqual(navigationController.viewControllers.count, 2, "Navigation Stack")

        let pushedViewController = navigationController.viewControllers.last

        XCTAssertTrue(pushedViewController is ProfileViewController,
                      "Expected ProfileViewController, but was \(String(describing: pushedViewController))")
    }

    // MARK: - Helpers

    private func executeRunLoop() {
        RunLoop.current.run(until: Date())
    }

    private func tap(_ button: UIButton) {
        button.sendActions(for: .touchUpInside)
    }
}
