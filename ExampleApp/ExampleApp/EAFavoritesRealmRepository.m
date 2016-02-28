//
//  EAFavoritesRealmRepository.m
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAFavoritesRealmRepository.h"

@implementation EAFavoritesRealmRepository

#pragma mark - Repository Methods

- (void)retriveFavoritesWithCompletionBlock:(FavoritesRepositoryRetrieveCompletionBlock)block {
    RLMResults<Film *>*result = [Film allObjects];
    NSMutableArray *favorites = [NSMutableArray array];
    for (Film *film in result) {
        [favorites addObject:film];
    }
    block(favorites, YES);
}

- (void)includeFavorite:(Film *)film withCompletionBlock:(FavoritesRepositoryAddCompletionBlock)block {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:film];
    [realm commitWriteTransaction];
    block(YES);
}

- (void)removeFavorite:(Film *)film withCompletionBlock:(FavoritesRepositoryRemoveCompletionBlock)block {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:film];
    [realm commitWriteTransaction];
    block(YES);
}

- (void)retrieveFavoriteById:(NSString *)filmId withCompletionBlock:(FavoritesRepositoryRetrieveByIdCompletionBlock)block {
    Film *favorite = [Film objectInRealm:[RLMRealm defaultRealm] forPrimaryKey:filmId];
    block(favorite);
}

@end
