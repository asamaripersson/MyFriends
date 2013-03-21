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
#import "APDetailStepThreeViewController.h"
#import "APEditStepTwoViewController.h"
#import "APEditStepThreeViewController.h"

@interface APDetailInfoViewController ()

@end

@implementation APDetailInfoViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([segue.identifier isEqualToString:@"EditFriendSeg"]) {
//        [[segue destinationViewController] setTitle:_currentFriend.firstName];
//        [[segue destinationViewController] setCurrentFriend:_currentFriend];
//       [[segue destinationViewController]setEditMode:YES];
//    }
    if ([segue.identifier isEqualToString:@"EditFriendSegue"]) {
        
        APEditFriendViewController *efVc = [segue destinationViewController];

        [efVc setCurrentFriend:_currentFriend];
        [efVc setTitle:[NSString stringWithFormat:@"Edit %@", _currentFriend.firstName]];
        [efVc setEditMode:YES];

        UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                        target:efVc
                                        action:@selector(removeFriend)];
        
        [[efVc navigationItem]setRightBarButtonItem:rightBarBtn];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[[self tabBarController]navigationItem] setTitle:[NSString stringWithFormat:@"%@:s base info",_currentFriend.firstName]];
    _firstName.text = _currentFriend.firstName;
    _lastName.text = _currentFriend.lastName;
    _birthday.text = _currentFriend.birthDay;
    _address.text = _currentFriend.address;
    _school.text = _currentFriend.school;
    _email.text = _currentFriend.email;
    _phoneNumber.text = [_currentFriend.phoneNumber stringValue];
        
    NSString *imageKey = [_currentFriend imageKey];
    if (imageKey) {
        UIImage *imageToDisplay = [[APImageStorage defaultImageStore] imageForKey:imageKey];
        NSLog(@"there is an imagekey"); 
        [_image setImage:imageToDisplay];
    } else {
        [_image setImage:nil]; NSLog(@"there NO an imagekey"); 
    }
    
}
- (void)editFriend
{
    NSLog(@"preform segue edit friend??");
    [self performSegueWithIdentifier: @"EditFriendSegue" sender: self];
    
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
