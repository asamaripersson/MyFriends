//
//  APMyFriendsListViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2012-12-30.
//
//

#import "APMyFriendsListViewController.h"
#import "APFriendStorage.h"
#import "APFriendListCell.h"
#import "Friend.h"
#import "APDetailInfoViewController.h"
#import "APEditFriendViewController.h"
#import "APImageStorage.h"
#import "APDetailStepTwoViewController.h"
#import "APDetailStepThreeViewController.h"
#import "APEditStepTwoViewController.h"
#import "APEditStepThreeViewController.h"

@interface APMyFriendsListViewController ()

@end

@implementation APMyFriendsListViewController
{
    Friend *currentFriend;
    UITabBarController *tbc;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

    if ([segue.identifier isEqualToString:@"detailInfoSegue"]) {
         tbc = [segue destinationViewController];
        
        APDetailInfoViewController *divc = [[tbc viewControllers] objectAtIndex:0];
        APDetailStepTwoViewController *dsTwovc = [[tbc viewControllers] objectAtIndex:1];
        APDetailStepThreeViewController *dsThreevc = [[tbc viewControllers] objectAtIndex:2];
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        currentFriend = [[[APFriendStorage sharedStorage]allFriends] objectAtIndex:path.row];
        [divc setCurrentFriend:currentFriend];
        [dsTwovc setCurrentFriend:currentFriend];
        [dsThreevc setCurrentFriend:currentFriend];
        
        UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                        target:[[tbc viewControllers]objectAtIndex:0]
                                        action:@selector(editFriend)];
        
        [[tbc navigationItem]setRightBarButtonItem:rightBarBtn];
    }

    
    //TODO: Not neccessery??
    if ([segue.identifier isEqualToString:@"addFriendSegue"]) {
       // UITabBarController *tbc = [segue destinationViewController];

         APEditFriendViewController *efVc = [segue destinationViewController];
        [efVc setTitle:@"New friend"];
//               UIBarButtonItem *removeItem = [[UIBarButtonItem alloc]
//                                            initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
//                                              target:efVc
//                                              action:@selector(removeFriend:)];
//               [[efVc navigationItem] setRightBarButtonItem:removeItem];

        
      
        
//       __unused APEditFriendViewController *efVc = [[tbc viewControllers] objectAtIndex:0];
//       __unused APEditStepTwoViewController *efTwovc = [[tbc viewControllers] objectAtIndex:1];
//        __unused APEditStepThreeViewController *efThreevc = [[tbc viewControllers] objectAtIndex:2];
        
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    [[[self navigationController] navigationBar] setHidden:NO];
    [self setTitle:@"My Friends"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[APFriendStorage sharedStorage] allFriends] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"friendListCell";

    APFriendListCell *cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Friend *f = [[[APFriendStorage sharedStorage]allFriends]objectAtIndex:indexPath.row];
    cell.firstNameLabel.text = f.firstName;
    cell.lastNameLabel.text = f.lastName;
    
    
    NSString *imageKey = [f imageKey];
    if (imageKey) {
        UIImage *imageToDisplay = [[APImageStorage defaultImageStore] imageForKey:imageKey];
        NSLog(@"there is an imagekey");
        [cell.image setImage:imageToDisplay];
    } else {
        [cell.image setImage:nil]; NSLog(@"there NO an imagekey");
    }
    
    
    return cell;

}



@end
