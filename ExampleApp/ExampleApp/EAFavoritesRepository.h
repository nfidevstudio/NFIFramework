//
//  EAFavoritesRepository.h
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes.
#import "Film.h"

#pragma mark - Repositories Response Blocks

typedef void(^FavoritesRepositoryRetrieveCompletionBlock)(NSArray *films, BOOL success);
typedef void(^FavoritesRepositoryAddCompletionBlock)(BOOL success);
typedef void(^FavoritesRepositoryRemoveCompletionBlock)(BOOL success);
typedef void(^FavoritesRepositoryRetrieveByIdCompletionBlock)(Film *film);

@protocol EAFavoritesRepository <NFIRepository>

#pragma mark - Repository Methods

- (void)retriveFavoritesWithCompletionBlock:(FavoritesRepositoryRetrieveCompletionBlock)block;
- (void)includeFavorite:(Film *)film withCompletionBlock:(FavoritesRepositoryAddCompletionBlock)block;
- (void)removeFavorite:(Film *)film withCompletionBlock:(FavoritesRepositoryRemoveCompletionBlock)block;
- (void)retrieveFavoriteById:(NSString *)filmId withCompletionBlock:(FavoritesRepositoryRetrieveByIdCompletionBlock)block;

@end
