//
//  NSAttributedString+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSAttributedString+RBSafe.h"
#import "RBSafeKit.h"
@implementation NSAttributedString (RBSafe)
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        
        
        
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        //initWithString:
        [RBSafeKit exchangeInstanceMethod:NSConcreteAttributedString methodOriginSel:@selector(initWithString:) methodAddSel:@selector(RBSafe_initWithString:)];
        
        //initWithAttributedString
        [RBSafeKit exchangeInstanceMethod:NSConcreteAttributedString methodOriginSel:@selector(initWithAttributedString:) methodAddSel:@selector(RBSafe_initWithAttributedString:)];
        
        //initWithString:attributes:
        [RBSafeKit exchangeInstanceMethod:NSConcreteAttributedString methodOriginSel:@selector(initWithString:attributes:) methodAddSel:@selector(RBSafe_initWithString:attributes:)];
    });
    
}

#pragma mark - initWithString:

- (instancetype)RBSafe_initWithString:(NSString *)str {
    id object = nil;
    
    @try {
        object = [self RBSafe_initWithString:str];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}


#pragma mark - initWithAttributedString

- (instancetype)RBSafe_initWithAttributedString:(NSAttributedString *)attrStr {
    id object = nil;
    
    @try {
        object = [self RBSafe_initWithAttributedString:attrStr];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}


#pragma mark - initWithString:attributes:

- (instancetype)RBSafe_initWithString:(NSString *)str attributes:(NSDictionary<NSString *,id> *)attrs {
    id object = nil;
    
    @try {
        object = [self RBSafe_initWithString:str attributes:attrs];
    }
    @catch (NSException *exception) {
    }
    @finally {
        return object;
    }
}

@end
