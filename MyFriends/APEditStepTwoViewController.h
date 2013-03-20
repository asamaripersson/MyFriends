//
//  APEditStepTwoViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import <UIKit/UIKit.h>
@class Friend;
@interface APEditStepTwoViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) Friend *currentFriend;
@property BOOL editMode;

@property (weak, nonatomic) IBOutlet UITextField *hobbuLabel;
@property (weak, nonatomic) IBOutlet UITextField *favColorLabel;

@property (weak, nonatomic) IBOutlet UITextField *favMusicLabel;

@property (weak, nonatomic) IBOutlet UITextField *favMovieLabel;

@property (weak, nonatomic) IBOutlet UITextField *favTvLabel;

@property (weak, nonatomic) IBOutlet UITextField *favWebLabel;

- (IBAction)saveFriend:(id)sender;


@end
