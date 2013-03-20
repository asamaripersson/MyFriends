//
//  APEditStepTwoViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import "APEditStepTwoViewController.h"
#import "Friend.h"

@interface APEditStepTwoViewController ()

@end

@implementation APEditStepTwoViewController

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
       [[[self tabBarController]navigationItem] setTitle:@"EDIT STEP TWO"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
if (_editMode) {
    //set text on labels
}
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
    _currentFriend.hobby = _hobbuLabel.text;
    _currentFriend.favoriteColor = _favColorLabel.text;
    _currentFriend.favoriteMovie = _favMusicLabel.text;
    _currentFriend.favoriteMovie = _favMovieLabel.text;
    _currentFriend.favoriteTVShow = _favTvLabel.text;
    _currentFriend.favoriteWebsite = _favWebLabel.text;
//    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
