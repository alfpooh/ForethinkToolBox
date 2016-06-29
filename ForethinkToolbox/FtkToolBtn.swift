//
//  FtkToolBtn.swift
//  ForethinkToolbox
//
//  Created by Dr. Donghoon Alf Bae on 2016. 6. 26..
//  Copyright © 2016년 Forethink. All rights reserved.


import UIKit

@IBDesignable

// Code for making universal button design

class FtkToolBtn: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var strokeColor: UIColor = UIColor.whiteColor()
    @IBInspectable var iconScale: CGFloat = 1.0
    @IBInspectable var strokelineWidth: CGFloat = 1.0
    @IBInspectable var miterlimit: CGFloat = 4
    @IBInspectable var offsetX: CGFloat = 0
    @IBInspectable var offsetY: CGFloat = 0
    @IBInspectable var specialF: CGFloat = 1
    @IBInspectable var LineCapStyle: CGLineCap?

    
    
    override func drawRect(rect: CGRect) {
        
        if iconScale <= 0 {
        iconScale = 0.01
        }
        
        let cordiW = bounds.width
        let cordiH = bounds.height
        
        // Drawing base circle(Gong!)
        let gongPath = UIBezierPath(ovalInRect: rect)
        gongPath.lineWidth = strokelineWidth
        fillColor.setFill()
        gongPath.fill()
        
        
        if self.tag == 1 {
            // RESET button
            
            let arcCenter = CGPoint(x: cordiW/2, y: cordiH/2)
            let radius = ((bounds.width/2) * 0.4) * iconScale
            //create the path
            
            let circlePath : UIBezierPath = UIBezierPath(arcCenter: arcCenter, radius:
                CGFloat(radius), startAngle: 0, endAngle: 8, clockwise: true)
            
            //set the stroke color
            strokeColor.setStroke()
            //set offset
            circlePath.applyTransform(CGAffineTransformMakeTranslation(offsetX, offsetY))
            //draw the stroke
            circlePath.lineWidth = strokelineWidth
            circlePath.stroke()
            
            
        } else if self.tag == 2 {
            //MINUS button
            
            let minusWidth: CGFloat = min(cordiW, cordiH) * 0.7
            
            //create the path
            let minusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            minusPath.lineWidth = strokelineWidth
            
            //move the initial point of the path
            //to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:(cordiW/2 - (minusWidth/2 * iconScale) + 0.5),
                y:cordiH/2 + 0.5))
            
            //add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2 * iconScale) + 0.5),
                y:cordiH/2 + 0.5))
            //offsetting
            minusPath.applyTransform(CGAffineTransformMakeTranslation(offsetX, offsetY))
            //set the stroke color
            strokeColor.setStroke()
            //.lineCapStyle .Butt .Round .Square
            minusPath.lineCapStyle = .Round
            //draw the stroke
            minusPath.stroke()
        }
        else if self.tag == 3 {
        //PLUS Button
            let mfactor: CGFloat = (min(cordiW, cordiH))
            //create the path
            let plusPath = UIBezierPath()
            let cordiWscaled = cordiW * iconScale
            let cordiHscaled = cordiH * iconScale
            //set the path's line width to the height of the stroke
            plusPath.lineWidth = strokelineWidth
            
            let strokePoneX: CGFloat = (cordiWscaled/2)-mfactor
            let strokePtwoX: CGFloat = (cordiWscaled/2)+mfactor
            let strokePoneY: CGFloat = (cordiHscaled/2)+0.5
            //move the initial point of the path
            //to the start of the horizontal stroke
            plusPath.moveToPoint(CGPoint(
                x:strokePoneX,
                y:strokePoneY))
            
            //add a point to the path at the end of the stroke
            plusPath.addLineToPoint(CGPoint(
                x:strokePtwoX,
                y:strokePoneY))
            
            //move the initial point of the path
            //to the start of the vertical stroke
            plusPath.moveToPoint(CGPoint(x:strokePoneY,y:(strokePoneX-specialF)))
            
            //add a point to the path at the end of the stroke
            plusPath.addLineToPoint(CGPoint(x:strokePoneY,y:(strokePtwoX+specialF)))
            
            // set to center and offset
            plusPath.applyTransform(CGAffineTransformMakeTranslation((cordiW*(1-iconScale))/2, (cordiH*(1-iconScale))/2))
            plusPath.applyTransform(CGAffineTransformMakeTranslation(offsetX, offsetY))
            
            //set the stroke color
            strokeColor.setStroke()
            plusPath.lineCapStyle = .Round
            plusPath.lineWidth = strokelineWidth
            
            //draw the stroke
            plusPath.stroke()
        }
            
        else if self.tag == 4 {
            //MULTIPLY OR JUST X
            
            let mfactor: CGFloat = (min(cordiW, cordiH))
            //create the path
            let xPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            xPath.lineWidth = strokelineWidth
            
            let strokePoneX: CGFloat = cordiW/2 - mfactor
            let strokePtwoX: CGFloat = cordiW/2 + mfactor
            let strokePoneY: CGFloat = cordiH/2 + 0.5
            //move the initial point of the path
            //to the start of the horizontal stroke
            xPath.moveToPoint(CGPoint(
                x:strokePoneX,
                y:(strokePoneX-specialF)))
            
            //add a point to the path at the end of the stroke
            xPath.addLineToPoint(CGPoint(
                x:strokePtwoX,
                y:(strokePtwoX+specialF)))
            
            //move the initial point of the path
            //to the start of the vertical stroke

            xPath.moveToPoint(CGPoint(x:strokePoneX,y:(strokePtwoX+specialF)))
            
            //add a point to the path at the end of the stroke
            xPath.addLineToPoint(CGPoint(x:strokePtwoX,y:(strokePoneX-specialF)))
            
            //path align to center and apply offset
            xPath.applyTransform(CGAffineTransformMakeTranslation((cordiW*(1-iconScale))/2, (cordiH*(1-iconScale))/2))
            xPath.applyTransform(CGAffineTransformMakeTranslation(offsetX, offsetY))

            //set the stroke color
            strokeColor.setStroke()
            xPath.lineCapStyle = .Round
            xPath.lineWidth = strokelineWidth
            
            //draw the stroke
            xPath.stroke()
            
        } else if self.tag == 5 {
            //MULTIPLY OR JUST X Button
            
            //Drawing Arrow stem
            
            let linePath = UIBezierPath()
            let iconCenterW = cordiW+offsetX
            let iconCenterH = cordiH+offsetY
            
            //Arriowtip is
            let arrowtip = CGPoint(x:(cordiW/2)+offsetX, y:(((cordiH*5)*(1/iconScale))/36+offsetY+specialF))
            linePath.moveToPoint(CGPoint(x:(cordiW/2)+offsetX , y:(cordiH/2)+offsetY))
            linePath.addLineToPoint(arrowtip)
            
            //Drawing Arrow head
            linePath.moveToPoint(CGPoint(x:(cordiW*5)/12+offsetX, y:(cordiH*11)/36+offsetY))
            
            linePath.addLineToPoint(arrowtip)
            linePath.addLineToPoint(CGPoint(x:((cordiW*7)/12)+offsetX, y:(cordiH*11)/36+offsetY))
            
            linePath.closePath()
            
            //What is miterLinit? tavmjong.free.fr/SVG/MITER_LIMIT/index.html
            linePath.miterLimit = miterlimit;
            // lineCapStyle can be .Round .Square .Butt
            linePath.lineCapStyle = .Round
            linePath.usesEvenOddFillRule = true
            // fill arrow head
            strokeColor.setFill()
            linePath.fill()
            strokeColor.setStroke()
            linePath.lineWidth = strokelineWidth
            linePath.stroke()
            
            //Drawing box
            
            var boxPath = UIBezierPath()
            boxPath.moveToPoint(CGPoint(x:((iconCenterW*5)/12), y:((iconCenterH*5)/12)))
            boxPath.addLineToPoint(CGPoint(x:((iconCenterW/3)), y:((iconCenterH*5)/12)))
            boxPath.addLineToPoint(CGPoint(x:((iconCenterW/3)), y:((iconCenterH*3)/4)))
            boxPath.addLineToPoint(CGPoint(x:((iconCenterW*2/3)), y:((iconCenterH*3)/4)))
            boxPath.addLineToPoint(CGPoint(x:((iconCenterW*2/3)), y:((iconCenterH*5)/12)))
            boxPath.addLineToPoint(CGPoint(x:(((iconCenterW*7)/12)), y:((iconCenterH*5)/12)))
            // lineCapStyle can be .Round .Square .Butt
            boxPath.lineCapStyle = .Round
            boxPath.usesEvenOddFillRule = true
            // transform
            boxPath.applyTransform(CGAffineTransformMakeScale(iconScale,iconScale))
            boxPath.applyTransform(CGAffineTransformMakeTranslation((cordiW*(1-iconScale))/2, (cordiH*(1-iconScale))/2))
            boxPath.applyTransform(CGAffineTransformMakeTranslation(offsetX, offsetY))
            
            strokeColor.setStroke()
            boxPath.lineWidth = strokelineWidth
            boxPath.stroke()
            
            
        } else if self.tag == 6 {
            // \\\ 3 lines aka Hamburger
            if specialF == 0 {specialF = 10} //default
            //Drawing Arrow stem
            
            let minusWidth: CGFloat = min(cordiW, cordiH) * 0.7
            
            //create the path
            let minusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            minusPath.lineWidth = strokelineWidth
            
            //move the initial point of the path
            //Centr line: to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:(cordiW/2 - (minusWidth/2 * iconScale) + 0.5) + offsetX ,
                y:cordiH/2 + 0.5 + offsetY))
            
            //Centr line:  add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2 * iconScale) + 0.5) + offsetX,
                y:cordiH/2 + 0.5 + offsetY))
            
            //Centr line: to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:(cordiW/2 - (minusWidth/2 * iconScale) + 0.5) + offsetX ,
                y:cordiH/2 + specialF  + offsetY))
            
            //Centr line:  add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2 * iconScale) + 0.5) + offsetX,
                y:cordiH/2 + specialF  + offsetY))

            
            //Centr line: to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:(cordiW/2 - (minusWidth/2 * iconScale) + 0.5) + offsetX ,
                y:cordiH/2 - specialF  + offsetY))
            
            //Centr line:  add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2 * iconScale) + 0.5) + offsetX,
                y:cordiH/2 - specialF  + offsetY))

            
            //set the stroke color
            strokeColor.setStroke()
            minusPath.lineCapStyle = .Round
            //draw the stroke
            minusPath.stroke()
        }

    }
}//end
