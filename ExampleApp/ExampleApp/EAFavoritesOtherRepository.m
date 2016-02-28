//
//  EAFavoritesOtherRepository.m
//  ExampleApp
//
//  Created by Pedro Lopez on 13/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAFavoritesOtherRepository.h"
#import "Film.h"

@implementation EAFavoritesOtherRepository

#pragma mark - Repository Methods

- (void)retriveFavoritesWithCompletionBlock:(FavoritesRepositoryRetrieveCompletionBlock)block {
    // Not implemented yet. Only for demo.
}

- (void)includeFavorite:(Film *)film withCompletionBlock:(FavoritesRepositoryAddCompletionBlock)block {
    // Not implemented yet. Only for demo.
}

- (void)removeFavorite:(Film *)film withCompletionBlock:(FavoritesRepositoryRemoveCompletionBlock)block {
    // Not implemented yet. Only for demo.
}

- (void)retrieveFavoriteById:(NSString *)filmId withCompletionBlock:(FavoritesRepositoryRetrieveByIdCompletionBlock)block {
    // Not implemented yet. Only for demo.

}

@end
