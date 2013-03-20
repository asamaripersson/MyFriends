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
    
    if (_editMode) {
    _bestMemoryTextView.text = _currentFriend.bestMemory;
    _whenIgrowUpTextView.text = _currentFriend.whenIgrowUp;
    _aWishTextView.text = _currentFriend.ifIgotOneWish;
    }
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
        return NO;
    }
    return YES;
}
@end
