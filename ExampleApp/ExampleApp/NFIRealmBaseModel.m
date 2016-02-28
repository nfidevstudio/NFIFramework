//
//  NFIRealmBaseModel.m
//  ExampleApp
//
//  Created by Pedro Lopez on 20/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIRealmBaseModel.h"
#import <objc/runtime.h>

@implementation NFIRealmBaseModel

+ (instancetype)baseModelWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithValue:dictionary];
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

#pragma mark - Utils

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

@end
