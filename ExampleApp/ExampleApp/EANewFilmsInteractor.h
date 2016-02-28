//
//  EANewFilmsInteractor.h
//  ExampleApp
//
//  Created by Pedro Lopez on 14/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes.
#import "EAFilmsRepository.h"
#import "Film.h"

// Interactor Output Interface for Presenters.
@protocol EANewFilmsInteractorOutput <NFIOutputInteractor>

@optional

- (void)foundNewFilms:(NSArray *)films;
- (void)foundFilteredFilms:(NSArray *)filterFilms;
- (void)foundFilmById:(Film *)film;

@end

@interface EANewFilmsInteractor : NSObject

#pragma mark - Interactor Properties

@property (nonatomic, strong) id<EANewFilmsInteractorOutput> output;

#pragma mark - Init Methods

- (instancetype)initWithRepository:(id<EAFilmsRepository>)repository;

#pragma mark - Interactor Input Methods

- (void)findNewFilms;
- (void)findFilmByIdentifier:(NSString *)filmId;
- (void)findFilmsFilterByTitle:(NSString *)title;

@end
