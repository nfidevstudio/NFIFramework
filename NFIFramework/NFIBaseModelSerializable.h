//
//  NFIBaseModelMappings.h
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_INLINE id NFINilToEmptyString(id obj) {
    return obj ? : @"";
}

NS_INLINE id NFIEmptyStringToNil(id obj) {
    return [obj isEqual:@""] ? nil : obj;
}

@protocol NFIBaseModelSerializable <NSObject>

+ (id<NFIBaseModelSerializable>)deserialize:(NSDictionary *)dictionary;

- (NSDictionary *)serialize;

@end