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
#import "APEditFriendViewController.h"

@interface APEditStepTwoViewController ()

@end

@implementation APEditStepTwoViewController
{
    Friend *newFriend;
    APEditFriendViewController *edidFriendVc;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {


    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"createStepThreeSeg"]) {

        APEditStepThreeViewController *esThreeVc = [segue destinationViewController];
        [esThreeVc setCurrentFriend:_currentFriend];
        if (_editMode){
            
            UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]
                                            initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                            target:[self.navigationController.viewControllers objectAtIndex:3]
                                            action:@selector(removeFriend)];
            
            
            [[esThreeVc navigationItem]setRightBarButtonItem:rightBarBtn];
            [esThreeVc setEditMode:YES];
            [esThreeVc setTitle:@"Edit some more"];
          
       }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
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
    }
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
}


- (IBAction)next:(id)sender {

    newFriend.hobby = _hobbyLabel.text;
    newFriend.favoriteColor = _favColorLabel.text;
    newFriend.favoriteMusic = _favMusicLabel.text;
    newFriend.favoriteMovie = _favMovieLabel.text;
    newFriend.favoriteTVShow = _favTvLabel.text;
    newFriend.favoriteWebsite = _favWebLabel.text;

}
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)keyboardDidShow:(NSNotification *)notification
{
    NSLog(@"keyboardDidShow");
    [self.tableView scrollsToTop];
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.tableView setFrame:CGRectMake(0,0,320,460)];
}


@end
