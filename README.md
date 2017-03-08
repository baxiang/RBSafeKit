# RBSafeKit

[![CI Status](http://img.shields.io/travis/baxiang/RBSafeKit.svg?style=flat)](https://travis-ci.org/baxiang/RBSafeKit)
[![Version](https://img.shields.io/cocoapods/v/RBSafeKit.svg?style=flat)](http://cocoapods.org/pods/RBSafeKit)
[![License](https://img.shields.io/cocoapods/l/RBSafeKit.svg?style=flat)](http://cocoapods.org/pods/RBSafeKit)
[![Platform](https://img.shields.io/cocoapods/p/RBSafeKit.svg?style=flat)](http://cocoapods.org/pods/RBSafeKit)

##   nil NULL 空值处理【NSInvalidArgumentException】
```
1.*** -[__NSPlaceholderArray initWithObjects:count:]: attempt to insert nil object from objects[0]'
2.***  setObjectForKey: object cannot be nil (key: key)
3.*** +[NSString stringWithUTF8String:]: NULL cString
4.*** +[NSString stringWithCString:encoding:]: NULL cString
5.*** -[__NSCFConstantString stringByAppendingString:]: nil argument';
6.*** -[__NSPlaceholderDictionary initWithObjects:forKeys:count:]: attempt to insert nil object from objects[0]'
7.*** - -[__NSDictionaryM removeObjectForKey:]: key cannot be nil'
8.*** -[__NSPlaceholderSet initWithObjects:count:]: attempt to insert nil object from objects[0]'
```
##  越界【NSRangeException】
```
1.*** -[__NSSingleObjectArrayI objectAtIndex:]: index 4 beyond bounds [0 .. 0]
2.***-[NSArray subarrayWithRange:]: range {50, 100} extends beyond bounds [0 .. 2]
3.*** -[__NSArrayM removeObjectsInRange:]: range {50, 10} extends beyond bounds [0 .. 2]
4.*** -[__NSCFConstantString substringFromIndex:]: Index 50 out of bounds; string length 10
```

## Installation

RBSafeKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RBSafeKit"
```
## Version
V1.0.0
字符串(NSString、NSMutableString、NSAttributedString、NSMutableAttributedString)、数组(NSArray、NSMutableArray、NSSet、NSMutableSet)、字典（NSDictionary、NSMutableDictionary） 非法参数和越界的crash保护
## Author

baxiang, baxiang1989@163.com

## License

RBSafeKit is available under the MIT license. See the LICENSE file for more info.
