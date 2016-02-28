//
//  EANewFilmsPresenter.h
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes (View, Wireframe and Interactor)
#import "EANewFilmsUI.h"
#import "EANewFilmsWireframe.h"
#import "EANewFilmsInteractor.h"

@interface EANewFilmsPresenter : NSObject <NFIPresenter, NFICollectionPresenter, EANewFilmsInteractorOutput>

#pragma mark - Public Properties

@property (nonatomic, strong) EANewFilmsInteractor *filmsInteractor;

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EANewFilmsUI> *)ui andWireFrame:(EANewFilmsWireframe *)wireFrame;

#pragma mark - Presenter Input Methods

- (void)userRequestShowAllFilms;
- (void)userFilterFilmsWithTitle:(NSString *)title;

@end
