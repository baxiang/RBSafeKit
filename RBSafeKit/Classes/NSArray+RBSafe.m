//
//  NSArray+RBSafe.m
//  Pods
//
//  Created by baxiang on 2017/3/7.
//
//

#import "NSArray+RBSafe.h"
#import "NSObject+RBSafeSwizzle.h"
@implementation NSArray (RBSafe)

+(void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Class __NSPlaceholderArray = NSClassFromString(@"__NSPlaceholderArray");
        [NSArray swizzleInstance:__NSPlaceholderArray origMethod:@selector(initWithObjects:count:) withMethod:@selector(RBSafe_initWithObjects:count:)];
        
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");//数组有内容obj类型才是__NSArrayI
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");//iOS10 以上，单个内容类型是__NSArraySingleObjectI
        Class __NSArray0 = NSClassFromString(@"__NSArray0");//iOS9 以上，没内容类型是__NSArray0
        
        [NSArray swizzleInstance:__NSArray origMethod:@selector(subarrayWithRange:) withMethod:@selector(RBSafe_subarrayWithRange:)];
        
        [NSArray swizzleInstance:__NSArray origMethod:@selector(objectsAtIndexes:) withMethod:@selector(RBSafe_objectsAtIndexes:)];
   
        [NSArray swizzleInstance:__NSArrayI origMethod:@selector(objectAtIndex:) withMethod:@selector(RBSafe_NSArrayIobjectAtIndex:)];
        
        [NSArray swizzleInstance:__NSSingleObjectArrayI origMethod:@selector(objectAtIndex:) withMethod:@selector(RBSafe_NSSingleObjectArrayIobjectAtIndex:)];
        
        [NSArray swizzleInstance:__NSArray0 origMethod:@selector(objectAtIndex:) withMethod:@selector(RBSafe_NSArray0ObjectAtIndex:)];
        
    });
}


#pragma mark - instance array
- (instancetype)RBSafe_initWithObjects:(const id _Nonnull [_Nullable])objects count:(NSUInteger)cnt{
    id instance = nil;
    
    @try {
        instance = [self RBSafe_initWithObjects:objects count:cnt];
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
        instance = [self RBSafe_initWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }

}


- (id)RBSafe_subarrayWithRange:(NSRange)range{
    id object = nil;
    @try {
        object = [self RBSafe_subarrayWithRange:range];
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
- (id)RBSafe_NSArrayIobjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self RBSafe_NSArrayIobjectAtIndex:index];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return object;
    }
}



//__NSSingleObjectArrayI objectAtIndex:
- (id)RBSafe_NSSingleObjectArrayIobjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self RBSafe_NSSingleObjectArrayIobjectAtIndex:index];
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


@end
