//
//  NFIRepositoryManager.h
//  NFIFramework
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFIRepository.h"

@interface NFIRepositoryManager : NSObject

+ (NFIRepositoryManager*)sharedInstance;

#pragma mark - Methods to register / unregister repositories.

- (void)registerRepositoryClass:(Class)repositoryClass forRelatedModel:(NSString *)relatedModelIdentifier;
- (void)unregisterRepositoryClass:(Class)repositoryClass;
- (void)unregisterRepositoryClassForRelatedModelIdentifier:(NSString *)relatedModelIdentifer;

#pragma mark - Methods to handle repositories.

- (id<NFIRepository>)provideRepositoryInstanceForRelatedModel:(NSString *)relatedModelIdentifier;
- (id<NFIRepository>)provideSharedRepositoryInstanceForRelatedModel:(NSString *)relatedModelIdentifier;
    
@end
