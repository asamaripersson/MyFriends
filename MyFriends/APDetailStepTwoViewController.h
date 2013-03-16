//
//  APDetailStepTwoViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import <UIKit/UIKit.h>
@class Friend;
@interface APDetailStepTwoViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) Friend *currentFriend;
@end
