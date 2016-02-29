//
//  NFIServiceLocator.m
//  NFIFramework
//
//  Created by Pedro Lopez on 6/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFIServiceLocator.h"

@interface NFIServiceLocator ()

@end

@implementation NFIServiceLocator

+ (instancetype)sharedInstance {
    static NFIServiceLocator *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initSingleton];
    });
    return _sharedInstance;
}

- (NFIServiceLocator *)initSingleton {
    self = [super init];
    if (self) {
        self.navigatorContainer = [[NFINavigatorContainer alloc] init];
    }
    return self;
}

#pragma mark - Public Methods

- (NFIStoryboard *)provideMainStoryboard {
    return [[NFIStoryboard alloc] initWithName:@"Main"];
}

- (NFIStoryboard *)provideStoryboardByIdentifier:(NSString *)identifier {
    return [[NFIStoryboard alloc] initWithName:identifier];
}

@end
