//
//  NFITableViewDataSourceProtocol.h
//  NFIFramework
//
//  Created by Pedro Lopez on 2/3/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

@protocol NFITableViewDataSourceProtocol <NSObject>

@optional

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath;

@end
