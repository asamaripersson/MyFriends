//
//  APDetailStepTwoViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import "APDetailStepTwoViewController.h"
#import "Friend.h"

@interface APDetailStepTwoViewController ()

@end

@implementation APDetailStepTwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[[self tabBarController]navigationItem] setTitle:[NSString stringWithFormat:@"%@:s hobbies",_currentFriend.firstName]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
