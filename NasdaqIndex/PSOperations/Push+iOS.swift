#if os(iOS)

import UIKit

public struct Push: CapabilityType {

    public static func didReceiveToken(_ token: Data) {
        authorizer.completeAuthorization(token, error: nil)
    }

    public static func didFailRegistration(_ error: CFError) {
        authorizer.completeAuthorization(nil, error: error)
    }

    public static let name = "Push"

    public init(application: UIApplication) {
        if authorizer.application == nil {
            authorizer.application = application
        }
    }

    public func requestStatus(_ completion: @escaping (CapabilityStatus) -> Void) {
        if authorizer.token != nil {
            completion(.authorized)
        } else {
            completion(.notDetermined)
        }
    }

    public func authorize(_ completion: @escaping (CapabilityStatus) -> Void) {
        authorizer.authorize(completion)
    }
}

private let authorizer = PushAuthorizer()

private class PushAuthorizer {

    var application: UIApplication?
    var token: Data?
    var completion: ((CapabilityStatus) -> Void)?

    func authorize(_ completion: @escaping (CapabilityStatus) -> Void) {
        guard self.completion == nil else {
            fatalError("Cannot request push authorization while a request is already in progress")
        }

        self.completion = completion

        guard let application = application else {
            fatalError("An application has not yet been configured, so this won't work")
        }

        application.registerForRemoteNotifications()
    }

    func completeAuthorization(_ token: Data?, error: CFError?) {
        self.token = token

        guard let completion = self.completion else { return }
        self.completion = nil

        if token != nil {
            completion(.authorized)
        } else if let error = error {
            completion(.error(error))
        } else {
            completion(.notDetermined)
        }
    }
}

#endif
