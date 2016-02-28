//
//  NFIBaseModel.m
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIBaseModel.h"
#import <objc/runtime.h>

@implementation NFIBaseModel

#pragma mark - Init Methods

+ (instancetype)baseModelWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

#pragma mark - NFIBaseModelMappings

- (NSDictionary *)mappings {
    NSArray *propertyKeys = [self propertyKeys];
    return [NSDictionary dictionaryWithObjects:propertyKeys forKeys:propertyKeys];
}

#pragma mark - NFIBaseModelSerializable

+ (id<NFIBaseModelSerializable>)deserialize:(NSDictionary *)dictionary {
    [NSException raise:NSInternalInconsistencyException
                format:@"%@: Subclasses must override this method", NSStringFromSelector(_cmd)];
    return nil;
}

- (NSDictionary *)serialize {
    [NSException raise:NSInternalInconsistencyException
                format:@"%@: Subclasses must override this method", NSStringFromSelector(_cmd)];
    return nil;
}

#pragma mark - Identifier

- (NSString *)uniqueIdentifier {
    [NSException raise:NSInternalInconsistencyException
                format:@"%@: Subclasses must override this method", NSStringFromSelector(_cmd)];
    return nil;    
}

#pragma mark - Utils Methods

- (NSArray *)propertyKeys {
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyNames = [NSMutableArray array];
    unsigned i;
    for (i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [propertyNames addObject:name];
    }
    free(properties);
    return propertyNames;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues {
    NSMutableDictionary *validMappings = [NSMutableDictionary dictionary];
    [keyedValues enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *objectKey = [self.mappings valueForKeyPath:key];
        if (objectKey) {
            validMappings[objectKey] = obj;
        }
    }];
    [super setValuesForKeysWithDictionary:validMappings];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSAssert(NO, @"Property \"%@\" not found in object of type \"%@\"", key, NSStringFromClass(self.class));
    [super setValue:value forUndefinedKey:key];
}


@end
