//
//  NFIStoryboard.h
//  NFIFramework
//
//  Created by Pedro Lopez on 6/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NFIStoryboard : NSObject

- (instancetype)initWithName:(NSString *)name;
- (UIStoryboard *)storyboardWithName:(NSString *)name;
- (UIViewController *)initialViewController;
- (UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)identifier;

@end
