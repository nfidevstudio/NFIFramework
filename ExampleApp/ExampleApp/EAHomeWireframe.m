//
//  EAHomeWireframe.m
//  ExampleApp
//
//  Created by Pedro Lopez on 7/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAHomeWireframe.h"

// NFIFramework classes.
#import <NFIFramework/UINavigationController+NFINavigation.h>

// Example App classes.
#import "EAppServiceLocator.h"

@implementation EAHomeWireframe

#pragma mark - Wireframe Navigation Methods

- (void)presentNewFilmsViewController {
    EAppServiceLocator *serviceLocator = (EAppServiceLocator *) [EAppServiceLocator sharedInstance];
    UIViewController *viewController = [serviceLocator provideNewFilmsViewController];
    [[serviceLocator.navigatorContainer resolve:@"RootNavigationController"] push:viewController withAnimation:YES];
}

- (void)presentFavoriteFilmsViewController {
    EAppServiceLocator *serviceLocator = (EAppServiceLocator *) [EAppServiceLocator sharedInstance];
    UIViewController *viewController = [serviceLocator provideFavoriteFilmsViewController];
    [[serviceLocator.navigatorContainer resolve:@"RootNavigationController"] push:viewController withAnimation:YES];
}

@end
