//
//  NSSet+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/8.
//
//

#import "NSSet+RBSafe.h"
#import "NSObject+RBSafeSwizzle.h"

@implementation NSSet (RBSafe)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class __NSPlaceholderSet = NSClassFromString(@"__NSPlaceholderSet");
        [NSSet swizzleClass:[self class] origMethod:@selector(setWithObject:) withMethod:@selector(RBSafe_setWithObject:)];
    });
}
+ (instancetype)RBSafe_setWithObject:(id)firstObj{
    if (firstObj) {
        [self RBSafe_setWithObject:firstObj];
    }
    return nil;
}

@end
