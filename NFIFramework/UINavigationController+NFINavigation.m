//
//  UINavigationController+NFINavigation.m
//  NFIFramework
//
//  Created by Pedro Lopez on 9/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "UINavigationController+NFINavigation.h"

@implementation UINavigationController (NFINavigation)

- (void)push:(UIViewController *)viewController withAnimation:(BOOL)animate {
    [self pushViewController:viewController animated:animate];
}

@end
