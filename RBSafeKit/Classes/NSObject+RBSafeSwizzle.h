//
//  NSObject+RBSafeSwizzle.h
//  Pods
//
//  Created by baxiang on 2017/3/8.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (RBSafeSwizzle)
+ (void)swizzleClass:(Class)cls origMethod:(SEL)origSelector withMethod:(SEL)newSelector;
+ (void)swizzleInstance:(Class)cls origMethod:(SEL)origSelector withMethod:(SEL)newSelector;
@end
