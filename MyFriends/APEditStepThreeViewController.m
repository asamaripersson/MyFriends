//
//  APEditStepThreeViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import "APEditStepThreeViewController.h"
#import "Friend.h"

@interface APEditStepThreeViewController ()

@end

@implementation APEditStepThreeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    //        [[[self tabBarController]navigationItem] setTitle:[NSString stringWithFormat:@"%@:s thoghts",_currentFriend.firstName]];
    [[[self tabBarController]navigationItem] setTitle:@"EDIT STEP THREE"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _bestMemoryTextView.delegate = self;
    _whenIgrowUpTextView.delegate = self;
    _aWishTextView.delegate = self;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)saveFriend:(id)sender {
//    if (_editMode) {
        _currentFriend.bestMemory = _bestMemoryTextView.text;
        _currentFriend.whenIgrowUp = _whenIgrowUpTextView.text;
        _currentFriend.ifIgotOneWish = _aWishTextView.text;
//    }
   
}
#pragma mark UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}
@end
