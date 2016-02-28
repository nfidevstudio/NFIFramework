//
//  NFIUI.h
//  NFIFramework
//
//  Created by Pedro Lopez on 7/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NFIUI <NSObject>

@optional

- (void)configureInitialViewWithTitle:(NSString *)title;
- (void)showItems:(NSArray *)items;
- (void)showLoadingIndicator;
- (void)dismissLoadingIndicator;
- (void)showSuccessMessage:(NSString *)message;
- (void)showErrorMessage:(NSString *)message;

@end
