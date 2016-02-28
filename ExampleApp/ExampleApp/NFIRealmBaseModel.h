//
//  NFIRealmBaseModel.h
//  ExampleApp
//
//  Created by Pedro Lopez on 20/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

// NFIFramework classes.
#import "NFIFramework.h"

#import <Realm/Realm.h>

@interface NFIRealmBaseModel : RLMObject <NFIBaseModelMappings, NFIBaseModelSerializable>

+ (instancetype)baseModelWithDictionary:(NSDictionary *)dictionary;

- (NSString *)uniqueIdentifier;

@end
