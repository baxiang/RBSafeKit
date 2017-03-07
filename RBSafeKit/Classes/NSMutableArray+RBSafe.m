//
//  NSMutableArray+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSMutableArray+RBSafe.h"
#import "RBSafeKit.h"
@implementation NSMutableArray (RBSafe)

+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        //objectAtIndex:
        [RBSafeKit exchangeInstanceMethod:arrayMClass methodOriginSel:@selector(objectAtIndex:) methodAddSel:@selector(RBSafe_objectAtIndex:)];
        
        //setObject:atIndexedSubscript:
        [RBSafeKit exchangeInstanceMethod:arrayMClass methodOriginSel:@selector(setObject:atIndexedSubscript:) methodAddSel:@selector(RBSafe_setObject:atIndexedSubscript:)];
        
        
        //removeObjectAtIndex:
        [RBSafeKit exchangeInstanceMethod:arrayMClass methodOriginSel:@selector(removeObjectAtIndex:) methodAddSel:@selector(RBSafe_removeObjectAtIndex:)];
        
        //insertObject:atIndex:
        [RBSafeKit exchangeInstanceMethod:arrayMClass methodOriginSel:@selector(insertObject:atIndex:) methodAddSel:@selector(RBSafe_insertObject:atIndex:)];
        
        //getObjects:range:
        [RBSafeKit exchangeInstanceMethod:arrayMClass methodOriginSel:@selector(getObjects:range:) methodAddSel:@selector(RBSafe_getObjects:range:)];
    });
    
}

#pragma mark - objectAtIndex:

- (id)RBSafe_objectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self RBSafe_objectAtIndex:index];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}

#pragma mark - get object from array

- (void)RBSafe_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    
    @try {
        [self RBSafe_setObject:obj atIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}


#pragma mark - removeObjectAtIndex:

- (void)RBSafe_removeObjectAtIndex:(NSUInteger)index {
    @try {
        [self RBSafe_removeObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}


#pragma mark - set方法
- (void)RBSafe_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self RBSafe_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
       
    }
    @finally {
        
    }
}


#pragma mark - getObjects:range:

- (void)RBSafe_getObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    @try {
        [self RBSafe_getObjects:objects range:range];
    } @catch (NSException *exception) {
    } @finally {
        
    }
}

@end
