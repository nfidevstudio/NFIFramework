//
//  EAFavoriteFilmsInteractor.h
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes.
#import "EAFavoritesRepository.h"
#import "Film.h"

// Interactor Output Interface for Presenters.
@protocol EAFavoriteFilmsInteractorOutput <NFIOutputInteractor>

@optional

- (void)foundFavoriteFilms:(NSArray *)films;
- (void)filmAddedToFavorites:(Film *)film withSuccess:(BOOL)success;
- (void)filmRemovedFromFavorites:(Film *)film withSucess:(BOOL)success;
- (void)foundFavoriteFilmStatus:(BOOL)isFavorite;

@end

@interface EAFavoriteFilmsInteractor : NSObject

#pragma mark - Interactor Properties

@property (nonatomic, strong) id<EAFavoriteFilmsInteractorOutput> output;

#pragma mark - Init Methods

- (instancetype)initWithRepository:(id<EAFavoritesRepository>)repository;

#pragma mark - Interactor Input Methods

- (void)changeFilmFavoriteStatus:(Film *)favoriteFilm;
- (void)findFavoriteFilms;
- (void)checkFilmFavoriteStatus:(Film *)film;

@end
