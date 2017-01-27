//
//  ConstraintKit.swift
//
//
//  Created by Jack O'Donnell on 1/26/17.
//
//

import UIKit

extension UIView {
    
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
    
    ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=///
    
    //Constrains attribute equal to superview
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute
        ) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        var constraint = NSLayoutConstraint()
        if let superview = superview {
            switch type {
            case .width:
                constraint = widthAnchor.constraint(equalTo: superview.widthAnchor)
            case .height:
                constraint = heightAnchor.constraint(equalTo: superview.heightAnchor)
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
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to superview with constant
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        atConstant value: CGFloat
        ) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        var constraint = NSLayoutConstraint()
        if let superview = superview {
            switch type {
            case .width:
                constraint = widthAnchor.constraint(equalToConstant: value)
            case .height:
                constraint = heightAnchor.constraint(equalToConstant: value)
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
            case .centerX:
                constraint = centerXAnchor.constraint(
                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                    constant: value
                )
            case .centerY:
                constraint = centerYAnchor.constraint(
                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                    constant: value
                )
            default:break
            }
        }
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to superview with multiplier
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        atMultiplier value: CGFloat
        ) -> NSLayoutConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        var constraint = NSLayoutConstraint()
        if let superview = superview {
            switch type {
            case .width:
                constraint = widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: value)
            case .height:
                constraint = heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: value)
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
        constraint.isActive = true
        return constraint
    }
    
    ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=///
    
    //Constrains attribute equal to view
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        to: UIView
        ) -> NSLayoutConstraint {
        var constraint = NSLayoutConstraint()
        
        switch type {
        case .width:
            constraint = widthAnchor.constraint(equalTo: to.widthAnchor, multiplier: 1)
        case .height:
            constraint = heightAnchor.constraint(equalTo: to.heightAnchor, multiplier: 1)
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
        
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to view with constant
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        to: UIView,
        atConstant value: CGFloat
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        
        switch type {
        case .width:
            constraint = widthAnchor.constraint(
                equalTo: to.widthAnchor,
                constant: value
            )
        case .height:
            constraint = heightAnchor.constraint(
                equalTo: to.heightAnchor,
                constant: value
            )
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
        
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to view with multiplier
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        to: UIView,
        atMultiplier value: CGFloat
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        
        switch type {
        case .width:
            constraint = widthAnchor.constraint(equalTo: to.widthAnchor, multiplier: value)
        case .height:
            constraint = heightAnchor.constraint(equalTo: to.heightAnchor, multiplier: value)
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
        
        constraint.isActive = true
        return constraint
    }
    
    ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=///
    
    //Constrains attribute to superview equal to second attribute
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        _ typeTwo: NSLayoutAttribute
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        if let superview = superview {
            switch type {
            case .width:
                constraint = widthAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutDimension, multiplier: 1)
            case .height:
                constraint = heightAnchor.constraint(equalTo: superview[typeTwo] as! NSLayoutDimension, multiplier: 1)
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
        
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to superview second attribute with constant
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        _ typeTwo: NSLayoutAttribute,
        atConstant value: CGFloat
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        
        if let superview = superview {
            switch type {
            case .width:
                constraint = widthAnchor.constraint(
                    equalTo: superview.widthAnchor,
                    constant: value
                )
            case .height:
                constraint = heightAnchor.constraint(
                    equalTo: superview.heightAnchor,
                    constant: value
                )
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
            case .centerX:
                constraint = centerXAnchor.constraint(
                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutXAxisAnchor>,
                    constant: value
                )
            case .centerY:
                constraint = centerYAnchor.constraint(
                    equalTo: superview[type] as! NSLayoutAnchor<NSLayoutYAxisAnchor>,
                    constant: value
                )
            default:break
            }
        }
        
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to superview second attribute with multiplier
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        _ typeTwo: NSLayoutAttribute,
        atMultiplier value: CGFloat
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        
        if let superview = superview {
            switch type {
            case .width:
                constraint = widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: value)
            case .height:
                constraint = heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: value)
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
        
        constraint.isActive = true
        return constraint
    }
    
    ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=///
    
    //Constrains attribute to view equal to second attribute
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        to: UIView,
        _ typeTwo: NSLayoutAttribute
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        
        switch type {
        case .width:
            constraint = widthAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutDimension, multiplier: 1)
        case .height:
            constraint = heightAnchor.constraint(equalTo: to[typeTwo] as! NSLayoutDimension, multiplier: 1)
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
        
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to view second attribute with constant
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        to: UIView,
        _ typeTwo: NSLayoutAttribute,
        atConstant value: CGFloat
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        
        switch type {
        case .width:
            constraint = widthAnchor.constraint(
                equalTo: to.widthAnchor,
                constant: value
            )
        case .height:
            constraint = heightAnchor.constraint(
                equalTo: to.heightAnchor,
                constant: value
            )
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
        
        constraint.isActive = true
        return constraint
    }
    
    //Constrains attribute to view second attribute with multiplier
    @discardableResult
    func constrain(
        _ type: NSLayoutAttribute,
        to: UIView,
        _ typeTwo: NSLayoutAttribute,
        atMultiplier value: CGFloat
        ) -> NSLayoutConstraint {
        
        var constraint = NSLayoutConstraint()
        
        switch type {
        case .width:
            constraint = widthAnchor.constraint(equalTo: to.widthAnchor, multiplier: value)
        case .height:
            constraint = heightAnchor.constraint(equalTo: to.heightAnchor, multiplier: value)
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
        
        constraint.isActive = true
        return constraint
    }
    
    ///-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=///
    
}
