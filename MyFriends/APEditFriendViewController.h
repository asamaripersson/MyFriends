//
//  APEditFriendViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-01.
//
//

#import <UIKit/UIKit.h>
@class Friend;
@interface APEditFriendViewController : UITableViewController <UITextFieldDelegate, UIPopoverControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
UIPopoverController *imagePickerPopover;
}
- (IBAction)takePic:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) Friend *currentFriend;


@property BOOL editMode;

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *birtday;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *school;

- (IBAction)saveFriend:(id)sender;


@end
