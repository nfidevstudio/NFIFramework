//
//  EANewFilmsWireframe.h
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

@interface EANewFilmsWireframe : NFIWireframe

#pragma mark - Wireframe Navigation Methods

- (void)presentFilmDetailViewController:(NSString *)filmIdentifier;

@end
