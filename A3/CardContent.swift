//
//  CardContent.swift
//  A3
//
//  Created by 房泽远 on 2022/7/31.
//

import Foundation
import SwiftUI

struct SetContent{
    static let color_set = ["red", "green", "purple"]
    static let number_set = [1,2,3]
    static let shading_set = ["solid", "striped", "open"]
    static let shape_set = ["diamond","squiggle","oval"]
    
    
    
    init(){
        let randomInt1 = Int.random(in: 0..<4)
        let randomInt2 = Int.random(in: 0..<4)
        
        color_list = SetContent.color_set.shuffled()
        number_list = SetContent.number_set.shuffled()
        shape_list = SetContent.shape_set.shuffled()
        shading_list = SetContent.shading_set.shuffled()
    
        switch randomInt1{
        case 0:
            //0 + 4 diffrent
            break
        case 1:
            // 1 + 3 diffrent
            let randomInt3 = Int.random(in: 0..<3)
            switch randomInt2{
                case 0:
                    // same color
                    let tmp = SetContent.color_set[randomInt3]
                    color_list = [tmp,tmp,tmp]
                    
                case 1:
                    // same shape
                    let tmp = SetContent.number_set[randomInt3]
                    number_list = [tmp,tmp,tmp]
                case 2:
                    let tmp = SetContent.shape_set[randomInt3]
                    shape_list = [tmp,tmp,tmp]
                case 3:
                    let tmp = SetContent.shading_set[randomInt3]
                    shading_list =  [tmp,tmp,tmp]
                default:
                break;
                
            }
        case 2:
            // 2 same + 2 differnet
            let randomInt3 = Int.random(in: 0..<4)
            var randomInt4 = Int.random(in: 0..<4)
            while randomInt4 == randomInt3{
                 randomInt4 = Int.random(in: 0..<4)
            }
            let randomInt5 = Int.random(in: 0..<3)
            let randomInt6 = Int.random(in: 0..<3)
        
            switch randomInt3{
            case 0:
                // same color
                let tmp = SetContent.color_set[randomInt5]
                color_list = [tmp,tmp,tmp]
                
            case 1:
                // same shape
                let tmp = SetContent.number_set[randomInt5]
                number_list = [tmp,tmp,tmp]
            case 2:
                let tmp = SetContent.shape_set[randomInt5]
                shape_list = [tmp,tmp,tmp]
            case 3:
                let tmp = SetContent.shading_set[randomInt5]
                shading_list =  [tmp,tmp,tmp]
            default:
            break;
            }
            
            switch randomInt4{
            case 0:
                // same color
                let tmp = SetContent.color_set[randomInt6]
                color_list = [tmp,tmp,tmp]
                
            case 1:
                // same shape
                let tmp = SetContent.number_set[randomInt6]
                number_list = [tmp,tmp,tmp]
            case 2:
                let tmp = SetContent.shape_set[randomInt6]
                shape_list = [tmp,tmp,tmp]
            case 3:
                let tmp = SetContent.shading_set[randomInt6]
                shading_list =  [tmp,tmp,tmp]
            default:
            break;
            }
            
        case 3:
            // 3 same + 1 different
            let randomInt3 = Int.random(in: 0..<4)
            
            let randomInt4 = Int.random(in: 0..<3)
            let randomInt5 = Int.random(in: 0..<3)
            let randomInt6 = Int.random(in: 0..<3)
            let randomInt7 = Int.random(in: 0..<3)
            
            let tmp1 = SetContent.color_set[randomInt4]
            let tmp2 = SetContent.number_set[randomInt5]
            let tmp3 = SetContent.shape_set[randomInt6]
            let tmp4 = SetContent.shading_set[randomInt7]
            
            switch randomInt3{
       
            case 0:
                //diffrent color
                number_list = [tmp2,tmp2,tmp2]
                shape_list = [tmp3, tmp3, tmp3]
                shading_list = [tmp4,tmp4,tmp4]
            case 1:
                color_list = [tmp1,tmp1,tmp1]
                shape_list = [tmp3, tmp3, tmp3]
                shading_list = [tmp4,tmp4,tmp4]
            case 2:
                color_list = [tmp1,tmp1,tmp1]
                number_list = [tmp2,tmp2,tmp2]
                shading_list = [tmp4,tmp4,tmp4]
            case 3:
                color_list = [tmp1,tmp1,tmp1]
                number_list = [tmp2,tmp2,tmp2]
                shape_list = [tmp3, tmp3, tmp3]
            default:
                break
            }
        default:
            break
        }
    }
        var color_list: Array<String>
        var number_list : Array<Int>
        var shape_list: Array<String>
        var shading_list: Array<String>
    
}
    

