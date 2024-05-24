import UIKit

final class HomeViewController: UIViewController {

    // MARK: Private Properties

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let pushViewControllerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push ViewController", for: .normal)
        button.configuration = .tinted()
        button.configuration?.baseBackgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let presentViewControllerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present ViewController", for: .normal)
        button.configuration = .tinted()
        button.configuration?.baseBackgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
        setupBackgroundColor()
        bindLayoutEvents()
    }

    private func setupViewHierarchy() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubview(pushViewControllerButton)
        containerStackView.addArrangedSubview(presentViewControllerButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            pushViewControllerButton.heightAnchor.constraint(equalToConstant: 48),
            presentViewControllerButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func setupBackgroundColor() {
        view.backgroundColor = .systemBackground
    }

    private func bindLayoutEvents() {
        pushViewControllerButton.addTarget(self,
                                           action: #selector(didTapPushViewControllerButton),
                                           for: .touchUpInside)

        presentViewControllerButton.addTarget(self,
                                              action: #selector(didTapPresentViewControllerButton),
                                              for: .touchUpInside)
    }

    @objc
    private func didTapPushViewControllerButton() {
        let profileViewController = ProfileViewController(text: "Pushed from Code")
        navigationController?.pushViewController(profileViewController, animated: true)
    }

    @objc
    private func didTapPresentViewControllerButton() {
        let presentViewController = ProfileViewController(text: "Modal from Code")
        present(presentViewController, animated: true)
    }
}
