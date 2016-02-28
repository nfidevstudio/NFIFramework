//
//  NFINavigatorContainer.h
//  NFIFramework
//
//  Created by Pedro Lopez on 6/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NFINavigatorContainer : NSObject

- (UINavigationController *)register:(UINavigationController *)navigationController;
- (UINavigationController *)register:(UINavigationController *)navigationController withIdentifier:(NSString *)identifier;
- (UINavigationController *)resolve:(NSString *)identifier;
    
@end
