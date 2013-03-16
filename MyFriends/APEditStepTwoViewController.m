//
//  APEditStepTwoViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-03-16.
//
//

#import "APEditStepTwoViewController.h"

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
-(void)viewWillAppear:(BOOL)animated
{
//        [[[self tabBarController]navigationItem] setTitle:[NSString stringWithFormat:@"%@:s thoghts",_currentFriend.firstName]];
       [[[self tabBarController]navigationItem] setTitle:@"EDIT STEP TWO"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

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

@end
