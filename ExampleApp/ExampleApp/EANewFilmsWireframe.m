//
//  SectionOneWireframe.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EANewFilmsWireframe.h"

// Example App classes.
#import "EAppServiceLocator.h"

@implementation EANewFilmsWireframe

#pragma mark - Wireframe Navigation Methods

- (void)presentFilmDetailViewController:(NSString *)filmIdentifier {
    EAppServiceLocator *serviceLocator = (EAppServiceLocator *) [EAppServiceLocator sharedInstance];
    UIViewController *detailViewController = [serviceLocator provideDetailFilmViewController:filmIdentifier];
    [[serviceLocator.navigatorContainer resolve:@"RootNavigationController"] push:detailViewController withAnimation:YES];
}

@end
