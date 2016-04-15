//
//  NFITableViewCell.m
//  NFIFramework
//
//  Created by Pedro Lopez on 8/4/16.
//  Copyright © 2016 Pedro Lopez. All rights reserved.
//

#import "NFITableViewCell.h"

@interface NFITableViewCell ()

@property (nonatomic, strong) NSString *identifierForCellContent;

@end

@implementation NFITableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)configureCellForItem:(NSObject<NFICollectionItem> *)item {
    self.identifierForCellContent = [item uniqueIdentifierForCollectionItem];
}

@end
