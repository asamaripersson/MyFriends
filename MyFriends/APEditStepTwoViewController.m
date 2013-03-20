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
    
    if (_editMode) {
    _hobbyLabel.text = _currentFriend.hobby;
    _favColorLabel.text = _currentFriend.favoriteColor;
    _favMovieLabel.text =_currentFriend.favoriteMovie;
    _favMusicLabel.text = _currentFriend.favoriteMusic;
    _favTvLabel.text = _currentFriend.favoriteTVShow;
    _favWebLabel.text = _currentFriend.favoriteWebsite;
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
    _currentFriend.hobby = _hobbyLabel.text;
    _currentFriend.favoriteColor = _favColorLabel.text;
    _currentFriend.favoriteMusic = _favMusicLabel.text;
    _currentFriend.favoriteMovie = _favMovieLabel.text;
    _currentFriend.favoriteTVShow = _favTvLabel.text;
    _currentFriend.favoriteWebsite = _favWebLabel.text;
    
      [[self navigationController] performSegueWithIdentifier:@"createStepThreeSeg" sender:self];
    //    }
}
@end
