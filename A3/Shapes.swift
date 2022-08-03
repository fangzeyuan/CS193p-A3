
//
//  Shapes.swift
//  drawshapes
//
//  Created by 房泽远 on 2022/7/31.
//

import Foundation
import CoreGraphics
import SwiftUI



let shape = RoundedRectangle(cornerRadius: 10)
struct Diamond :Shape{
    

    func path(in rect: CGRect) -> Path {
        let center  = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width,rect.height)/2
        var p = Path()
        
        let point1 = CGPoint(
            x: center.x,
            y: center.y - radius/2
        )
        let point2 = CGPoint(
            
            x: center.x - radius,
            y: center.y
        )
        let point3 = CGPoint(
            
            x: center.x,
            y: center.y + radius/2
        )
        let point4 = CGPoint(
            
            x: center.x + radius,
            y: center.y
        )
        p.move(to: point1)
        p.addLine(to: point2)
        p.addLine(to: point3)
        p.addLine(to: point4)
        p.addLine(to: point1)
        return p
    }
}


struct SquiggleShape: Shape {
   

    func path(in rect: CGRect) -> Path {
        var path = Path()
                
        path.move(to: CGPoint(x: 104.0, y: 15.0))
        path.addCurve(to: CGPoint(x: 63.0, y: 54.0),
                      control1: CGPoint(x: 112.4, y: 36.9),
                      control2: CGPoint(x: 89.7, y: 60.8))
        path.addCurve(to: CGPoint(x: 27.0, y: 53.0),
                      control1: CGPoint(x: 52.3, y: 51.3),
                      control2: CGPoint(x: 42.2, y: 42.0))
        path.addCurve(to: CGPoint(x: 5.0, y: 40.0),
                      control1: CGPoint(x: 9.6, y: 65.6),
                      control2: CGPoint(x: 5.4, y: 58.3))
        path.addCurve(to: CGPoint(x: 36.0, y: 12.0),
                      control1: CGPoint(x: 4.6, y: 22.0),
                      control2: CGPoint(x: 19.1, y: 9.7))
        path.addCurve(to: CGPoint(x: 89.0, y: 14.0),
                      control1: CGPoint(x: 59.2, y: 15.2),
                      control2: CGPoint(x: 61.9, y: 31.5))
        path.addCurve(to: CGPoint(x: 104.0, y: 15.0),
                      control1: CGPoint(x: 95.3, y: 10.0),
                      control2: CGPoint(x: 100.9, y: 6.9))
        
        let pathRect = path.boundingRect
        path = path.offsetBy(dx: rect.minX - pathRect.minX, dy: rect.minY - pathRect.minY)
        
        let scale: CGFloat = rect.width / pathRect.width
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        path = path.applying(transform)
        
        
        return path
            .offsetBy(dx: rect.minX - path.boundingRect.minX, dy: rect.midY - path.boundingRect.midY)
    }
}


struct Oval: Shape{

    func path(in rect: CGRect) -> Path {
            let center  = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width,rect.height)/4
            var p = Path()
            
        //          let point1 = CGPoint(
        //        x: center.x,
         //       y: center.y - radius
       //     )
            let point2 = CGPoint(
                
                x: center.x - radius,
                y: center.y - radius
            )
     //       let point3 = CGPoint(
                
     //           x: center.x - radius,
    //            y: center.y + radius
    //        )
            let point4 = CGPoint(
                
                x: center.x + radius,
                y: center.y + radius
            )
     //       let point5 = CGPoint(
    //            x: center.x + radius,
     //           y: center.y - radius
       //     )
            
            let center1 = CGPoint(
                x: center.x - radius,
                y: center.y
            )
            let center2 = CGPoint(
            x: center.x + radius,
            y: center.y
            )
        
     //       p.move(to: point1)
     //       p.addLine(to: point2)
        p.move(to: point2)
            p.addArc(center: center1, radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 90), clockwise: true)
            //p.move(to: point3)
            p.addLine(to: point4)
            p.move(to: point4)
            p.addArc(center: center2, radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 270), clockwise: true)
    //        p.move(to: point5 )
            p.addLine(to: point2)
        
            return p
        }
}
    
    

extension Shape{
    func stroke(color: String) ->some View{
        if(color=="purple"){
            return self.stroke(.purple,lineWidth: 3)
        }
        else if(color=="red"){
            return self.stroke(.red,lineWidth: 3)
        }
        else if(color=="green"){
            return self.stroke(.green,lineWidth: 3)
        }
        else{
            return self.stroke(.white)
        }
    }
    

}

//extension View{
//    func background(tpye: String, color: String){
//        if(type =="solid"){
            
            //if(color=="purple"){
              //      return self.stroke(.purple,lineWidth: 3)
                //}
               // else if(color=="red"){
                 //   return self.stroke(.red,lineWidth: 3)
                //}
               // else if(color=="green"){
                 //   return self.stroke(.green,lineWidth: 3)
               // }
                //else{
                 //   return self.stroke(.white)
               // }
       // }
   // }
// }
