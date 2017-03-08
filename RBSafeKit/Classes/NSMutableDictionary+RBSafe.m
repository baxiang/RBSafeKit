//
//  NSMutableDictionary+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSMutableDictionary+RBSafe.h"
#import "NSObject+RBSafeSwizzle.h"
@implementation NSMutableDictionary (RBSafe)

+(void)load  {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        //setObject:forKey:
       [NSMutableDictionary swizzleInstance:dictionaryM origMethod:@selector(setObject:forKey:) withMethod:@selector(RBSafe_setObject:forKey:)];
    
        //removeObjectForKey:
        [NSMutableDictionary swizzleInstance:dictionaryM origMethod:@selector(removeObjectForKey:) withMethod:@selector(RBSafe_removeObjectForKey:)];
    });
}



#pragma mark - setObject:forKey:

- (void)RBSafe_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    @try {
        [self RBSafe_setObject:anObject forKey:aKey];
    }
    @catch (NSException *exception) {
       
    }
    @finally {
        
    }
}

#pragma mark - removeObjectForKey:

- (void)RBSafe_removeObjectForKey:(id)aKey {
    
    @try {
        [self RBSafe_removeObjectForKey:aKey];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}


@end
