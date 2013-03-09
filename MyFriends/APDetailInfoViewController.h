//
//  APDetailInfoViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-01.
//
//

#import <UIKit/UIKit.h>
@class Friend;

@interface APDetailInfoViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) Friend *currentFriend;



@property (weak, nonatomic) IBOutlet UILabel *firstName;

@property (weak, nonatomic) IBOutlet UILabel *lastName;

@property (weak, nonatomic) IBOutlet UILabel *address;


@property (weak, nonatomic) IBOutlet UILabel *email;

@property (weak, nonatomic) IBOutlet UILabel *school;

@property (weak, nonatomic) IBOutlet UILabel *birthday;

@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;



@end
