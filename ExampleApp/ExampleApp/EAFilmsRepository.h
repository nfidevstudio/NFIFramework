//
//  SongRepository.h
//  ExampleApp
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes.
#import "Film.h"

#pragma mark - Repositories Response Blocks

typedef void(^FilmsRepositoryRetrieveCompletionBlock)(NSArray *films, BOOL success);

@protocol EAFilmsRepository <NFIRepository>

#pragma mark - Repository Methods

- (void)retrieveFilmsWithCompletionBlock:(FilmsRepositoryRetrieveCompletionBlock)block;

@end