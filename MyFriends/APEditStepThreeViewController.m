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

    
    [self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:1] animated:YES];

    //TODO: create the new friend HERE
//    [[APFriendStorage sharedStorage] createFriendWithName:_currentFriend.firstName
//                                                 lastname:_currentFriend.lastName
//                                                 birthDay:_currentFriend.birthDay
//                                                  address:_currentFriend.address
//                                                    email:_currentFriend.email
//                                                   school:_currentFriend.school
//                                                    hobby:_currentFriend.hobby
//                                            favoriteColor:_currentFriend.favoriteColor
//                                            favoriteMovie:_currentFriend.favoriteMovie
//                                            favoriteMusic:_currentFriend.favoriteMusic
//                                           favoriteTvShow:_currentFriend.favoriteTVShow
//                                                    image:nil
//                                                 imageKey:_currentFriend.imageKey
//                                          favoriteWebsite:_currentFriend.favoriteWebsite
//                                               bestMemory:_currentFriend.bestMemory
//                                              whenIgrowUp:_currentFriend.whenIgrowUp
//                                            ifIgotOneWish:_currentFriend.ifIgotOneWish
//                                              phonenumber:_currentFriend.phoneNumber];
    
    
     
    
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
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == _aWishTextView)  [self.tableView setFrame:CGRectMake(0,-20,320,490)];
    if (textView == _whenIgrowUpTextView)  [self.tableView setFrame:CGRectMake(0,-160,320,490)];
    
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self.tableView setFrame:CGRectMake(0,0,320,490)];
    [[self tableView] reloadData];
}

@end
