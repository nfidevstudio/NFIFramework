//
//  EADetailFilmPresenter.m
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EADetailFilmPresenter.h"

@interface EADetailFilmPresenter ()

@property (nonatomic, strong) NSObject<EADetailFilmUI> *ui;
@property (nonatomic, strong) EADetailFilmWireframe *wireframe;
@property (nonatomic, strong) Film *currentFilm;

@end

@implementation EADetailFilmPresenter

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EADetailFilmUI> *)ui andWireFrame:(EADetailFilmWireframe *)wireFrame {
    self = [super init];
    if (self) {
        self.ui = ui;
        self.wireframe = wireFrame;
    }
    return self;
}

#pragma mark - View Lyfe Cycle Methods

- (void)viewWillAppear {
    [self.ui showLoadingIndicator];
    [self.filmsInteractor findFilmByIdentifier:self.filmIdentifier];
}

- (void)viewDidAppear {
    // Nothing to do here.
}

- (void)viewDidDisappear {
    // Nothing to do here.
}

- (void)viewWillDisappear {
    // Nothing to do here.
}

- (void)viewDidLoad {
    [self.ui configureInitialViewWithTitle:@"Detail Info"];
}

#pragma mark - Presenter Input Methods

- (void)userRequestChangeFavoriteStatusForFilm {
    [self.favoritesInteractor changeFilmFavoriteStatus:self.currentFilm];
}

#pragma mark - Film Interactor Output Methods

- (void)foundFilmById:(Film *)film {
    self.currentFilm = film;
    [self.ui dismissLoadingIndicator];
    [self.ui updateFilmInfo:self.currentFilm];
    [self.favoritesInteractor checkFilmFavoriteStatus:self.currentFilm];
}

#pragma mark - Favorites Interactor Outout Methods

- (void)foundFavoriteFilmStatus:(BOOL)isFavorite {
    [self.ui updateFilmFavoriteStatus:isFavorite];
}

- (void)filmAddedToFavorites:(Film *)film withSuccess:(BOOL)success {
    if (success) {
        [self.ui updateFilmFavoriteStatus:YES];
    } else {
        [self.ui showAddFavoriteErrorMessage];
    }
}

- (void)filmRemovedFromFavorites:(Film *)film withSucess:(BOOL)success {
    if (success) {
        [self.ui updateFilmFavoriteStatus:NO];
    } else {
        [self.ui showRemoveFavoriteErrorMessage];
    }
}

@end
