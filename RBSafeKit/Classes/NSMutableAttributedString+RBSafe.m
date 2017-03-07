//
//  NSMutableAttributedString+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSMutableAttributedString+RBSafe.h"
#import "RBSafeKit.h"
@implementation NSMutableAttributedString (RBSafe)
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class NSConcreteMutableAttributedString = NSClassFromString(@"NSConcreteMutableAttributedString");
        
        //initWithString:
        [RBSafeKit exchangeInstanceMethod:NSConcreteMutableAttributedString methodOriginSel:@selector(initWithString:) methodAddSel:@selector(RBSafe_initWithString:)];
        
        //initWithString:attributes:
        [RBSafeKit exchangeInstanceMethod:NSConcreteMutableAttributedString methodOriginSel:@selector(initWithString:attributes:) methodAddSel:@selector(RBSafe_initWithString:attributes:)];
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
