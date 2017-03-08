//
//  NSMutableString+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSMutableString+RBSafe.h"
#import "NSObject+RBSafeSwizzle.h"
@implementation NSMutableString (RBSafe)
+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class placeholderString = NSClassFromString(@"NSPlaceholderMutableString");
        [NSMutableString swizzleInstance:placeholderString origMethod:@selector(initWithCString:encoding:) withMethod:@selector(RBSafe_initWithCString:encoding:)];
        [NSMutableString swizzleInstance:placeholderString origMethod:@selector(initWithString:) withMethod:@selector(RBSafe_initWithString:)];
        
        Class stringClass = NSClassFromString(@"__NSCFString");
        //insertString:atIndex:
        [NSMutableString swizzleInstance:stringClass origMethod:@selector(insertString:atIndex:) withMethod:@selector(RBSafe_insertString:atIndex:)];
        
        //replaceCharactersInRange
        [NSMutableString swizzleInstance:stringClass origMethod:@selector(replaceCharactersInRange:withString:) withMethod:@selector(RBSafe_replaceCharactersInRange:withString:)];
        
        //deleteCharactersInRange
        [NSMutableString swizzleInstance:stringClass origMethod:@selector(deleteCharactersInRange:) withMethod:@selector(RBSafe_deleteCharactersInRange:)];
    });
}
#pragma mark - initWithString:
- (nullable instancetype)RBSafe_initWithString:(NSString *)aString{
    if (aString){
        return [self RBSafe_initWithString:aString];
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

#pragma mark - insertString:atIndex:
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
