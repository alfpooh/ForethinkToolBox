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
    @IBInspectable var LineCapStyle: Int = 1

    
    
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
            
            let arcCenter = CGPoint(x: cordiW/2+offsetX, y: cordiH/2+offsetY)
            let radius = ((bounds.width/2) * 0.4) * iconScale
            //create the path
            
            let circlePath : UIBezierPath = UIBezierPath(arcCenter: arcCenter, radius:
                CGFloat(radius), startAngle: 0, endAngle: 8, clockwise: true)
            
            //set the stroke color
            strokeColor.setStroke()
            
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
                x:(cordiW/2 - (minusWidth/2 * iconScale) + 0.5) + offsetX ,
                y:cordiH/2 + 0.5 + offsetY))
            
            //add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:(cordiW/2 + (minusWidth/2 * iconScale) + 0.5) + offsetX,
                y:cordiH/2 + 0.5 + offsetY))
            
            //set the stroke color
            strokeColor.setStroke()
            minusPath.lineCapStyle = .Round
            //draw the stroke
            minusPath.stroke()
        }
        else if self.tag == 3 {
        //PLUS Button
            let mfactor: CGFloat = ((min(cordiW, cordiH)) * (iconScale/2))
            //create the path
            let minusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            minusPath.lineWidth = strokelineWidth
            
            let strokePoneX: CGFloat = cordiW/2 - mfactor 
            let strokePtwoX: CGFloat = cordiW/2 + mfactor
            let strokePoneY: CGFloat = cordiH/2 + 0.5
            //move the initial point of the path
            //to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:strokePoneX+offsetX ,
                y:strokePoneY+offsetY ))
            
            //add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:strokePtwoX+offsetX ,
                y:strokePoneY+offsetY ))
            
            //move the initial point of the path
            //to the start of the vertical stroke
            let plusPath = UIBezierPath()
            plusPath.moveToPoint(CGPoint(x:strokePoneY + offsetX ,y:(strokePoneX-specialF)+offsetY ))
            
            //add a point to the path at the end of the stroke
            plusPath.addLineToPoint(CGPoint(x:strokePoneY + offsetX ,y:(strokePtwoX+specialF)+offsetY ))
            
            //set the stroke color
            strokeColor.setStroke()
            minusPath.lineCapStyle = .Round
            plusPath.lineCapStyle = .Round
            minusPath.lineWidth = strokelineWidth
            plusPath.lineWidth = strokelineWidth
            
            //draw the stroke
            minusPath.stroke()
            plusPath.stroke()
        }
            
        else if self.tag == 4 {
            //MULTIPLY OR JUST X
            
            let mfactor: CGFloat = ((min(cordiW, cordiH)) * (iconScale/4))
            //create the path
            let minusPath = UIBezierPath()
            
            //set the path's line width to the height of the stroke
            minusPath.lineWidth = strokelineWidth
            
            let strokePoneX: CGFloat = cordiW/2 - mfactor
            let strokePtwoX: CGFloat = cordiW/2 + mfactor
            let strokePoneY: CGFloat = cordiH/2 + 0.5
            //move the initial point of the path
            //to the start of the horizontal stroke
            minusPath.moveToPoint(CGPoint(
                x:strokePoneX+offsetX ,
                y:(strokePoneX-specialF)+offsetY ))
            
            //add a point to the path at the end of the stroke
            minusPath.addLineToPoint(CGPoint(
                x:strokePtwoX+offsetX ,
                y:(strokePtwoX+specialF)+offsetY ))
            
            //move the initial point of the path
            //to the start of the vertical stroke
            let plusPath = UIBezierPath()
            plusPath.moveToPoint(CGPoint(x:strokePoneX+offsetX ,y:(strokePtwoX+specialF)+offsetY))
            
            //add a point to the path at the end of the stroke
            plusPath.addLineToPoint(CGPoint(x:strokePtwoX+offsetX ,y:(strokePoneX-specialF)+offsetY))
            
            //set the stroke color
            strokeColor.setStroke()
            minusPath.lineCapStyle = .Round
            plusPath.lineCapStyle = .Round
            minusPath.lineWidth = strokelineWidth
            plusPath.lineWidth = strokelineWidth
            
            //draw the stroke
            minusPath.stroke()
            plusPath.stroke()
            
        } else if self.tag == 5 {
            //MULTIPLY OR JUST X Button
            
            //Drawing Arrow stem
            
            let linePath = UIBezierPath()
            //Arriowtip is
            let arrowtip = CGPoint(x:(cordiW/2)+offsetX, y:(((cordiH*5)*(1/iconScale))/36+offsetY+specialF))
            linePath.moveToPoint(CGPoint(x:cordiW/2+offsetX , y:cordiH/2+offsetY))
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
            
            let boxPath = UIBezierPath()
            boxPath.moveToPoint(CGPoint(x:(((cordiW*5)/12)*iconScale)+offsetX, y:((cordiH*5)/12*iconScale)+offsetY))
            boxPath.addLineToPoint(CGPoint(x:((cordiW/3)*iconScale)+offsetX, y:((cordiH*5)/12*iconScale)+offsetY))
            boxPath.addLineToPoint(CGPoint(x:((cordiW/3)*iconScale)+offsetX, y:((cordiH*3)/4*iconScale)+offsetY))
            boxPath.addLineToPoint(CGPoint(x:((cordiW*2/3)*iconScale)+offsetX, y:((cordiH*3)/4*iconScale)+offsetY))
            boxPath.addLineToPoint(CGPoint(x:((cordiW*2/3)*iconScale)+offsetX, y:((cordiH*5)/12*iconScale)+offsetY))
            boxPath.addLineToPoint(CGPoint(x:(((cordiW*7)/12)*iconScale)+offsetX, y:((cordiH*5)/12*iconScale)+offsetY))
            // lineCapStyle can be .Round .Square .Butt
            boxPath.lineCapStyle = .Round
            boxPath.usesEvenOddFillRule = true
            
            strokeColor.setStroke()
            boxPath.lineWidth = strokelineWidth
        }
    }
}//end
