# ConstraintKit
Makes swift constraints simple

##Usage

Functions
```swift
//Adds constraint to view
func constrain( 
  _ type: NSLayoutAttribute,
  to: UIView?=nil,
  _ typeTwo: NSLayoutAttribute?=nil,
  atConstant constant: CGFloat?=nil,
  atMultiplier multiplier: CGFloat?=nil) {
    ...
}
```
```swift
//Adds constraint to view and returns for later use
func constraint( 
  _ type: NSLayoutAttribute,
  to: UIView?=nil,
  _ typeTwo: NSLayoutAttribute?=nil,
  atConstant constant: CGFloat?=nil,
  atMultiplier multiplier: CGFloat?=nil) {
    ...
    return constraint
}
```

###Sample usage
```swift
let yellow = UIView()
yellow.backgroundColor = .yellow
yellow.add(to: self.view)

yellow.constrain(.width, atMultiplier: 1/2)
yellow.constrain(.height, atMultiplier: 2/4)
yellow.constrain(.centerY, atMultiplier: 1/2)
yellow.constrain(.centerX)

let blue = UIView()
blue.backgroundColor = .blue
blue.add(to: yellow)

blue.constrain(.width, atMultiplier: 2/3)
blue.constrain(.height, atMultiplier: 1/4)
blue.constrain(.left, atConstant: 13)
blue.constrain(.bottom, atConstant: 15)

let red = UIView()
red.backgroundColor = .red
red.add(to: blue)

let foo = red.constraint(.height, atMultiplier: 1/2)
foo.constant = 45
red.constrain(.width, atMultiplier: 1/2)
red.constrain(.centerX, atMultiplier: 1.4)
red.constrain(.centerY)

let green = UIView()
green.backgroundColor = .green
green.add(to: blue)
green.constrain(.height, atMultiplier: 1/3)
green.constrain(.width)
green.constrain(.left, to: red, .right)
green.constrain(.bottom)
```

