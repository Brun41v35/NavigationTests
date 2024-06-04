import UIKit
@testable import NavigationTests

final class HomeViewControllerSpy: UIViewController {

    // MARK: - Private(set) Properties

    private(set) var presentCallCount = 0
    private(set) var viewControllerToPresentArgs = [UIViewController]()
    private(set) var animatedFlagArgs = [Bool]()
    private(set) var completionArgs = [(() -> Void)?]()

    // MARK: - Methods

    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        presentCallCount += 1
        viewControllerToPresentArgs.append(viewControllerToPresent)
        animatedFlagArgs.append(flag)
        completionArgs.append(completion)
    }
}
