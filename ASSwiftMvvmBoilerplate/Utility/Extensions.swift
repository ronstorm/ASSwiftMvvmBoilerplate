//
//  Extensions.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond

extension UIView {
    func makeCard() {
        self.layer.cornerRadius = 8;
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.3;
    }
    
    func makeCardRadius_2() {
        self.layer.cornerRadius = 8;
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 2;
        self.layer.shadowOpacity = 0.3;
    }
    
    func underlined(borderColor color: UIColor){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: UIScreen.main.bounds.width - 40.0, height: 1.0)
        bottomLine.backgroundColor = color.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    func makeRound(_ cornerRadius: Int, borderWidth width: CGFloat, borderColor color: UIColor) {
        self.layer.cornerRadius = CGFloat(cornerRadius);
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func makeCircular(){
        self.layer.cornerRadius = 0.5 * self.bounds.size.width;
        self.layer.borderWidth = 0;
        self.clipsToBounds = true;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
}

extension UITableView {
    var selectedRow: Signal<Int, NoError> {
        return reactive.delegate.signal(for: #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))) { (subject: PublishSubject<Int, NoError>, _: UITableView, indexPath: NSIndexPath) in
            subject.next(indexPath.row)
        }
    }
    
    func removeEmptyCells() {
        self.tableFooterView = UIView()
    }
}

extension UIImageView {
    
    func makeCircle() {
        self.layer.cornerRadius = 0.5 * self.bounds.size.width;
        self.layer.borderWidth = 0;
        self.clipsToBounds = true;
        self.layer.borderColor = UIColor.gray.cgColor;
        self.contentMode = .scaleAspectFill
    }
}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func getJpeg(_ quality: JPEGQuality) -> UIImage? {
        return UIImage(data: UIImageJPEGRepresentation(self, quality.rawValue)!)
    }
}

extension UIButton {
    func decorateButtonRound() {
        self.layer.cornerRadius = 15;
        self.clipsToBounds = true;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    func decorateButtonCardAndRound() {
        self.layer.cornerRadius = 15;
        self.clipsToBounds = true;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    func decorateButtonRound(_ cornerRadius: Int) {
        self.layer.cornerRadius = CGFloat(cornerRadius);
        self.clipsToBounds = true;
        self.layer.borderWidth = 1;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    func decorateButtonRound(_ cornerRadius: Int, borderWidth: CGFloat) {
        self.layer.cornerRadius = CGFloat(cornerRadius);
        self.clipsToBounds = true;
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    func decorateButton() {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    func makeCircle(){
        self.layer.cornerRadius = 0.5 * self.bounds.size.width;
        self.layer.borderWidth = 0;
        self.clipsToBounds = true;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
    
    func removeBorders() {
        self.layer.borderWidth = 0.0;
    }
}

extension UITextField {
    
    func removeBorders(){
        self.borderStyle = UITextBorderStyle.none
    }
    
    func makeCircle() {
        self.layer.borderColor = UIColor.gray.cgColor;
        self.layer.cornerRadius = 0.5 * self.bounds.size.width;
        self.layer.borderWidth = 1.0;
        self.clipsToBounds = true;
    }
    
    func makeRound() {
        self.layer.cornerRadius = 15;
        self.clipsToBounds = true;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor.lightGray.cgColor;
    }
    
    func setCustomTextRect() {
        
        self.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
    }
    
}

extension UITextView {
    func setCustomTextRect(withTopPadding padding: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: padding, left: 10, bottom: 0, right: 10)
    }
    
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}

extension UILabel {
    func makeRound() {
        self.layer.cornerRadius = 10;
        self.clipsToBounds = true;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = UIColor.gray.cgColor;
    }
}

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

extension UIScrollView {
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view: UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x: 0, y: childStartPoint.y, width: 1, height: self.frame.height), animated: animated)
        }
    }
    
    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    // Bonus: Scroll to bottom
    func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: animated)
        }
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
