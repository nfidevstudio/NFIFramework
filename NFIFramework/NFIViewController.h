//
//  NFIViewController.h
//  NFIFramework
//
//  Created by Pedro Lopez on 6/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFIPresenter.h"

@interface NFIViewController : UIViewController

@property (nonatomic, strong) NSObject<NFIPresenter> *presenter;

@end
