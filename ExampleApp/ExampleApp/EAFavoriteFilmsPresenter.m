//
//  EANewFilmsPresenter.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAFavoriteFilmsPresenter.h"

@interface EAFavoriteFilmsPresenter ()

@property (nonatomic, strong) NSObject<EAFavoriteFilmsUI> *ui;
@property (nonatomic, strong) EAFavoriteFilmsWireframe *wireframe;

@end

@implementation EAFavoriteFilmsPresenter

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EAFavoriteFilmsUI> *)ui andWireFrame:(EAFavoriteFilmsWireframe *)wireFrame {
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
    [self.favoritesInteractor findFavoriteFilms];
}

- (void)viewWillDisappear {
    [self.ui dismissLoadingIndicator];
}

- (void)viewDidLoad {
    [self.ui configureInitialViewWithTitle:@"Favorite Films"];
}

- (void)viewDidAppear {
    // Nothing to do here.
}

- (void)viewDidDisappear {
    // Nothing to do here.
}

#pragma mark - Presenter Input Methods

- (void)itemWasTapped:(NFICollectionItem *)item {
    Film *filmTapped = (Film *)item;
    [self.wireframe presentFilmDetailViewController:[filmTapped uniqueIdentifier]];
}

#pragma mark - Interactor Output Methods.

- (void)foundFavoriteFilms:(NSArray *)films {
    [self.ui showItems:films];
    [self.ui dismissLoadingIndicator];
}

@end
