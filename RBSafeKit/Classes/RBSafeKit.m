//
//  RBSafeKit.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "RBSafeKit.h"

@implementation RBSafeKit


+ (void)exchangeClassMethod:(Class)anClass methodOriginSel:(SEL)methodOriginSel methodAddSel:(SEL)methodAddSel{
    Method method1 = class_getClassMethod(anClass, methodOriginSel);
    Method method2 = class_getClassMethod(anClass, methodAddSel);
    method_exchangeImplementations(method1, method2);
}

+ (void)exchangeInstanceMethod:(Class)anClass methodOriginSel:(SEL)methodOriginSel methodAddSel:(SEL)methodAddSel{
    
    Method originalMethod = class_getInstanceMethod(anClass, methodOriginSel);
    Method swizzledMethod = class_getInstanceMethod(anClass, methodAddSel);
    
    BOOL didAddMethod =
    class_addMethod(anClass,
                    methodOriginSel,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(anClass,
                            methodAddSel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
