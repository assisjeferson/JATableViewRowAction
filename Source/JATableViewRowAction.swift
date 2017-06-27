//
//  JATableViewRowAction.swift
//  JATableViewRowAction
//
//  Created by Jeferson Assis on 26/06/17.
//  Copyright © 2017 Jeferson Assis. All rights reserved.
//

import UIKit

open class JATableViewRowAction: UITableViewRowAction {

    // Margin left and right action
    private static let kMargin : CGFloat = 15
    
    // FontSize iOS 8 or later
    private static let kFontSizeiOS8OrLater : CGFloat = 18
    
    // FontSize iOS 8 or later
    private static let kFontSizeUnderImage : CGFloat = 14
    
    open class func rowAction(style: UITableViewRowActionStyle,
                    title: String,
               titleColor: UIColor,
                    image: UIImage,
          backgroundColor: UIColor,
                    frame: CGSize,
                     font: UIFont?,
                  handler: @escaping ((UITableViewRowAction, IndexPath) -> Swift.Void)
    ) -> JATableViewRowAction {
        
        var titleMaximumLineLength = 0
        
        title.enumerateLines(invoking: { (line, stop) in
            titleMaximumLineLength = max(titleMaximumLineLength, line.characters.count)
        })
        
        let titleMultiplier = 0.4
        
        var stringToLength = 0
        
        var stringSizeWidth : CGFloat = 0
        
        if frame.width == 0 {
            stringToLength = Int(Double(titleMaximumLineLength) * titleMultiplier)
        } else {
            stringSizeWidth = NSString(string: "\u{3000}").size(attributes: [
                NSFontAttributeName: UIFont.systemFont(ofSize: kFontSizeiOS8OrLater)
                ]).width
            
            stringToLength = Int(ceil(frame.width / stringSizeWidth))
        }
        
        let titleSpaceString = NSString(string: "".padding(toLength: stringToLength, withPad: "\u{3000}", startingAt: 0))

        // Margin Between Text and Image
        let marginVerticalBetweenTextAndImage : CGFloat = frame.height >= 64 ? 3 : 2
        
        let rowAction = JATableViewRowAction(style: style, title: String(titleSpaceString), handler: handler)
        
        var contentWidth : CGFloat = 0
        
        // Verify frame width is set or get width from text
        if frame.width == 0 {
            contentWidth = titleSpaceString.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: frame.height), options: .usesLineFragmentOrigin, attributes: [
                NSFontAttributeName: UIFont.systemFont(ofSize: kFontSizeiOS8OrLater)
                ], context: nil).size.width
        } else {
            // Update frame width to center image
            contentWidth = stringSizeWidth * CGFloat(stringToLength)
        }
        
        let frameGuess = CGSize(width: (kMargin * 2) + contentWidth, height: frame.height)
        
        let tripleFrame = CGSize(width: frameGuess.width * 3, height: frameGuess.height * 3)
    
        UIGraphicsBeginImageContextWithOptions(tripleFrame, true, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return JATableViewRowAction(style: style, title: title, handler: handler)
        }
        
        backgroundColor.set()

        context.fill(CGRect(x: 0, y: 0, width: tripleFrame.width, height: tripleFrame.height));
        
        let nstitle = NSString(string: title)
        let drawnTextSize = nstitle.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: frame.height), options: .usesLineFragmentOrigin, attributes: [
            NSFontAttributeName: (font == nil) ? UIFont.systemFont(ofSize: kFontSizeUnderImage) : font!
            ], context: nil).size
        
        var imageInsetVertical = image.size.height / 2;
        
        if (title.trimmingCharacters(in: NSCharacterSet.whitespaces)).characters.count > 0 {
            imageInsetVertical = (image.size.height + marginVerticalBetweenTextAndImage + drawnTextSize.height) / 2
        }
        
        image.draw(at: CGPoint(x: (frameGuess.width / 2) - (image.size.width / 2), y: (frameGuess.height / 2) - imageInsetVertical))
        
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        
        nstitle.draw(in: CGRect(
            x: 0, y: (frameGuess.height / 2) - imageInsetVertical + image.size.height + marginVerticalBetweenTextAndImage, width: frameGuess.width, height: frameGuess.height), withAttributes: [
                NSFontAttributeName: (font == nil) ? UIFont.systemFont(ofSize: kFontSizeUnderImage) : font!,
                NSForegroundColorAttributeName: titleColor,
                NSParagraphStyleAttributeName: textStyle
            ])
        
        rowAction.backgroundColor = UIColor(patternImage: UIGraphicsGetImageFromCurrentImageContext()!)
        
        UIGraphicsEndImageContext()
        
        return rowAction
    }
    
}
