//
//  APEditStepTwoViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import "APEditStepTwoViewController.h"
#import "Friend.h"
#import "APEditStepThreeViewController.h"
#import "APFriendStorage.h"

@interface APEditStepTwoViewController ()

@end

@implementation APEditStepTwoViewController
{
    Friend *newFriend;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"createStepThreeSeg"]) {
        //        UITabBarController *tbc = [segue destinationViewController];
        //
        //        APDetailInfoViewController *divc = [[tbc viewControllers] objectAtIndex:0];
        //        APDetailStepTwoViewController *dsTwovc = [[tbc viewControllers] objectAtIndex:1];
        //        APDetailStepThreeViewController *dsThreevc = [[tbc viewControllers] objectAtIndex:2];
        //        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        APEditStepThreeViewController *esThreeVc = [segue destinationViewController];
        [esThreeVc setCurrentFriend:_currentFriend];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
       [[[self tabBarController]navigationItem] setTitle:@"EDIT STEP TWO"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _hobbyLabel.delegate = self;
    _favColorLabel.delegate = self;
    _favMovieLabel.delegate = self;
    _favMusicLabel.delegate = self;
    _favTvLabel.delegate = self;
    _favWebLabel.delegate = self;
    NSLog(@"MY FRIEND first name: %@ and b-day:  %@", _currentFriend.firstName, _currentFriend.birthDay);
    newFriend = _currentFriend;
    _nextBtnLabel.text = @"Next";
    if (_editMode) {
    _hobbyLabel.text = _currentFriend.hobby;
    _favColorLabel.text = _currentFriend.favoriteColor;
    _favMovieLabel.text =_currentFriend.favoriteMovie;
    _favMusicLabel.text = _currentFriend.favoriteMusic;
    _favTvLabel.text = _currentFriend.favoriteTVShow;
    _favWebLabel.text = _currentFriend.favoriteWebsite;
         _nextBtnLabel.text = @"Save";
    }

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

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)next:(id)sender {
    //    if (_editMode) {
    NSLog(@"MY FRIEND MUSIC: %@", _currentFriend.favoriteMusic);
    NSLog(@"MY FRIEND first name: %@", _currentFriend.firstName);
    newFriend.hobby = _hobbyLabel.text;
    newFriend.favoriteColor = _favColorLabel.text;
    newFriend.favoriteMusic = _favMusicLabel.text;
    newFriend.favoriteMovie = _favMovieLabel.text;
    newFriend.favoriteTVShow = _favTvLabel.text;
    newFriend.favoriteWebsite = _favWebLabel.text;
    NSLog(@"MY FRIEND MUSIC: %@", newFriend.favoriteMusic);
       NSLog(@"MY FRIEND first name: %@", newFriend.firstName);
    
//      [[self navigationController] performSegueWithIdentifier:@"createStepThreeSeg" sender:self];
    [[[[self tabBarController] viewControllers] objectAtIndex:2] setCurrentFriend:newFriend];
     [[self tabBarController] setSelectedIndex:2];
    //    }
}
@end
