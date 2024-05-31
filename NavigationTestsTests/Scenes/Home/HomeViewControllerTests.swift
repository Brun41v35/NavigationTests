import Foundation
import XCTest
@testable import NavigationTests

final class NavigationControllerMock: UINavigationController {

    // MARK: - Private(set) properties

    private(set) var viewControllerArgs = [UIViewController]()
    private(set) var viewControllerPresentArgs = [UIViewController]()
    private(set) var pushViewControllerArgsAnimated = [Bool]()
    private(set) var presentViewControllerArgsAnimated = [Bool]()

    // MARK: - Methods

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewControllerArgs.append(viewController)
        pushViewControllerArgsAnimated.append(animated)
    }

    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        viewControllerPresentArgs.append(viewControllerToPresent)
        presentViewControllerArgsAnimated.append(flag)
    }
}

final class HomeViewControllerTests: XCTestCase {

    func test_tappingPushButton_shouldPushProfileViewController() {
        let (sut, navigationController) = makeSUT()

        tap(sut.pushViewControllerButton)

        executeRunLoop()

        XCTAssertEqual(navigationController.viewControllers.count, 2, "Navigation Stack")
        
        let pushedViewController = navigationController.viewControllers.last

        guard let profileViewController = pushedViewController as? ProfileViewController else {
            XCTFail("Expected ProfileViewController, but was \(String(describing: pushedViewController))")
            return
        }

        XCTAssertEqual(profileViewController.textLabel.text, "Pushed from Code")
    }

    // MARK: - Helpers

    private func makeSUT() -> (sut: HomeViewController, navigationControllerL: UINavigationController) {
        let sut = HomeViewController()
        sut.loadViewIfNeeded()
        let navigationController = UINavigationController(rootViewController: sut)
        return (sut, navigationController)
    }

    private func executeRunLoop() {
        RunLoop.current.run(until: Date())
    }

    private func tap(_ button: UIButton) {
        button.sendActions(for: .touchUpInside)
    }
}
