//
//  NSMutableSet+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/8.
//
//

#import "NSMutableSet+RBSafe.h"
#import "NSObject+RBSafeSwizzle.h"
@implementation NSMutableSet (RBSafe)
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class setMClass = NSClassFromString(@"__NSSetM");
        //objectAtIndex:
        [NSMutableSet swizzleInstance:setMClass origMethod:@selector(addObject:) withMethod:@selector(RBSafe_addObject:)];
        
    });
    
}
- (void)RBSafe_addObject:(id)object{
    @try {
        [self RBSafe_addObject:object];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }

}
@end
