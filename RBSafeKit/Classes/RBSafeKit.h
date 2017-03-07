//
//  RBSafeKit.h
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface RBSafeKit : NSObject

+ (void)exchangeClassMethod:(Class)anClass methodOriginSel:(SEL)methodOriginSel methodAddSel:(SEL)methodAddSel;

+ (void)exchangeInstanceMethod:(Class)anClass methodOriginSel:(SEL)methodOriginSel methodAddSel:(SEL)methodAddSel;
@end
