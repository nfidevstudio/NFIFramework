//
//  NFIRepository.h
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFIBaseModel.h"

@protocol NFIRepository <NSObject>

@optional

- (NSArray *)retrieveObjectsFor:(Class)class;
- (NFIBaseModel *)retrieveObjectsByIdentifier:(NSString *)objectId forClass:(Class)class;
- (void)storeObject:(NFIBaseModel *)object;
- (void)storeObjects:(NSArray *)objects;

@end
