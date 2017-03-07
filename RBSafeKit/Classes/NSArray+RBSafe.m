//
//  NSArray+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSArray+RBSafe.h"
#import "RBSafeKit.h"
@implementation NSArray (RBSafe)

+(void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [RBSafeKit exchangeClassMethod:[self class] methodOriginSel:@selector(arrayWithObjects:count:) methodAddSel:@selector(RBSafe_arrayWithObjects:count:)];
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
        
        [RBSafeKit exchangeInstanceMethod:__NSArray methodOriginSel:@selector(objectAtIndexedSubscript:) methodAddSel:@selector(RBSafe_objectAtIndexedSubscript:)];
        
        [RBSafeKit exchangeInstanceMethod:__NSArray methodOriginSel:@selector(objectsAtIndexes:) methodAddSel:@selector(RBSafe_objectsAtIndexes:)];
        
        [RBSafeKit exchangeInstanceMethod:__NSArrayI methodOriginSel:@selector(objectAtIndex:) methodAddSel:@selector(RBSafe_NSArrayIObjectAtIndex:)];
        
        [RBSafeKit exchangeInstanceMethod:__NSSingleObjectArrayI methodOriginSel:@selector(objectAtIndex:) methodAddSel:@selector(RBSafe_NSSingleObjectArrayIObjectAtIndex:)];
        
        [RBSafeKit exchangeInstanceMethod:__NSArray0 methodOriginSel:@selector(objectAtIndex:) methodAddSel:@selector(RBSafe_NSArray0ObjectAtIndex:)];
        
        [RBSafeKit exchangeInstanceMethod:__NSArray methodOriginSel:@selector(getObjects:range:) methodAddSel:@selector(RBSafe_NSArrayGetObjects:range:)];
        
        [RBSafeKit exchangeInstanceMethod:__NSSingleObjectArrayI methodOriginSel:@selector(getObjects:range:) methodAddSel:@selector(RBSafe_NSSingleObjectArrayIGetObjects:range:)];
        
        [RBSafeKit exchangeInstanceMethod:__NSArrayI methodOriginSel:@selector(getObjects:range:) methodAddSel:@selector(RBSafe_NSArrayIGetObjects:range:)];
    });
}


#pragma mark - instance array


+ (instancetype)RBSafe_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self RBSafe_arrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self RBSafe_arrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}



#pragma mark - objectAtIndexedSubscript:

- (id)RBSafe_objectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    @try {
        object = [self RBSafe_objectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        
        
    }
    @finally {
        return object;
    }
}


#pragma mark - objectsAtIndexes:
- (NSArray *)RBSafe_objectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self RBSafe_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        
    } @finally {
        return returnArray;
    }
}



#pragma mark - objectAtIndex:

//__NSArrayI  objectAtIndex:
- (id)RBSafe_NSArrayIObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self RBSafe_NSArrayIObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}



//__NSSingleObjectArrayI objectAtIndex:
- (id)RBSafe_NSSingleObjectArrayIObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self RBSafe_NSSingleObjectArrayIObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}

//__NSArray0 objectAtIndex:
- (id)RBSafe_NSArray0ObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self RBSafe_NSArray0ObjectAtIndex:index];
    }
    @catch (NSException *exception) {
       
    }
    @finally {
        return object;
    }
}


#pragma mark - getObjects:range:

//NSArray getObjects:range:
- (void)RBSafe_NSArrayGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self RBSafe_NSArrayGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        
        
    } @finally {
        
    }
}


//__NSSingleObjectArrayI  getObjects:range:
- (void)RBSafe_NSSingleObjectArrayIGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self RBSafe_NSSingleObjectArrayIGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
       
        
    } @finally {
        
    }
}

//__NSArrayI  getObjects:range:
- (void)RBSafe_NSArrayIGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self RBSafe_NSArrayIGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        
    } @finally {
        
    }
}


@end
