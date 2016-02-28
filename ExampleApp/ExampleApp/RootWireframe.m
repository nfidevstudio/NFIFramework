//
//  RootWireframe.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "RootWireframe.h"
#import "EAppServiceLocator.h"

@implementation RootWireframe

- (void)presentInitialViewControllerInWindow:(UIWindow *)window {
    EAppServiceLocator *serviceLocator = (EAppServiceLocator *) [EAppServiceLocator sharedInstance];
    [window setRootViewController:[self configureNavigationForRootViewController:serviceLocator]];
}

- (UIViewController *)configureNavigationForRootViewController:(EAppServiceLocator *)serviceLocator {
    UINavigationController *navigationController = [serviceLocator provideRootNavigationViewController];
    [serviceLocator.navigatorContainer register:navigationController withIdentifier:@"RootNavigationController"];
    UIViewController *viewController = [serviceLocator provideHomeViewController];
    [navigationController setViewControllers:@[viewController] animated:NO];
    return navigationController;
}

@end
