//
//  EAFavoriteFilmsInteractor.m
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAFavoriteFilmsInteractor.h"

@interface EAFavoriteFilmsInteractor ()

@property (nonatomic, strong) id<EAFavoritesRepository> repository;

@end

@implementation EAFavoriteFilmsInteractor

#pragma mark - Init Methods.

- (instancetype)initWithRepository:(id<EAFavoritesRepository>)repository {
    self = [super init];
    if (self) {
        self.repository = repository;
    }
    return self;
}

#pragma mark - Interactor Input Methods

- (void)findFavoriteFilms {
    [self.repository retriveFavoritesWithCompletionBlock:^(NSArray *films, BOOL success) {
        [self.output foundFavoriteFilms:films];
    }];
}

- (void)checkFilmFavoriteStatus:(Film *)film {
    [self.repository retrieveFavoriteById:[film uniqueIdentifier] withCompletionBlock:^(Film *film) {
        [self.output foundFavoriteFilmStatus:(film != nil)];
    }];
}

- (void)changeFilmFavoriteStatus:(Film *)favoriteFilm {
    [self.repository retrieveFavoriteById:[favoriteFilm uniqueIdentifier] withCompletionBlock:^(Film *film) {
        if (film) {
            [self.repository removeFavorite:film withCompletionBlock:^(BOOL success) {
                [self.output filmRemovedFromFavorites:film withSucess:success];
            }];
        } else {
            [self.repository includeFavorite:favoriteFilm withCompletionBlock:^(BOOL success) {
                [self.output filmAddedToFavorites:favoriteFilm withSuccess:success];
            }];
        }
    }];
}

@end
