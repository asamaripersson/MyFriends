//
//  APEditFriendViewController.m
//  MyFriends
//
//  Created by Åsa Persson on 2013-02-01.
//
//

#import "APEditFriendViewController.h"
#import "APMyFriendsListViewController.h"
#import "Friend.h"
#import "APFriendStorage.h"
#import "APImageStorage.h"
#import "APEditStepTwoViewController.h"

@interface APEditFriendViewController ()

@end

@implementation APEditFriendViewController
{
    NSString *aNewImageKey;
    UIImage *aNewImage;
    BOOL thereIsANewImage;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"stepTwoSegue"]) {
        
        APEditStepTwoViewController *esTwoVc = [segue destinationViewController];
        [esTwoVc setCurrentFriend:_currentFriend];
        if (_editMode){
                
                UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]
                                                initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                target:self
                                                action:@selector(removeFriend)];
                
            [[esTwoVc navigationItem]setRightBarButtonItem:rightBarBtn];
            [esTwoVc setEditMode:YES];
            [esTwoVc setTitle:@"Edit favorites"];
            
            
        }
       }
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    {

        
    _firstName.delegate = self;
    _lastName.delegate = self;
    _birtday.delegate = self;
    _address.delegate = self;
    _school.delegate = self;
    _email.delegate = self;
    _phoneNumber.delegate = self;
        
    thereIsANewImage = NO;

        
    if (_editMode) {
        _firstName.text = _currentFriend.firstName;
        _lastName.text = _currentFriend.lastName;
        _birtday.text = _currentFriend.birthDay;
        _address.text = _currentFriend.address;
        _school.text = _currentFriend.school;
        _email.text = _currentFriend.email;
        _phoneNumber.text = _currentFriend.phoneNumber;
        _image.image = [[APImageStorage defaultImageStore] imageForKey:_currentFriend.imageKey];

    }
}
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


- (IBAction)nextStep:(id)sender {
    
    if (_editMode) {
         _currentFriend.firstName = _firstName.text;
        _currentFriend.lastName =_lastName.text;
        _currentFriend.birthDay = _birtday.text;
        _currentFriend.address = _address.text;
        _currentFriend.school = _school.text;
        _currentFriend.email = _email.text;
        _currentFriend.phoneNumber = _phoneNumber.text;

        if (thereIsANewImage)
        {
                NSString *oldKey = [_currentFriend imageKey];
                if (oldKey) {
                    NSString *oldKey = [_currentFriend imageKey];
                    [[APImageStorage defaultImageStore] deleteImageForKey:oldKey];
                }
                _currentFriend.imageKey = aNewImageKey;
                [[APImageStorage defaultImageStore] setImage:aNewImage
                                                      forKey:aNewImageKey];
        }
            [self performSegueWithIdentifier:@"stepTwoSegue" sender:self];
        
    } else {
        
        if (_firstName.text.length < 1) {
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"No name" message:@"Your friend must have a name??" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        } else {
        

            
            //TODP: create friend in step three?
   _currentFriend = [[APFriendStorage sharedStorage] createFriendWithName:_firstName.text
                                                                     lastname:_lastName.text
                                                                     birthDay:_birtday.text
                                                                      address:_address.text
                                                                        email:_email.text
                                                                       school:_school.text
                                                                        hobby:@""
                                                                favoriteColor:@""
                                                                favoriteMovie:@""
                                                                favoriteMusic:@""
                                                               favoriteTvShow:@""
                                                                        image:nil
                                                                     imageKey:nil
                                                              favoriteWebsite:@""
                                                                   bestMemory:@""
                                                                  whenIgrowUp:@""
                                                                ifIgotOneWish:@""
                                                                  phonenumber:_phoneNumber.text];

            
            if (thereIsANewImage) {
                [_currentFriend setImageKey:aNewImageKey];
                
                //TODO: set image in step three? 
                [[APImageStorage defaultImageStore] setImage:aNewImage
                                                      forKey:aNewImageKey];
            }
            [self performSegueWithIdentifier:@"stepTwoSegue" sender:self];
        }
    }
}

- (void)removeFriend
{
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Removing a friend, REALLY??" message:@"Are you sure you wanna remove your dear friend?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NOOOOO", nil];
    [alert setTag:1];
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView tag] == 1 && buttonIndex == 0)
    {
        [[APFriendStorage sharedStorage] removeFriend:_currentFriend];
        [self.navigationController popToViewController: [self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    }
}
- (IBAction)takePic:(id)sender
{
    if([imagePickerPopover isPopoverVisible]) {
        [imagePickerPopover dismissPopoverAnimated:YES];
        imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    

    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    CFUUIDRef newUniqueID = CFUUIDCreate (kCFAllocatorDefault);
    CFStringRef newUniqueIDString =
    CFUUIDCreateString (kCFAllocatorDefault, newUniqueID);
    
    NSString *key = (__bridge NSString *)newUniqueIDString;
    aNewImageKey = key;
    aNewImage = image;

    
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        thereIsANewImage = YES;
        [_image setImage:aNewImage];
    }];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.tableView setFrame:CGRectMake(0,0,340,570)];
    [[self tableView] reloadData];
}
@end
