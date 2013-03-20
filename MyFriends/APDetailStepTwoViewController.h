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
@property (weak, nonatomic) Friend *currentFriend;


@property (weak, nonatomic) IBOutlet UILabel *hobbyLabel;

@property (weak, nonatomic) IBOutlet UILabel *favColorLabel;

@property (weak, nonatomic) IBOutlet UILabel *favMusicLabel;

@property (weak, nonatomic) IBOutlet UILabel *favMovieLabel;

@property (weak, nonatomic) IBOutlet UILabel *favTvLabel;

@property (weak, nonatomic) IBOutlet UILabel *favWebLabel;

@end
