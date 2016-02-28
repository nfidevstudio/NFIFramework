//
//  EAFilmViewCell.m
//  ExampleApp
//
//  Created by Pedro Lopez on 20/2/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "EAFilmViewCell.h"

// Third-Party dependencies.
#import <SDWebImage/UIImageView+WebCache.h>

// Example App classes.
#import "Film.h"

@interface EAFilmViewCell ()

// Cell IBOutlets
@property (nonatomic, strong) IBOutlet UIImageView *posterImageView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *yearLabel;
@property (nonatomic, strong) IBOutlet UILabel *ratingLabel;

@end

@implementation EAFilmViewCell

#pragma mark - NFI Cell Interface Implementation

- (void)configureCellForItem:(NFICollectionItem *)item {
    if ([item isKindOfClass:[Film class]]) {
        Film *film = (Film *)item;
        self.titleLabel.text = film.title;
        self.yearLabel.text = film.year;
        self.ratingLabel.text = film.rating;
        [self.posterImageView sd_setImageWithURL:[NSURL URLWithString:film.urlPoster] placeholderImage:nil];
    }
}

@end
