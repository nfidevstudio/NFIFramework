//
//  EADetailFilmViewController.m
//  ExampleApp
//
//  Created by Pedro Lopez on 21/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EADetailFilmViewController.h"

// Example App classes.
#import "EADetailFilmPresenter.h"

// Third-Party dependencies.
#import <SDWebImage/UIImageView+WebCache.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface EADetailFilmViewController ()

// View IBOutlets
@property (nonatomic, strong) IBOutlet UILabel *filmTitleLabel;
@property (nonatomic, strong) IBOutlet UIButton *filmFavoriteButton;
@property (nonatomic, strong) IBOutlet UIImageView *filmPosterImageView;
@property (nonatomic, strong) IBOutlet UIWebView *filmWebView;

@end

@implementation EADetailFilmViewController

#pragma mark - Custom Presenter

- (EADetailFilmPresenter *)customPresenter {
    return (EADetailFilmPresenter *)self.presenter;
}

#pragma mark - EADetailFilmUI Interface Implementation

- (void)configureInitialViewWithTitle:(NSString *)title {
    self.title = title;
}

- (void)showLoadingIndicator {
    [SVProgressHUD show];
}

- (void)dismissLoadingIndicator {
    [SVProgressHUD dismiss];
}

- (void)showAddFavoriteErrorMessage {
    [SVProgressHUD showErrorWithStatus:@"This film can not be added to favorites"];
}

- (void)showRemoveFavoriteErrorMessage {
    [SVProgressHUD showErrorWithStatus:@"This film can not be removed to favorites"];
}

- (void)updateFilmInfo:(Film *)film {
    self.filmTitleLabel.text = film.title;
    [self.filmPosterImageView sd_setImageWithURL:[NSURL URLWithString:film.urlPoster] placeholderImage:nil];
    NSURLRequest* request = [NSURLRequest requestWithURL:[film urlForFilmSite] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    self.filmWebView.scalesPageToFit = YES;
    [self.filmWebView loadRequest:request];
}

- (void)updateFilmFavoriteStatus:(BOOL)isFavorite {
    if (isFavorite) {
        [self.filmFavoriteButton setTitle:@"Remove from favorites" forState:UIControlStateNormal];
    } else {
        [self.filmFavoriteButton setTitle:@"Add to favorites" forState:UIControlStateNormal];
    }
}

#pragma mark - Actions

- (IBAction)clickFavoriteButton:(id)sender {
    [[self customPresenter] userRequestChangeFavoriteStatusForFilm];
}

@end
