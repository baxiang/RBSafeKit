//
//  NSString+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSString+RBSafe.h"
#import "RBSafeKit.h"
@implementation NSString (RBSafe)
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class stringClass = NSClassFromString(@"__NSCFConstantString");
        
        //characterAtIndex
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(characterAtIndex:) methodAddSel:@selector(RBSafe_characterAtIndex:)];
        
        //substringFromIndex
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(substringFromIndex:) methodAddSel:@selector(RBSafe_substringFromIndex:)];
        
        //substringToIndex
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(substringToIndex:) methodAddSel:@selector(RBSafe_substringToIndex:)];
        
        //substringWithRange:
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(substringWithRange:) methodAddSel:@selector(RBSafe_substringWithRange:)];
        
        //stringByReplacingOccurrencesOfString:
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(stringByReplacingOccurrencesOfString:withString:) methodAddSel:@selector(RBSafe_StringByReplacingOccurrencesOfString:withString:)];
        
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) methodAddSel:@selector(RBSafe_stringByReplacingOccurrencesOfString:withString:options:range:)];
        
        //stringByReplacingCharactersInRange:withString:
        [RBSafeKit exchangeInstanceMethod:stringClass methodOriginSel:@selector(stringByReplacingCharactersInRange:withString:) methodAddSel:@selector(RBSafe_stringByReplacingCharactersInRange:withString:)];
    });
    
}


#pragma mark - characterAtIndex:

- (unichar)RBSafe_characterAtIndex:(NSUInteger)index {
    
    unichar characteristic;
    @try {
        characteristic = [self RBSafe_characterAtIndex:index];
    }
    @catch (NSException *exception) {
    
    }
    @finally {
        return characteristic;
    }
}


#pragma mark - substringFromIndex:

- (NSString *)RBSafe_substringFromIndex:(NSUInteger)from {
    
    NSString *subString = nil;
    
    @try {
        subString = [self RBSafe_substringFromIndex:from];
    }
    @catch (NSException *exception) {
        
        subString = nil;
    }
    @finally {
        return subString;
    }
}


#pragma mark - substringToIndex

- (NSString *)RBSafe_substringToIndex:(NSUInteger)to {
    
    NSString *subString = nil;
    
    @try {
        subString = [self RBSafe_substringToIndex:to];
    }
    @catch (NSException *exception) {
        subString = nil;
    }
    @finally {
        return subString;
    }
}



#pragma mark - substringWithRange:

- (NSString *)RBSafe_substringWithRange:(NSRange)range {
    
    NSString *subString = nil;
    
    @try {
        subString = [self RBSafe_substringWithRange:range];
    }
    @catch (NSException *exception) {
        
        subString = nil;
    }
    @finally {
        return subString;
    }
}


#pragma mark - stringByReplacingOccurrencesOfString:

- (NSString *)RBSafe_StringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self RBSafe_StringByReplacingOccurrencesOfString:target withString:replacement];
    }
    @catch (NSException *exception) {
        
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}


#pragma mark - stringByReplacingOccurrencesOfString:withString:options:range:

- (NSString *)RBSafe_stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange {
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self RBSafe_stringByReplacingOccurrencesOfString:target withString:replacement options:options range:searchRange];
    }
    @catch (NSException *exception) {
       
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}



#pragma mark - stringByReplacingCharactersInRange:withString:

- (NSString *)RBSafe_stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement {
    
    
    NSString *newStr = nil;
    
    @try {
        newStr = [self RBSafe_stringByReplacingCharactersInRange:range withString:replacement];
    }
    @catch (NSException *exception) {
       
        newStr = nil;
    }
    @finally {
        return newStr;
    }
}

@end
