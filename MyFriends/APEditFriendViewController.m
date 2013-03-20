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
    APEditStepTwoViewController *editStepTwoViewController;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"createStepTwoSeg"]) {
//        UITabBarController *tbc = [segue destinationViewController];
//        
//        APDetailInfoViewController *divc = [[tbc viewControllers] objectAtIndex:0];
//        APDetailStepTwoViewController *dsTwovc = [[tbc viewControllers] objectAtIndex:1];
//        APDetailStepThreeViewController *dsThreevc = [[tbc viewControllers] objectAtIndex:2];
//        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        APEditStepTwoViewController *esTwoVc = [segue destinationViewController];
        [esTwoVc setCurrentFriend:_currentFriend];
       }
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    {
        //        [[[self tabBarController]navigationItem] setTitle:[NSString stringWithFormat:@"%@:s thoghts",_currentFriend.firstName]];
        [[[self tabBarController]navigationItem] setTitle:@"EDIT STEP ONEEE"];
    _firstName.delegate = self;
    _lastName.delegate = self;
    _birtday.delegate = self;
    _address.delegate = self;
    _school.delegate = self;
    _email.delegate = self;
    _phoneNumber.delegate = self;
        
    thereIsANewImage = NO;
        
     
        
       _nextBtnLable.text = @"Next";
        //TODO: hide tabbar when creating new??????
        
    if (_editMode) {
        _firstName.text = _currentFriend.firstName;
        _lastName.text = _currentFriend.lastName;
        _birtday.text = _currentFriend.birthDay;
        _address.text = _currentFriend.address;
        _school.text = _currentFriend.school;
        _email.text = _currentFriend.email;
        _phoneNumber.text = [_currentFriend.phoneNumber stringValue];
        _image.image = [[APImageStorage defaultImageStore] imageForKey:_currentFriend.imageKey];
        _nextBtnLable.text = @"Save";

        
        UIBarButtonItem *removeItem = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                       target:self
                                       action:@selector(removeFriend:)];
        [[self navigationItem] setRightBarButtonItem:removeItem];
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)nextStep:(id)sender {
    
    if (_editMode) {
         _currentFriend.firstName = _firstName.text;
        _currentFriend.lastName =_lastName.text;
        _currentFriend.birthDay = _birtday.text;
        _currentFriend.address = _address.text;
        _currentFriend.school = _school.text;
        _currentFriend.email = _email.text;
    
        if (thereIsANewImage)
        {
             NSLog(@"finns NY BILD");
                NSString *oldKey = [_currentFriend imageKey];
                if (oldKey) {
                    NSString *oldKey = [_currentFriend imageKey];
                    [[APImageStorage defaultImageStore] deleteImageForKey:oldKey];
                }
                _currentFriend.imageKey = aNewImageKey;
                [[APImageStorage defaultImageStore] setImage:aNewImage
                                                      forKey:aNewImageKey];
        }
    } else {
        if (_firstName.text.length < 1) {
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"inget namn" message:@"Du måste ange din väns förnamn för att lägga till den som vän." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        } else {
        
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
                                                                  phonenumber:[NSNumber numberWithInt:[_phoneNumber.text intValue]]];
//            
//            _currentFriend.firstName = _firstName.text;
//            _currentFriend.lastName = _lastName.text;
//            _currentFriend.birthDay =_birtday.text;
//            _currentFriend.address =_address.text;
//            _currentFriend.email =_email.text;
//            _currentFriend.school =_school.text;
//            _currentFriend.phoneNumber = [NSNumber numberWithInt:[_phoneNumber.text intValue]];
        
        if (thereIsANewImage) {
            [_currentFriend setImageKey:aNewImageKey];

            //TODO: set image in step three
            [[APImageStorage defaultImageStore] setImage:aNewImage
                                                  forKey:aNewImageKey];
        }
//             [[self navigationController]popViewControllerAnimated:YES];
//            [[self navigationController] performSegueWithIdentifier:@"createStepTwoSeg" sender:self];
//            [[[self tabBarController]navigationController] performSegueWithIdentifier:@"createStepTwoSeg" sender:self];
//            [[self tabBarController] segueForUnwindingToViewController:editStepTwoViewController fromViewController:self identifier:@"createStepTwoSeg"];
            
            
            [[[[self tabBarController] viewControllers] objectAtIndex:1] setCurrentFriend:_currentFriend];
            [[self tabBarController] setSelectedIndex:1];
        }
    }
    

}

- (void)removeFriend
{
    NSLog(@"REMOVES FIREND");
[[APFriendStorage sharedStorage] removeFriend:_currentFriend];
[self.navigationController popToViewController:
 [self.navigationController.viewControllers objectAtIndex:1]
  animated:YES];
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
@end
