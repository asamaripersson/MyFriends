//
//  APDetailInfoViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-01.
//
//

#import "APDetailInfoViewController.h"
#import "Friend.h"
#import "APFriendStorage.h"
#import "APEditFriendViewController.h"
#import "APImageStorage.h"
@interface APDetailInfoViewController ()

@end

@implementation APDetailInfoViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EditFriendSeg"]) {
        [[segue destinationViewController] setTitle:_currentFriend.firstName];
        [[segue destinationViewController] setCurrentFriend:_currentFriend];
       [[segue destinationViewController]setEditMode:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _firstName.text = _currentFriend.firstName;
    _lastName.text = _currentFriend.lastName;
    _birthday.text = _currentFriend.birthDay;
    _address.text = _currentFriend.address;
    _school.text = _currentFriend.school;
    _email.text = _currentFriend.email;
    _phoneNumber.text =@"nummer";
        
    NSString *imageKey = [_currentFriend imageKey];
    if (imageKey) {
        UIImage *imageToDisplay =
        [[APImageStorage defaultImageStore] imageForKey:imageKey];
        NSLog(@"there is an imagekey"); 
        [_image setImage:imageToDisplay];
    } else {
        [_image setImage:nil]; NSLog(@"there NO an imagekey"); 
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
