import Foundation
import LocalAuthentication


// MARK: - @protocol AuthContext

protocol AuthContext {
    
    func authenticateByBiometricId()
}

// MARK: - AuthContextImpl

class AuthContextImpl {
    
    // MARK: - Private variables
    
    private let context = LAContext()
    private let reason = "Access the app"
    private let laPolicy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
    
}

// MARK: - @protocol AuthContext Implementation

extension AuthContextImpl: AuthContext {
    
    func authenticateByBiometricId() {
        log()
        guard #available(iOS 8.0, *) else {
            return
        }
        
        var authError: NSError?
        guard context.canEvaluatePolicy(laPolicy, error: &authError) else {
            if let error = authError {
                log("Couldn't evaluate policy \(laPolicy) with error: \(error)")
            }
            return
        }
        
        context.evaluatePolicy(laPolicy,
                               localizedReason: reason) { success, evaluateError in
                                if success {
                                    log("User authenticated successfully")
                                    return
                                }
                                
                                if let error = evaluateError {
                                    log("Failed to authenticate with error: \(error)")
                                }
        }
    }
    
}
