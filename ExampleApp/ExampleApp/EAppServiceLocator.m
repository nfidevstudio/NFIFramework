//
//  ExampleAppServiceLocator.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAppServiceLocator.h"

// NFIFramework classes.
#import <NFIFramework/NFIRepositoryManager.h>
#import <NFIFramework/NFIOutputInteractor.h>

// Example App Presenters.
#import "EAHomePresenter.h"
#import "EANewFilmsPresenter.h"
#import "EADetailFilmPresenter.h"
#import "EAFavoriteFilmsPresenter.h"

// Example App Wireframes for Routing.
#import "EAHomeWireframe.h"
#import "EANewFilmsWireframe.h"
#import "EADetailFilmWireframe.h"
#import "EAFavoriteFilmsWireframe.h"

// Example App Interactors
#import "EANewFilmsInteractor.h"
#import "EAFavoriteFilmsInteractor.h"

// Example App Repositories implementations.
#import "EAFilmsMyAPIRepository.h"
#import "EAFavoritesRealmRepository.h"

// Identifiers for repositories related model.
static NSString *const kFilmsRelatedModel = @"kFilmsRelatedModel";
static NSString *const kFavoriteFilmsRelatedModel = @"kFavoriteFilmsRelatedModel";

@implementation EAppServiceLocator

#pragma mark - Root Controllers Providers.

- (UINavigationController *)provideRootNavigationViewController {
    UINavigationController *viewController = (UINavigationController *)[[self provideMainStoryboard] instantiateViewControllerWithIdentifier:@"RootNavigationController"];
    return viewController;
}

#pragma mark - Navigation Controllers Providers.

- (UINavigationController *)provideSectionOneNavigationController {
    UIViewController * viewController = [self provideNewFilmsViewController];
    return [[UINavigationController alloc] initWithRootViewController:viewController];
}

#pragma mark - View Controllers Providers.

- (EAHomeViewController *)provideHomeViewController {
    EAHomeViewController *viewController = (EAHomeViewController*)[[self provideMainStoryboard] instantiateViewControllerWithIdentifier:@"EAHomeViewController"];
    EAHomeWireframe *wireframe = [[EAHomeWireframe alloc] init];
    EAHomePresenter *presenter = [[EAHomePresenter alloc] initWithViewController:viewController andWireFrame:wireframe];
    viewController.presenter = presenter;
    return viewController;
}

- (EANewFilmsViewController *)provideNewFilmsViewController {
    EANewFilmsViewController *viewController = (EANewFilmsViewController*)[[self provideMainStoryboard] instantiateViewControllerWithIdentifier:@"EANewFilmsViewController"];
    EANewFilmsWireframe *wireframe = [[EANewFilmsWireframe alloc] init];
    EANewFilmsPresenter *presenter = [[EANewFilmsPresenter alloc] initWithViewController:viewController andWireFrame:wireframe];
    presenter.filmsInteractor = [self provideNewFilmsInteractorWithOutput:presenter];;
    viewController.presenter = presenter;
    return viewController;
}

- (EADetailFilmViewController *)provideDetailFilmViewController:(NSString *)filmId {
    EADetailFilmViewController *viewController = (EADetailFilmViewController *)[[self provideMainStoryboard] instantiateViewControllerWithIdentifier:@"EADetailFilmViewController"];
    EADetailFilmWireframe *wireframe = [[EADetailFilmWireframe alloc] init];
    EADetailFilmPresenter *presenter = [[EADetailFilmPresenter alloc] initWithViewController:viewController andWireFrame:wireframe];
    presenter.filmIdentifier = filmId;
    presenter.filmsInteractor = [self provideNewFilmsInteractorWithOutput:presenter];
    presenter.favoritesInteractor = [self provideFavoritesFilmsInteractorWithOutput:presenter];
    viewController.presenter = presenter;
    return viewController;
}

- (EAFavoriteFilmsViewController *)provideFavoriteFilmsViewController {
    EAFavoriteFilmsViewController *viewController = (EAFavoriteFilmsViewController *)[[self provideMainStoryboard] instantiateViewControllerWithIdentifier:@"EAFavoriteFilmsViewController"];
    EAFavoriteFilmsWireframe *wireframe = [[EAFavoriteFilmsWireframe alloc] init];
    EAFavoriteFilmsPresenter *presenter = [[EAFavoriteFilmsPresenter alloc] initWithViewController:viewController andWireFrame:wireframe];
    presenter.favoritesInteractor = [self provideFavoritesFilmsInteractorWithOutput:presenter];
    viewController.presenter = presenter;
    return viewController;
}

#pragma mark - Repositories

- (void)configureAppRepositories {
    // Register default implementation for Films Repository (API Repository).
    [[NFIRepositoryManager sharedInstance] registerRepositoryClass:[EAFilmsMyAPIRepository class] forRelatedModel:kFilmsRelatedModel];
    // Register default implementation for Favorites Repository (Realm BBDD Repository).
    [[NFIRepositoryManager sharedInstance] registerRepositoryClass:[EAFavoritesRealmRepository class] forRelatedModel:kFavoriteFilmsRelatedModel];
}

- (id<EAFilmsRepository>)provideFilmsRepository {
    id<NFIRepository> repository = [[NFIRepositoryManager sharedInstance] provideRepositoryInstanceForRelatedModel:kFilmsRelatedModel];
    if ([repository conformsToProtocol:@protocol(EAFilmsRepository)]) {
        return (id<EAFilmsRepository>)repository;
    }
    return nil;
}

- (id<EAFavoritesRepository>)provideFavoritesRepository {
    id<NFIRepository> repository = [[NFIRepositoryManager sharedInstance] provideRepositoryInstanceForRelatedModel:kFavoriteFilmsRelatedModel];
    if ([repository conformsToProtocol:@protocol(EAFavoritesRepository)]) {
        return (id<EAFavoritesRepository>)repository;
    }
    return nil;
}

#pragma mark - Interactors

- (EANewFilmsInteractor *)provideNewFilmsInteractorWithOutput:(id<EANewFilmsInteractorOutput>)outputInteractor {
    EANewFilmsInteractor *interactor = [[EANewFilmsInteractor alloc] initWithRepository:[self provideFilmsRepository]];
    interactor.output = outputInteractor;
    return interactor;
}

- (EAFavoriteFilmsInteractor *)provideFavoritesFilmsInteractorWithOutput:(id<EAFavoriteFilmsInteractorOutput>)outputInteractor {
    EAFavoriteFilmsInteractor *interactor = [[EAFavoriteFilmsInteractor alloc] initWithRepository:[self provideFavoritesRepository]];
    interactor.output = outputInteractor;
    return interactor;
}




@end
