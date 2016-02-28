//
//  UINavigationController+NFINavigation.h
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINavigationController (NFINavigation)

- (void)push:(UIViewController *)viewController withAnimation:(BOOL)animate;

@end