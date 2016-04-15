//
//  EANewFilmsPresenter.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EANewFilmsPresenter.h"

@interface EANewFilmsPresenter ()

@property (nonatomic, weak) NSObject<EANewFilmsUI> *ui;
@property (nonatomic, strong) EANewFilmsWireframe *wireframe;

@end

@implementation EANewFilmsPresenter

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EANewFilmsUI> *)ui andWireFrame:(EANewFilmsWireframe *)wireFrame {
    self = [super init];
    if (self) {
        self.ui = ui;
        self.wireframe = wireFrame;
    }
    return self;
}

#pragma mark - View Life Cycle Methods

- (void)viewDidLoad {
    [self.ui configureInitialViewWithTitle:@"Films In Theaters"];
    [self.ui showLoadingIndicator];
    [self.filmsInteractor findNewFilms];
}

- (void)viewDidAppear {
    // Nothing to do here.
}

- (void)viewDidDisappear {
    // Nothing to do here.
}

- (void)viewWillAppear {
    // Nothing to do here.
}

- (void)viewWillDisappear {
    [self.ui dismissLoadingIndicator];
}

#pragma mark - Presenter Input Methods

- (void)userRequestShowAllFilms {
    [self.ui showLoadingIndicator];
    [self.filmsInteractor findNewFilms];
}

- (void)userFilterFilmsWithTitle:(NSString *)title {
    [self.ui showLoadingIndicator];
    [self.filmsInteractor findFilmsFilterByTitle:title];
}

- (void)itemWasTapped:(NFICollectionItem *)item {
    Film *filmTapped = (Film *)item;
    [self.wireframe presentFilmDetailViewController:[filmTapped uniqueIdentifier]];
}

#pragma mark - Interactor Output Methods

- (void)foundNewFilms:(NSArray *)films {
    [self.ui showItems:films];
    [self.ui dismissLoadingIndicator];
}

- (void)foundFilmById:(Film *)film {
    // Nothing to do here.
}

- (void)foundFilteredFilms:(NSArray *)filterFilms {
    [self.ui showItems:filterFilms];
    [self.ui dismissLoadingIndicator];
}

@end
