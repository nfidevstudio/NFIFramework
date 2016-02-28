//
//  EAHomePresenter.h
//  ExampleApp
//
//  Created by Pedro Lopez on 7/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

// NFIFramework classes.
#import "NFIFramework.h"

// Example App classes (UI and Wireframe).
#import "EAHomeUI.h"
#import "EAHomeWireframe.h"

@interface EAHomePresenter : NSObject <NFIPresenter>

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EAHomeUI> *)ui andWireFrame:(EAHomeWireframe *)wireFrame;

#pragma mark - Presenter Input Methods

- (void)optionWasTapped:(NSInteger )itemId;

@end
