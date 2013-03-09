//
//  APEditMeViewController.h
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-02.
//
//

#import <UIKit/UIKit.h>
@class Me;
@interface APEditMeViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) Me *me;


@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *birthday;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *school;
- (IBAction)saveMe:(id)sender;

@end
