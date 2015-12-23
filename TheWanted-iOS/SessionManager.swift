//
//  SessionManager.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/19/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import DigitsKit
import CocoaLumberjack

class SessionManager {
    
    /// Singleton
    static let sharedInstance = SessionManager()
    
    
    struct Defaults {
        private static let UserId  = "UserId"
        private static let UserName  = "UserName"
        private static let UserPhone  = "UserPhone"
        private static let UserEmail  = "UserEmail"
        private static let UserCrm  = "UserCrm"
        private static let UserIsAdmin  = "UserIsAdmin"
    }
    
    
    // MARK: - Properties
    
    
    /// The player. post notification to NSNotificationCenter when user is set or unset
    var player: PlayerModel? {
        didSet {
            let notification = player != nil ? UserNotification.Login : UserNotification.Logout
            DDLogVerbose(notification);
            NSNotificationCenter.defaultCenter().postNotificationName(notification, object: player)
        }
    }
    
    
    // MARK: - Methods
    
    
    /**
    Private init. use SessionManager.sharedInstance to get instance.
    Verify if Digits session is nil. If not, restore the user persisted data
    */
    private init() {
        DDLogVerbose("SessionManager.init()");
        
        restore()
        //if Digits.sharedInstance().session() != nil {
        //    restore()
        //}
        
    }
    
    
    /**
     Login With Twitter Digits
     */
    func loginWithDigits() {
        DDLogVerbose("SessionManager.loginWithDigits()");
        
        let appearence:DGTAppearance = DGTAppearance.init()
        appearence.accentColor = UIColor.init(red: 0.15, green: 0.34, blue: 0.20, alpha: 1.0)
        appearence.backgroundColor = UIColor.init(red: 0.008, green: 0.745, blue: 0.58, alpha: 1.0)
        
        let digits = Digits.sharedInstance()
        
        digits.authenticateWithDigitsAppearance(appearence, viewController: nil, title: "MediPonto") {
            [unowned self] (session, error) in
            
            if session != nil {
                DDLogVerbose("SessionManager.loginWithDigits().digits.authenticateWithDigitsAppearance.success");
                print(session.phoneNumber, session.userID)
                self.loginWith(session.phoneNumber)
                
                //Crashlytics.sharedInstance().setUserIdentifier(session.userID)
            }
            
        }
        
    }
    
    /**
     Call MediPontoAPI login method using phone number and call save() to persist user data
     - parameter phoneNumber: The user phone number
     */
    func loginWith(phoneNumber: String) {
        DDLogVerbose("SessionManager.loginWith(phoneNumber:\(phoneNumber))");
        
    }
    
    /**
     Set user to nil and remove any persisted data
     */
    func logout() {
        DDLogVerbose("SessionManager.logout()");
        
        Digits.sharedInstance().logOut()
        remove()
        player = nil
        // TODO: remove persisted data
    }
    
    
    // MARK: - Private Methods
    
    
    /**
    Persist the user data in user defaults
    */
    private func save() {
        DDLogVerbose("SessionManager.save()");
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
    }
    
    /**
     Try to restore persisted data stored in user defaults
     */
    private func restore() {
        DDLogVerbose("SessionManager.restore()")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
    }
    
    /**
     Restore persisted user data stored in user defaults
     */
    private func remove() {
        DDLogVerbose("SessionManager.remove()");
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.removeObjectForKey(Defaults.UserId)
        defaults.removeObjectForKey(Defaults.UserName)
        defaults.removeObjectForKey(Defaults.UserPhone)
        defaults.removeObjectForKey(Defaults.UserEmail)
        defaults.removeObjectForKey(Defaults.UserCrm)
    }
    
    
    func authorize() {
        DDLogVerbose("SessionManager.authorize()");
        
        
    }
}
