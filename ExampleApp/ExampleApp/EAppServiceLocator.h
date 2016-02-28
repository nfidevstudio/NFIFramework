//
//  EAppServiceLocator.h
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

// NFIFramework classes.
#import "NFIFramework.h"

// View Controllers.
#import "EAHomeViewController.h"
#import "EANewFilmsViewController.h"
#import "EADetailFilmViewController.h"
#import "EAFavoriteFilmsViewController.h"

// Repositories.
#import "EAFilmsRepository.h"
#import "EAFavoritesRepository.h"

@interface EAppServiceLocator : NFIServiceLocator

#pragma mark - Containers

- (UINavigationController *)provideRootNavigationViewController;

#pragma mark - View Controllers Providers.

- (EAHomeViewController *)provideHomeViewController;
- (EANewFilmsViewController *)provideNewFilmsViewController;
- (EAFavoriteFilmsViewController *)provideFavoriteFilmsViewController;
- (EADetailFilmViewController *)provideDetailFilmViewController:(NSString *)filmId;

#pragma mark - Repositories Providers.

- (void)configureAppRepositories;
- (id<EAFilmsRepository>)provideFilmsRepository;
- (id<EAFavoritesRepository>)provideFavoritesRepository;

@end
