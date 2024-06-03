import UIKit
@testable import NavigationTests

final class NavigationControllerMock: UINavigationController {

    // MARK: - Private(set) properties

    private(set) var viewControllerArgs = [UIViewController]()
    private(set) var pushViewControllerArgsAnimated = [Bool]()

    // MARK: - Methods

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        viewControllerArgs.append(viewController)
        pushViewControllerArgsAnimated.append(animated)
    }
}
