//
//  NFIMemoryStorage.m
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIMemoryMapRepository.h"

@interface NFIMemoryMapRepository ()

@property (nonatomic, strong) NSMutableDictionary *objectsMap;

@end

@implementation NFIMemoryMapRepository

#pragma mark - Util Methods

- (NSMutableDictionary *)getOrCreateDictionaryIfNeed:(Class)class {
    if (![_objectsMap objectForKey:class]) {
        [_objectsMap setObject:[NSMutableDictionary dictionary] forKey:NSStringFromClass(class)];
    }
    return [_objectsMap objectForKey:class];
}

#pragma mark - Repository Methods

- (NSArray *)retrieveObjectsFor:(Class)class {
    return [self getOrCreateDictionaryIfNeed:class].allValues;
}

- (NFIBaseModel *)retrieveObjectsByIdentifier:(NSString *)objectId forClass:(Class)class {
    NSDictionary *objectsForClass = [self getOrCreateDictionaryIfNeed:class];
    return [objectsForClass objectForKey:objectId];
}

- (void)storeObject:(NFIBaseModel *)object {
    NSDictionary *objectsForClass = [self getOrCreateDictionaryIfNeed:object.class];
    [objectsForClass setValue:object forKey:[object uniqueIdentifier]];
}

- (void)storeObjects:(NSArray *)objects {
    for (NFIBaseModel *object in objects) {
        [self storeObject:object];
    }
}

@end
