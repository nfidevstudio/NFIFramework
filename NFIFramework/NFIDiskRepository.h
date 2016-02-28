//
//  NFIDiskStorage.h
//  ExampleApp
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFIRepository.h"

@protocol NFIDiskRepository <NFIRepository>

- (NSArray *)retrieveObjectsFor:(Class)class;
- (NFIBaseModel *)retrieveObjectsByIdentifier:(NSString *)objectId forClass:(Class)class;
- (void)storeObject:(NFIBaseModel *)object;
- (void)storeObjects:(NSArray *)objects;

@end
