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

@interface APMyFriendsListViewController ()

@end

@implementation APMyFriendsListViewController
{
    Friend *currentFriend;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

    if ([segue.identifier isEqualToString:@"detailInfoSegue"]) {
         UITabBarController *tbc = [segue destinationViewController];
        
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

}


-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    [[[self navigationController] navigationBar] setHidden:NO];
    [self setTitle:@"Mina vänner"];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
