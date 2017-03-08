//
//  NSMutableArray+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSMutableArray+RBSafe.h"
#import "NSObject+RBSafeSwizzle.h"
@implementation NSMutableArray (RBSafe)

+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        //objectAtIndex:
        [NSMutableArray swizzleInstance:arrayMClass origMethod:@selector(objectAtIndex:) withMethod:@selector(RBSafe_objectAtIndex:)];
        
        //setObject:atIndexedSubscript:
        [NSMutableArray swizzleInstance:arrayMClass origMethod:@selector(setObject:atIndexedSubscript:) withMethod:@selector(RBSafe_setObject:atIndexedSubscript:)];
        
        //removeObjectAtIndex:
        [NSMutableArray swizzleInstance:arrayMClass origMethod:@selector(removeObjectAtIndex:) withMethod:@selector(RBSafe_removeObjectAtIndex:)];
        
        //insertObject:atIndex:
        [NSMutableArray swizzleInstance:arrayMClass origMethod:@selector(insertObject:atIndex:) withMethod:@selector(RBSafe_insertObject:atIndex:)];
        
        //replaceObjectAtIndex:withObject:
        [NSMutableArray swizzleInstance:arrayMClass origMethod:@selector(replaceObjectAtIndex:withObject:) withMethod:@selector(RBSafe_replaceObjectAtIndex:withObject:)];
        
        //removeObjectsInRange:
        [NSMutableArray swizzleInstance:arrayMClass origMethod:@selector(removeObjectsInRange:) withMethod:@selector(RBSafe_removeObjectsInRange:)];
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


#pragma mark - insertObject:atIndex:
- (void)RBSafe_insertObject:(id)anObject atIndex:(NSUInteger)index {
    @try {
        [self RBSafe_insertObject:anObject atIndex:index];
    }
    @catch (NSException *exception) {
       
    }
    @finally {
        
    }
}
#pragma mark - replaceObjectAtIndex:withObject:
- (void)RBSafe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    @try {
        [self RBSafe_replaceObjectAtIndex:index withObject:anObject];
    }
    @catch (NSException *exception) {
      
    }
    @finally {
        
    }

}
#pragma mark - removeObjectsInRange:
- (void)RBSafe_removeObjectsInRange:(NSRange)range{
    @try {
        [self RBSafe_removeObjectsInRange:range];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }

}

@end
