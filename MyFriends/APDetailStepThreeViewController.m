//
//  APDetailStepThreeViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import "APDetailStepThreeViewController.h"
#import "Friend.h"

@interface APDetailStepThreeViewController ()

@end

@implementation APDetailStepThreeViewController

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
    [[[self tabBarController]navigationItem] setTitle:[NSString stringWithFormat:@"%@:s thoghts",_currentFriend.firstName]];
    _bestMemoryTextView.text =_currentFriend.bestMemory;
    _whenIGrowUpTextView.text = _currentFriend.whenIgrowUp;
    _ifIGotaWishTextView.text = _currentFriend.ifIgotOneWish;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
