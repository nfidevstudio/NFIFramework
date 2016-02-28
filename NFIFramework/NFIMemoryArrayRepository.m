//
//  NFIMemoryStorage.m
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIMemoryArrayRepository.h"

@interface NFIMemoryArrayRepository ()

@property (nonatomic, strong) NSMutableDictionary *objects;

@end

@implementation NFIMemoryArrayRepository

#pragma mark - Repository Methods

- (NSArray *)retrieveObjectsFor:(Class)class {
    return [self getOrCreateArrayIfNeed:class];
}

- (NFIBaseModel *)retrieveObjectsByIdentifier:(NSString *)objectId forClass:(Class)class {
    NSArray *objectsForClass = [self getOrCreateArrayIfNeed:class];
    for (NFIBaseModel *object in objectsForClass) {
        if ([[object uniqueIdentifier] isEqualToString:objectId]) {
            return object;
        }
    }
    return nil;
}

- (void)storeObject:(NFIBaseModel *)object {
    NSMutableArray *objectsForClass = [self getOrCreateArrayIfNeed:object.class];
    [objectsForClass addObject:object];
}

- (void)storeObjects:(NSArray *)objects {
    if (objects.count > 0) {
        NSObject *object = [objects firstObject];
        NSMutableArray *objectsForClass = [self getOrCreateArrayIfNeed:object.class];
        [objectsForClass addObjectsFromArray:objects];
    }
}

#pragma mark - Util Methods

- (NSMutableArray *)getOrCreateArrayIfNeed:(Class)class {
    if (![_objects objectForKey:class]) {
        [_objects setObject:[NSMutableArray array] forKey:NSStringFromClass(class)];
    }
    return [_objects objectForKey:class];
}

@end
