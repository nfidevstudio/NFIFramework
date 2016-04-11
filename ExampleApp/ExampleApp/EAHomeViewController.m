//
//  EAHomeViewController.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAHomeViewController.h"

// Example App classes.
#import "EAHomePresenter.h"

@implementation EAHomeViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Custom Presenter

- (EAHomePresenter *)homePresenter {
    return (EAHomePresenter *)self.presenter;
}

#pragma mark - EAHomeUI Interface Implementation.

- (IBAction)selectOption1:(id)sender {
    [[self homePresenter] optionWasTapped:1];
}

- (IBAction)selectOption2:(id)sender {
    [[self homePresenter] optionWasTapped:2];
}

@end
