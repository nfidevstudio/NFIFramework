//
//  EANewFilmsViewController.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAFavoriteFilmsViewController.h"

// Example App classes.
#import "EAFavoriteFilmsPresenter.h"
#import "EAFilmViewCell.h"

// Third-Party classes.
#import <SVProgressHUD/SVProgressHUD.h>

@interface EAFavoriteFilmsViewController () <UITableViewDelegate>

// View IBOutlets
@property (nonatomic, strong) IBOutlet UITableView *tableView;

// Generic TableView data source.
@property (nonatomic, strong) NFITableViewDataSource *dataSource;

@end

@implementation EAFavoriteFilmsViewController

#pragma mark - View Lyfe Cicle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configureInitialViewWithTitle:(NSString *)title {
    self.title = title;
    self.dataSource = [NFITableViewDataSource dataSourceForItems:[Film class] andCell:[EAFilmViewCell class]];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];    
}

#pragma mark - Custom Presenter

- (EAFavoriteFilmsPresenter *)customPresenter {
    return (EAFavoriteFilmsPresenter *)self.presenter;
}

#pragma mark - EAFavoriteFilmsUI Interface Implementation

- (void)showLoadingIndicator {
    [SVProgressHUD show];
}

- (void)dismissLoadingIndicator {
    [SVProgressHUD dismiss];
}

- (void)showItems:(NSArray *)items {
    [self.dataSource.items removeAllObjects];
    [self.dataSource.items addObjectsFromArray:items];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NFICollectionItem *item = [self.dataSource itemAtIndexPath:indexPath];
    [[self customPresenter] itemWasTapped:item];
}

@end
