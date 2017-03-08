//
//  NSString+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSString+RBSafe.h"
#import "NSObject+RBSafeSwizzle.h"
@implementation NSString (RBSafe)
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [NSString swizzleClass:[self class] origMethod:@selector(stringWithUTF8String:) withMethod:@selector(RBSafe_stringWithUTF8String:)];
        [NSString swizzleClass:[self class] origMethod:@selector(stringWithCString:encoding:) withMethod:@selector(RBSafe_stringWithCString:encoding:)];
        Class placeholderClass = NSClassFromString(@"NSPlaceholderString"); //[NSString alloc]
        //initWithCString:encoding:
        [NSString swizzleInstance:placeholderClass origMethod:@selector(initWithCString:encoding:) withMethod:@selector(RBSafe_initWithCString:encoding:)];
        
        Class stringClass = NSClassFromString(@"__NSCFConstantString");
        
         [NSString swizzleInstance:stringClass origMethod:@selector(stringByAppendingString:) withMethod:@selector(RBSafe_stringByAppendingString:)];
        //characterAtIndex
        [NSString swizzleInstance:stringClass origMethod:@selector(characterAtIndex:) withMethod:@selector(RBSafe_characterAtIndex:)];
        
        //substringFromIndex
        [NSString swizzleInstance:stringClass origMethod:@selector(substringFromIndex:) withMethod:@selector(RBSafe_substringFromIndex:)];
        
        //substringToIndex
        [NSString swizzleInstance:stringClass origMethod:@selector(substringToIndex:) withMethod:@selector(RBSafe_substringToIndex:)];
        
        //substringWithRange:
        [NSString swizzleInstance:stringClass origMethod:@selector(substringWithRange:) withMethod:@selector(RBSafe_substringWithRange:)];
        
        //stringByReplacingOccurrencesOfString:
        [NSString swizzleInstance:stringClass origMethod:@selector(stringByReplacingOccurrencesOfString:withString:) withMethod:@selector(RBSafe_StringByReplacingOccurrencesOfString:withString:)];
        
        //stringByReplacingOccurrencesOfString:withString:options:range:
        [NSString swizzleInstance:stringClass origMethod:@selector(stringByReplacingOccurrencesOfString:withString:options:range:) withMethod:@selector(RBSafe_stringByReplacingOccurrencesOfString:withString:options:range:)];
        
        //stringByReplacingCharactersInRange:withString:
        [NSString swizzleInstance:stringClass origMethod:@selector(stringByReplacingCharactersInRange:withString:) withMethod:@selector(RBSafe_stringByReplacingCharactersInRange:withString:)];
    });
    
}
+ (nullable instancetype)RBSafe_stringWithUTF8String:(const char *)nullTerminatedCString{

    if (NULL != nullTerminatedCString){
        return [self RBSafe_stringWithUTF8String:nullTerminatedCString];
    }
    return nil;
}
+ (nullable instancetype)RBSafe_stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc{
    if (NULL != cString){
        return [self RBSafe_stringWithCString:cString encoding:enc];
    }
    return nil;
}
#pragma mark - initWithCString:encoding:
- (nullable instancetype) RBSafe_initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
    if (NULL != nullTerminatedCString){
        return [self RBSafe_initWithCString:nullTerminatedCString encoding:encoding];
    }
    return nil;
}



- (NSString *)RBSafe_stringByAppendingString:(NSString *)aString{
    NSString *subString = self;
    @try {
        subString = [self RBSafe_stringByAppendingString:aString];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return subString;
    }

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
