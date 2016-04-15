//
//  EANewFilmsViewController.m
//  ExampleApp
//
//  Created by Pedro Lopez on 10/1/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EANewFilmsViewController.h"

// Thrid-party dependencies.
#import <SVProgressHUD/SVProgressHUD.h>

// Example App classes.
#import "EANewFilmsPresenter.h"
#import "EAFilmViewCell.h"


@interface EANewFilmsViewController () <UITableViewDelegate, UITextFieldDelegate>

// View IBOutlets
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UITextField *searchTF;

// Generic TableView data source.
@property (nonatomic, strong) NFITableViewDataSource *dataSource;

@end

@implementation EANewFilmsViewController

#pragma mark - View Life Cycle Methods

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

- (EANewFilmsPresenter *)customPresenter {
    return (EANewFilmsPresenter *)self.presenter;
}

#pragma mark - EANewFilmsUI Interface Implementation

- (void)showItems:(NSArray *)items {
    [self.dataSource.items removeAllObjects];
    [self.dataSource.items addObjectsFromArray:items];
    [self.tableView reloadData];
}

- (void)showLoadingIndicator {
    [SVProgressHUD show];
}

- (void)dismissLoadingIndicator {
    [SVProgressHUD dismiss];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NFICollectionItem *item = [self.dataSource itemAtIndexPath:indexPath];
    [[self customPresenter] itemWasTapped:item];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    textField.text = nil;
    [textField resignFirstResponder];
    // Wait for keyboard complete dismiss.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [[self customPresenter] userRequestShowAllFilms];
    });
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    // Wait for keyboard complete dismiss.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.6 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [[self customPresenter] userFilterFilmsWithTitle:textField.text];
    });
    return NO;
}

@end
