//
//  APFriendListCell.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-01.
//
//

#import <UIKit/UIKit.h>

@interface APFriendListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
