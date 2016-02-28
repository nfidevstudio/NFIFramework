//
//  NFIBaseModel.h
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NFIFramework/NFIBaseModelSerializable.h>
#import <NFIFramework/NFIBaseModelMappings.h>

@interface NFIBaseModel : NSObject <NFIBaseModelMappings, NFIBaseModelSerializable>

#pragma mark - Init Methods

+ (instancetype)baseModelWithDictionary:(NSDictionary *)dictionary;

#pragma mark - Public Methods

- (NSString *)uniqueIdentifier;

@end
