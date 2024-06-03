//
//  ChattingRoomViewController.swift
//  TravelPlatform
//
//  Created by 하연주 on 6/3/24.
//

import UIKit

class ChattingRoomViewController: UIViewController {
    var chattingData : ChatRoom?
//    var keyboardHeight : CGFloat = 0
    
    @IBOutlet var chattingInputTextField: UITextField!
    @IBOutlet var chattingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chattingInputTextField.configureDefaultTextField(placeholder: "적으세요")
        setupTextField()
        setupTableView()
        
        guard let chattingData else {return }
        configureNavigation(title: chattingData.chatroomName)
        
        print("ChattingData -> ", chattingData)
        
//        view.backgroundColor = .green
        
        /*
        //Subscribe to a Notification which will fire before the keyboard will show
        //키보드가 보이기 전에
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        
        //Subscribe to a Notification which will fire before the keyboard will hide
        //키보드가 사라지기 전에
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
        
        //주변 클릭하면 키보드 숨기기
        hideKeyboardWhenTappedAround()
         
         */
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /*
        //Unsubscribe from all our notifications
        unsubscribeFromAllNotifications()
         
         */
    }

    // MARK: - Setup
    
    private func setupTextField () {
        chattingInputTextField.delegate = self
    }
    
    // MARK: - Method
    




}

extension ChattingRoomViewController : UITextFieldDelegate {
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        keyboardWillShow()
//    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        var moveValueUp:CGFloat = 0.0
//        
//        moveValueUp = CGFloat(keyboardHeight)
//
//        if moveValueUp > 0 {
//            animateViewMoving(true, moveValue: moveValueUp)
//        }
//    }
}



/*
extension ChattingRoomViewController {
    
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
    
    func unsubscribeFromAllNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
//    @objc func keyboardWillShowOrHide(notification: NSNotification) {
//        // Get required info out of the notification
//        if 
//            let scrollView = backgroundSV,
//                let userInfo = notification.userInfo,
//                let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey],
//                let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey],
//                let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {
//            
//            // Transform the keyboard's frame into our view's coordinate system
//            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)
//            
//            // Find out how much the keyboard overlaps our scroll view
//            let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y
//            
//            // Set the scroll view's content inset & scroll indicator to avoid the keyboard
//            scrollView.contentInset.bottom = keyboardOverlap
//            scrollView.scrollIndicatorInsets.bottom = keyboardOverlap
//            
//            let duration = (durationValue as AnyObject).doubleValue
//            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
//            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {
//                self.view.layoutIfNeeded()
//            }, completion: nil)
//        }
//    }
    
//    @objc func keyboardWillShowOrHide(notification: NSNotification) {
//        // Get required info out of the notification
//        if
////            let scrollView = backgroundSV,
//                let userInfo = notification.userInfo,
//                let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey],
//                let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey],
//                let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {
//            
//            print("💚💚💚💚")
//            
//            // Transform the keyboard's frame into our view's coordinate system
//            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)
//            print("💚💚💚💚endRect", endRect)
//            
//            // Find out how much the keyboard overlaps our scroll view
//            let keyboardOverlap = view.frame.maxY - endRect.origin.y
//            print("💚💚💚💚view.frame.maxY", view.frame.maxY)
//            print("💚💚💚💚endRect.origin.y", endRect.origin.y)
//            print("💚💚💚💚keyboardOverlap", keyboardOverlap)
//            
//            
////            view.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: keyboardOverlap, right: 0)
//            
//            view.layoutMargins.bottom = keyboardOverlap
//            // Set the scroll view's content inset & scroll indicator to avoid the keyboard
////            scrollView.contentInset.bottom = keyboardOverlap
////            scrollView.scrollIndicatorInsets.bottom = keyboardOverlap
//            
//            let duration = (durationValue as AnyObject).doubleValue
//            print("💚💚💚💚duration", duration)
//            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
//            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {
//                self.view.layoutIfNeeded()
//            }, completion: nil)
//        }
//    }
}
 */



