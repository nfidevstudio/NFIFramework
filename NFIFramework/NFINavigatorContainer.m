//
//  NFINavigatorContainer.m
//  NFIFramework
//
//  Created by Pedro Lopez on 6/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFINavigatorContainer.h"

@interface NFINavigatorContainer ()

@property (nonatomic, strong) NSMutableDictionary *container;

@end

@implementation NFINavigatorContainer

- (instancetype)init {
    self = [super init];
    if (self) {
        self.container = [NSMutableDictionary dictionary];
    }
    return self;
}

- (UINavigationController *)register:(UINavigationController *)navigationController {
    [self.container setObject:navigationController forKey:NSStringFromClass([navigationController class])];
    return navigationController;
}

- (UINavigationController *)register:(UINavigationController *)navigationController withIdentifier:(NSString *)identifier {
    [self.container setObject:navigationController forKey:identifier];
    return navigationController;
}

- (UINavigationController *)resolve:(NSString *)identifier {
    return [self.container objectForKey:identifier];
}

@end
