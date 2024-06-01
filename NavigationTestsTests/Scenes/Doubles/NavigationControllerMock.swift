import UIKit
@testable import NavigationTests

final class NavigationControllerMock: UINavigationController {

    // MARK: - Private(set) properties

    private(set) var viewControllerArgs = [UIViewController]()
    private(set) var viewControllerPresentArgs = [UIViewController]()
    private(set) var pushViewControllerArgsAnimated = [Bool]()
    private(set) var presentViewControllerArgsAnimated = [Bool]()

    // MARK: - Methods

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        viewControllerArgs.append(viewController)
        pushViewControllerArgsAnimated.append(animated)
    }

    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        viewControllerPresentArgs.append(viewControllerToPresent)
        presentViewControllerArgsAnimated.append(flag)
    }
}
