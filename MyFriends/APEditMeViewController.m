//
//  APEditMeViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-02.
//
//

#import "APEditMeViewController.h"
#import "APMeStorage.h"
#import "Me.h"
@interface APEditMeViewController ()

@end

@implementation APEditMeViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[[self navigationController] navigationBar] setHidden:NO];
    
    _firstName.delegate = self;
    _lastName.delegate = self;
    _birthday.delegate = self;
    _address.delegate = self;
    _school.delegate = self;
    _email.delegate = self;

    _me = [[APMeStorage sharedStorage] getMe];
        _firstName.text = _me.firstName;
        _lastName.text = _me.lastName;
        _birthday.text = _me.birthDay;
        _address.text = _me.address;
        _school.text = _me.school;
        _email.text = _me.email;
 
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveMe:(id)sender {
    [[APMeStorage sharedStorage] createMeWithName:_firstName.text
                                         lastname:_lastName.text
                                         birthDay:nil
                                          address:_address.text
                                            email:_email.text
                                           school:_school.text
                                            hobby:@""
                                    favoriteColor:@""
                                    favoriteMovie:@""
                                    favoriteMusic:@""
                                   favoriteTvShow:@""
                                            image:nil
                                  favoriteWebsite:@""
                                       bestMemory:@""
                                      whenIgrowUp:@""
                                    ifIgotOneWish:@""
                                      phonenumber:nil];
    [[self navigationController]popViewControllerAnimated:YES];

}
@end
