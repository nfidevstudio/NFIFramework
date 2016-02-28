//
//  NFIStoryboard.m
//  NFIFramework
//
//  Created by Pedro Lopez on 6/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIStoryboard.h"

@interface NFIStoryboard ()

@property (nonatomic, strong) NSString *name;

@end

@implementation NFIStoryboard

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (UIStoryboard *)storyboardWithName:(NSString *)name {
    return [UIStoryboard storyboardWithName:name bundle:[NSBundle mainBundle]];
}

- (UIViewController *)initialViewController {
    UIStoryboard *uiStoryboard = [self storyboardWithName:self.name];
    return [uiStoryboard instantiateInitialViewController];
}

- (UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)identifier {
    UIStoryboard *uiStoryboard = [self storyboardWithName:self.name];
    return [uiStoryboard instantiateViewControllerWithIdentifier:identifier];
}

@end
