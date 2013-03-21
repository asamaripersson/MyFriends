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


- (IBAction)saveMe:(id)sender {
    [[APMeStorage sharedStorage] createMeWithName:_firstName.text
                                         lastname:_lastName.text
                                         birthDay:_birthday.text
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



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.tableView setFrame:CGRectMake(0,0,320,570)];
    [[self tableView] reloadData];
}
@end
