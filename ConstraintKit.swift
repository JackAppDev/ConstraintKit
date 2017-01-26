//
//  ConstraintKit.swift
//  
//
//  Created by Jack O'Donnell on 1/26/17.
//
//

import UIKit

extension UIView {
    
    enum ConstraintNumberType {
        case percent(Double)
        case constant(CGFloat)
    }
    
    subscript (_ type: NSLayoutAttribute) -> AnyObject {
        get {
            switch type {
            case .top:
                return self.topAnchor
            case .bottom:
                return self.bottomAnchor
            case .left:
                return self.leftAnchor
            case .right:
                return self.rightAnchor
            case .centerX:
                return self.centerXAnchor
            case .centerY:
                return self.centerYAnchor
            default:
                return "" as AnyObject
            }
        }
    }
    
    func add(to: UIView) {
        to.addSubview(self)
    }
    
    func constraint(
        _ type: NSLayoutAttribute,
        to: UIView?=nil,
        _ typeTwo: NSLayoutAttribute?=nil,
        //at value: CGFloat?=nil
        atConstant constant: CGFloat?=nil,
        atMultiplier multiplier: CGFloat?=nil
        ) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraint = NSLayoutConstraint()
        
        switch type {
        case .width, .height:
            if (constant != nil) || (multiplier != nil) {
                if let to = to {
                    if let value = multiplier {
                        switch type {
                        case .width:
                            constraint = widthAnchor.constraint(equalTo: to.widthAnchor, multiplier: value)
                        case .height:
                        constraint = heightAnchor.constraint(equalTo: to.heightAnchor, multiplier: value)
                        default:break
                        }
                    }
                }
                else {
                    if let value = constant {
                        switch type {
                        case .width:
                            constraint = widthAnchor.constraint(equalToConstant: value)
                        case .height:
                            constraint = heightAnchor.constraint(equalToConstant: value)
                        default:break
                        }
                    }
                    else if let value = multiplier {
                        if let superview = superview {
                            switch type {
                            case .width:
                                constraint = widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: value)
                            case .height:
                                constraint = heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: value)
                            default:break
                            }
                        }
                    }
                }
            }
            else {
                if let to = to {
                    switch type {
                    case .width:
                        constraint = widthAnchor.constraint(equalTo: to.widthAnchor)
                    case .height:
                        constraint = heightAnchor.constraint(equalTo: to.heightAnchor)
                    default:break
                    }
                }
                else {
                    if let superview = superview {
                        switch type {
                        case .width:
                            constraint = widthAnchor.constraint(equalTo: superview.widthAnchor)
                        case .height:
                            constraint = heightAnchor.constraint(equalTo: superview.heightAnchor)
                        default:break
                        }
                    }
                    else {
                        print("Autolayout Error")
                    }
                }
            }
        case .top, .bottom, .left, .right, .centerX, .centerY:
            if (constant != nil) || (multiplier != nil) {
                if let to = to {
                    if let typeTwo = typeTwo {
                        if let value = constant {
                            switch type {
                            case .top:
                                constraint = topAnchor.constraint(
                                    equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: value
                                )
                            case .bottom:
                                constraint = bottomAnchor.constraint(
                                    equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: -value
                                )
                            case .left:
                                constraint = leftAnchor.constraint(
                                    equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: value
                                )
                            case .right:
                                constraint = rightAnchor.constraint(
                                    equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: -value
                                )
                            case .centerX:
                                constraint = centerXAnchor.constraint(
                                    equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: value
                                )
                            case .centerY:
                                constraint = centerYAnchor.constraint(
                                    equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: value
                                )
                            default:break
                            }
                        }
                        else if let value = multiplier {
                            switch type {
                            case .centerX:
                                constraint = NSLayoutConstraint(
                                    item: self,
                                    attribute: .centerX,
                                    relatedBy: .equal,
                                    toItem: to,
                                    attribute: typeTwo,
                                    multiplier: value,
                                    constant: 0
                                )
                            case .centerY:
                                constraint = NSLayoutConstraint(
                                    item: self,
                                    attribute: .centerY,
                                    relatedBy: .equal,
                                    toItem: to,
                                    attribute: typeTwo,
                                    multiplier: value,
                                    constant: 0
                                )
                            default:break
                            }
                        }
                    }
                    else {
                        if let value = constant {
                            switch type {
                            case .top:
                                constraint = topAnchor.constraint(
                                    equalTo: to[type] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: value
                                )
                            case .bottom:
                                constraint = bottomAnchor.constraint(
                                    equalTo: to[type] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: -value
                                )
                            case .left:
                                constraint = leftAnchor.constraint(
                                    equalTo: to[type] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: value
                                )
                            case .right:
                                constraint = rightAnchor.constraint(
                                    equalTo: to[type] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: -value
                                )
                            case .centerX:
                                constraint = centerXAnchor.constraint(
                                    equalTo: to[type] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: value
                                )
                            case .centerY:
                                constraint = centerYAnchor.constraint(
                                    equalTo: to[type] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: value
                                )
                            default:break
                            }
                        }
                        else if let value = multiplier {
                            switch type {
                            case .centerX:
                                constraint = NSLayoutConstraint(
                                    item: self,
                                    attribute: .centerX,
                                    relatedBy: .equal,
                                    toItem: to,
                                    attribute: type,
                                    multiplier: value,
                                    constant: 0
                                )
                            case .centerY:
                                constraint = NSLayoutConstraint(
                                    item: self,
                                    attribute: .centerY,
                                    relatedBy: .equal,
                                    toItem: to,
                                    attribute: type,
                                    multiplier: value,
                                    constant: 0
                                )
                            default:break
                            }
                        }
                    }
                }
                else {
                    if let superview = superview {
                        if let value = constant {
                            switch type {
                            case .top:
                                constraint = topAnchor.constraint(
                                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: value
                                )
                            case .bottom:
                                constraint = bottomAnchor.constraint(
                                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                                    constant: -value
                                )
                            case .left:
                                constraint = leftAnchor.constraint(
                                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: value
                                )
                            case .right:
                                constraint = rightAnchor.constraint(
                                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                                    constant: -value
                                )
                            default:break
                            }
                        }
                        else if let value = multiplier {
                            switch type {
                            case .centerX:
                                constraint = NSLayoutConstraint(
                                    item: self,
                                    attribute: .centerX,
                                    relatedBy: .equal,
                                    toItem: superview,
                                    attribute: type,
                                    multiplier: value,
                                    constant: 0
                                )
                            case .centerY:
                                constraint = NSLayoutConstraint(
                                    item: self,
                                    attribute: .centerY,
                                    relatedBy: .equal,
                                    toItem: superview,
                                    attribute: type,
                                    multiplier: value,
                                    constant: 0
                                )
                            default:break
                            }
                        }
                    }
                    else {
                        print("Autolayout Error")
                    }
                }
            }
            else {
                if let to = to {
                    if let typeTwo = typeTwo {
                        switch type {
                        case .top:
                            constraint = topAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>)
                        case .bottom:
                            constraint = bottomAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>)
                        case .left:
                            constraint = leftAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>)
                        case .right:
                            constraint = rightAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>)
                        case .centerX:
                            constraint = centerXAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>)
                        case .centerY:
                            constraint = centerYAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>)
                        default:break
                        }
                    }
                    else {
                        switch type {
                        case .top:
                            constraint = topAnchor.constraint(equalTo: to.topAnchor)
                        case .bottom:
                            constraint = bottomAnchor.constraint(equalTo: to.bottomAnchor)
                        case .left:
                            constraint = leftAnchor.constraint(equalTo: to.leftAnchor)
                        case .right:
                            constraint = rightAnchor.constraint(equalTo: to.rightAnchor)
                        case .centerX:
                            constraint = centerXAnchor.constraint(equalTo: to.centerXAnchor)
                        case .centerY:
                            constraint = centerYAnchor.constraint(equalTo: to.centerYAnchor)
                        default:break
                        }
                    }
                }
                else {
                    if let superview = superview {
                        if let typeTwo = typeTwo {
                            switch type {
                            case .top:
                                constraint = topAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>)
                            case .bottom:
                                constraint = bottomAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>)
                            case .left:
                                constraint = leftAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>)
                            case .right:
                                constraint = rightAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>)
                            case .centerX:
                                constraint = centerXAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutAnchor<NSLayoutXAxisAnchor>)
                            case .centerY:
                                constraint = centerYAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutAnchor<NSLayoutYAxisAnchor>)
                            default:break
                            }
                        }
                        else {
                            switch type {
                            case .top:
                                constraint = topAnchor.constraint(equalTo: superview.topAnchor)
                            case .bottom:
                                constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor)
                            case .left:
                                constraint = leftAnchor.constraint(equalTo: superview.leftAnchor)
                            case .right:
                                constraint = rightAnchor.constraint(equalTo: superview.rightAnchor)
                            case .centerX:
                                constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
                            case .centerY:
                                constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
                            default:break
                            }
                        }
                    }
                    else {
                        print("Autolayout Error")
                    }
                }
            }
        default:break
        }
        constraint.isActive = true
        return constraint
    }
    
    func constrain(
        _ type: NSLayoutAttribute,
        to: UIView?=nil,
        _ typeTwo: NSLayoutAttribute?=nil,
        atConstant constant: CGFloat?=nil,
        atMultiplier multiplier: CGFloat?=nil
        ) {
        
        _ = self.constraint(
            type,
            to: to,
            typeTwo,
            atConstant: constant,
            atMultiplier: multiplier
        )
    }

}

