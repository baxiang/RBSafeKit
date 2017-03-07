//
//  NSMutableString+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSMutableString+RBSafe.h"
#import "RBSafeKit.h"
@implementation NSMutableString (RBSafe)
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        
        Class placeholderString = NSClassFromString(@"NSPlaceholderMutableString");
        [RBSafeKit exchangeInstanceMethod:placeholderString methodOriginSel:@selector(initWithCString:encoding:) methodAddSel:@selector(hookInitWithCString:encoding:)];
        [RBSafeKit exchangeInstanceMethod:placeholderString methodOriginSel:@selector(initWithString:) methodAddSel:@selector(RBSafe_initWithString:)];
        Class stringClass = NSClassFromString(@"__NSCFString");
        
        //insertString:atIndex:
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(insertString:atIndex:) methodAddSel:@selector(RBSafe_insertString:atIndex:)];
        
        //replaceCharactersInRange
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(replaceCharactersInRange:withString:) methodAddSel:@selector(RBSafe_replaceCharactersInRange:withString:)];
        
        //deleteCharactersInRange
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(deleteCharactersInRange:) methodAddSel:@selector(RBSafe_deleteCharactersInRange:)];
    });
}

- (nullable instancetype)RBSafe_initWithString:(NSString *)aString{
    if (aString){
        return [self RBSafe_initWithString:aString];
    }
    
    return nil;

}
#pragma mark - insertString:atIndex:

- (nullable instancetype) hookInitWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
    if (NULL != nullTerminatedCString){
        return [self hookInitWithCString:nullTerminatedCString encoding:encoding];
    }
    
    return nil;
}


- (void)RBSafe_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    
    @try {
        [self RBSafe_insertString:aString atIndex:loc];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

#pragma mark - replaceCharactersInRange

- (void)RBSafe_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    
    @try {
        [self RBSafe_replaceCharactersInRange:range withString:aString];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}


#pragma mark - deleteCharactersInRange

- (void)RBSafe_deleteCharactersInRange:(NSRange)range {
    
    @try {
        [self RBSafe_deleteCharactersInRange:range];
    }
    @catch (NSException *exception) {
    }
    @finally {
        
    }
}


@end
