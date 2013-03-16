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
    if ([segue.identifier isEqualToString:@"EditFriendSeg"]) {
        UITabBarController *tbc = [segue destinationViewController];
        
        APEditFriendViewController *efVc = [[tbc viewControllers] objectAtIndex:0];
        APEditStepTwoViewController *efTwovc = [[tbc viewControllers] objectAtIndex:1];
        APEditStepThreeViewController *efThreevc = [[tbc viewControllers] objectAtIndex:2];
       
        [efVc setCurrentFriend:_currentFriend];
        [efTwovc setCurrentFriend:_currentFriend];
        [efThreevc setCurrentFriend:_currentFriend];
        [efVc setEditMode:YES];
        [efTwovc setEditMode:YES];
        [efThreevc setEditMode:YES];
        
        UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                        target:[[tbc viewControllers]objectAtIndex:0]
                                        action:@selector(removeFriend)];
        
        [[tbc navigationItem]setRightBarButtonItem:rightBarBtn];
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
    _phoneNumber.text =@"nummer";
        
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
    [self performSegueWithIdentifier: @"EditFriendSeg" sender: self];
    
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
