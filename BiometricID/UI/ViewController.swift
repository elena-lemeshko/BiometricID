import UIKit


// MARK: - ViewController

class ViewController: UIViewController {
    
    // MARK: - Private variables
    
    private let context = AuthContextImpl()
    
    // MARK: - View Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        context.authenticateByBiometricId()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startObserving()
    }
    
}

// MARK: - Observing

private extension ViewController {
    
    func startObserving() {
        log("Start observing for foreground state")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(accessTheAppUsingTouchId(_ :)),
                                               name: .UIApplicationWillEnterForeground,
                                               object: nil)
    }
    
    @objc
    func accessTheAppUsingTouchId(_ notification: Notification) {
        log("Got notification \(notification)")
        context.authenticateByBiometricId()
    }
    
}
