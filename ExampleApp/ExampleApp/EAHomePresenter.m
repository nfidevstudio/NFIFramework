//
//  EAHomePresenter.m
//  ExampleApp
//
//  Created by Pedro Lopez on 7/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAHomePresenter.h"

@interface EAHomePresenter ()

@property (nonatomic, strong) NSObject<EAHomeUI> *ui;
@property (nonatomic, strong) EAHomeWireframe *wireframe;

@end

@implementation EAHomePresenter

#pragma mark - Init Methods

- (instancetype)initWithViewController:(NSObject<EAHomeUI> *)ui andWireFrame:(EAHomeWireframe *)wireFrame {
    self = [super init];
    if (self) {
        self.ui = ui;
        self.wireframe = wireFrame;
    }
    return self;
}

#pragma mark - View Lyfe Cycle Methods

- (void)viewDidLoad {
    // Nothing to do here.
}

- (void)viewDidAppear {
    // Nothing to do here.
}

- (void)viewDidDisappear {
    // Nothing to do here.
}

- (void)viewWillAppear {
    // Nothing to do here.
}

- (void)viewWillDisappear {
    // Nothing to do here.
}

#pragma mark - Presenter Input Methods

- (void)optionWasTapped:(NSInteger)itemId {
    if (itemId == 1) {
        [self.wireframe presentNewFilmsViewController];
    } else if (itemId == 2) {
        [self.wireframe presentFavoriteFilmsViewController];
    }
}

@end
