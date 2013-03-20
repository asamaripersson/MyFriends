//
//  APEditStepThreeViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import "APEditStepThreeViewController.h"
#import "Friend.h"
#import "APImageStorage.h"
#import "APFriendStorage.h"

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
    
    [[APFriendStorage sharedStorage] createFriendWithName:_currentFriend.firstName
                                                 lastname:_currentFriend.lastName
                                                 birthDay:_currentFriend.birthDay
                                                  address:_currentFriend.address
                                                    email:_currentFriend.email
                                                   school:_currentFriend.school
                                                    hobby:_currentFriend.hobby
                                            favoriteColor:_currentFriend.favoriteColor
                                            favoriteMovie:_currentFriend.favoriteMovie
                                            favoriteMusic:_currentFriend.favoriteMusic
                                           favoriteTvShow:_currentFriend.favoriteTVShow
                                                    image:nil
                                                 imageKey:_currentFriend.imageKey
                                          favoriteWebsite:_currentFriend.favoriteWebsite
                                               bestMemory:_currentFriend.bestMemory
                                              whenIgrowUp:_currentFriend.whenIgrowUp
                                            ifIgotOneWish:_currentFriend.ifIgotOneWish
                                              phonenumber:_currentFriend.phoneNumber];
    
    
     
    
    //TODO:
//    [[APImageStorage defaultImageStore] setImage:aNewImage
//                                          forKey:aNewImageKey];

    
    
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
