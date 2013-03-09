//
//  APViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2012-12-30.
//
//

#import "APViewController.h"
#import "APDetailInfoViewController.h"
#import "APEditMeViewController.h"
#import "Me.h"
#import "APMeStorage.h"
@interface APViewController ()

@end

@implementation APViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated
{
    [[[self navigationController] navigationBar] setHidden:YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
