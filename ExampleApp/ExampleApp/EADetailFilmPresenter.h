//
//  EADetailFilmPresenter.h
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes (UI and Wireframe).
#import "EADetailFilmUI.h"
#import "EADetailFilmWireframe.h"

// Example App classes (Interactors).
#import "EANewFilmsInteractor.h"
#import "EAFavoriteFilmsInteractor.h"

@interface EADetailFilmPresenter : NSObject <NFIPresenter, EANewFilmsInteractorOutput, EAFavoriteFilmsInteractorOutput>

#pragma mark - Public Properties

@property (nonatomic, strong) EANewFilmsInteractor *filmsInteractor;
@property (nonatomic, strong) EAFavoriteFilmsInteractor *favoritesInteractor;

@property (nonatomic, strong) NSString *filmIdentifier;

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EADetailFilmUI> *)ui andWireFrame:(EADetailFilmWireframe *)wireFrame;

#pragma mark - Presenter Input Methods

- (void)userRequestChangeFavoriteStatusForFilm;

@end
