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
#import "EAFavoriteFilmsUI.h"
#import "EAFavoriteFilmsWireframe.h"
#import "EAFavoriteFilmsInteractor.h"

@interface EAFavoriteFilmsPresenter : NSObject <NFIPresenter, NFICollectionPresenter, EAFavoriteFilmsInteractorOutput>

#pragma mark - Public Properties

@property (nonatomic, strong) EAFavoriteFilmsInteractor *favoritesInteractor;

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EAFavoriteFilmsUI> *)ui andWireFrame:(EAFavoriteFilmsWireframe *)wireFrame;

@end
