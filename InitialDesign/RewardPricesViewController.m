//
//  RewardPricesViewController.m
//  initializeialDesign
//
//  Created by Neil Gebhard on 1/17/14.
//  Copyright (c) 2014 Sean Walsh. All rights reserved.
//

#import "RewardPricesViewController.h"
#import "CompleteSetupViewController.h"

@interface RewardPricesViewController ()
{
    NSString *oldPrice1;
    NSString *oldPrice2;
    NSString *oldPrice3;
    NSString *oldPrice4;
    NSString *oldPrice5;
    NSString *oldPrice6;
    NSString *oldPrice7;
    NSString *oldPrice8;
    
    int textFieldNumber;
    int rectPosX;
    int rectPosY;
    NSMutableArray *oldrewardsArray;
}
@end

@implementation RewardPricesViewController

BOOL hasSavedRewardPrices = NO;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initializeialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    OutlineDBFunction *function = [[OutlineDBFunction alloc] init];
    oldrewardsArray = [function getRewards];
    
    if ([[_notebook getRewards] count] > 0) {
        if ([[_notebook getRewards][0][@"price"] length] > 0) {
            hasSavedRewardPrices = YES;
        }
        rectPosY = 40;
        [self LoadRewardList2];
    }
    else
    {
        rectPosY = 20;
        for (UITextField *field in _contentView.subviews)
        {
            if ([field isKindOfClass:[UITextField class]])
            {
                textFieldNumber++;
                rectPosY = rectPosY + 40;
            }
        }
        
    }
    // load labels and text boxes based on rewards to earn
    // hide labels and text boxes if unneeded
    if (_reward1.length == 0) {
        _reward1Lbl.hidden = YES;
        _price1Txt.hidden = YES;
    } else {
        _reward1Lbl.text = _reward1;
    }
    
    if (_reward2.length == 0) {
        _reward2Lbl.hidden = YES;
        _price2Txt.hidden = YES;
    } else {
        _reward2Lbl.text = _reward2;
    }
    
    if (_reward3.length == 0) {
        _reward3Lbl.hidden = YES;
        _price3Txt.hidden = YES;
    } else {
        _reward3Lbl.text = _reward3;
    }
    
    if (_reward4.length == 0) {
        _reward4Lbl.hidden = YES;
        _price4Txt.hidden = YES;
    } else {
        _reward4Lbl.text = _reward4;
    }
    
    if (_reward5.length == 0) {
        _reward5Lbl.hidden = YES;
        _price5Txt.hidden = YES;
    } else {
        _reward5Lbl.text = _reward5;
    }
    
    if (_reward6.length == 0) {
        _reward6Lbl.hidden = YES;
        _price6Txt.hidden = YES;
    } else {
        _reward6Lbl.text = _reward6;
    }
    
    if (_reward7.length == 0) {
        _reward7Lbl.hidden = YES;
        _price7Txt.hidden = YES;
    } else {
        _reward7Lbl.text = _reward7;
    }
    
    if (_reward8.length == 0) {
        _reward8Lbl.hidden = YES;
        _price8Txt.hidden = YES;
    } else {
        _reward8Lbl.text = _reward8;
    }


    /*
    if ([[_notebook getRewards] count] > 0) {
        if ([[_notebook getRewards][0][@"price"] length] > 0) {
            [self LoadRewardPrice];
            hasSavedRewardPrices = YES;
        }
    }
     */
    
    //Gesture recogizer to hide keyboard
    UITapGestureRecognizer *tapScroll = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(keyboardHide)];
    tapScroll.cancelsTouchesInView = NO;
    [_nbScrollView addGestureRecognizer: tapScroll];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

-(void) fadeTextIn: (UITextField *)textFieldName withLabel:(UILabel *)labelName
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 1];
    [textFieldName setAlpha:1];
    [labelName setAlpha:1];
    [UIView commitAnimations];
}

-(void) fadeTextOut: (UITextField *)textFieldName withLabel:(UILabel *)labelName
{
    [UITextField beginAnimations:nil context:NULL];
    [UITextField setAnimationDuration: .5];
    [textFieldName setAlpha:0];
    [labelName setAlpha:0];
    [UITextField commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)keyboardAdapter: (UITextField*)textfieldName
{
    
    if ([[UIScreen mainScreen] bounds].size.height == 568 && [textfieldName isFirstResponder])
    {
        [_nbScrollView setContentOffset:CGPointMake(0, ((textfieldName.frame.origin.y) - 200)) animated: YES];

    }
    if([[UIScreen mainScreen] bounds].size.height <= 480 && [textfieldName isFirstResponder])
    {
        // add stuff for iphone 3.5in or iphone great than 4in
    }
}

// makes the screen return to its normal position after the keyboard has retracted
- (void)keyboardDidHide:(NSNotification *)notification
{
    
    if ([[UIScreen mainScreen] bounds].size.height == 568)
    {
        [_nbScrollView setContentOffset:CGPointMake(0, 20) animated: YES];

    }
    else {
        // add stuff for iphone 3.5in or iphone great than 4in
    }
}

// hide the keyboard when user taps outside of keyboard
- (void) keyboardHide
{
    [self.view endEditing:YES];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.nbScrollView layoutIfNeeded];
    self.nbScrollView.contentSize = self.contentView.bounds.size;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTextFieldWithText: (NSString *) textToAdd: (NSString *)withLabel
{
    rectPosY = rectPosY + 40;
    [self createTextField2WithText: rectPosY: textToAdd: withLabel];
}

-(void)createTextField2WithText: (int)withYPos: (NSString *)andTextToAdd: (NSString *)withLabel
{
    //create label
    CGRect labelrect = CGRectMake(20, (withYPos), 125, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:labelrect];
    label.text = withLabel;
    label.textColor = [UIColor whiteColor];
    [_contentView addSubview:label];
    
    textFieldNumber++;
    CGRect rect = CGRectMake(200, (withYPos), 90, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    //textField = [[UITextField alloc] initWithFrame:rect];
    textField.tag = textFieldNumber;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = [UIColor blackColor];
    textField.backgroundColor = [UIColor whiteColor];
    textField.font = [UIFont systemFontOfSize:14.0];
    textField.font = [UIFont fontWithName:@"Helvetica Neue" size: 14.0 ];
    textField.placeholder = @"Enter Price";
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.delegate = self;
    [textField addTarget:self action: @selector(keyboardAdapter:) forControlEvents:UIControlEventEditingDidBegin];
    
    _nbScrollView.contentSize = CGSizeMake(320, rectPosY + 100);
    _contentView.frame = CGRectMake(0, 0, 320, rectPosY + 150);
    [textField setAlpha:0];
    [_contentView addSubview:textField];
    [self fadeTextIn:textField withLabel:nil];
    textField.text = andTextToAdd;
    
}

- (void)saveAllTextFields
{
    NSMutableArray *txtArray = [[NSMutableArray alloc] init];
    
    for (UITextField *field in _contentView.subviews)
    {
        if ([field isKindOfClass:[UITextField class]] && field.text.length > 0)
        {
            [txtArray addObject: field.text];
            NSLog(@"saved price");
        }
    }
    OutlineDBFunction *function = [[OutlineDBFunction alloc] init];
    oldrewardsArray = [function getRewards];
    NSEnumerator *oldRewards = [oldrewardsArray objectEnumerator];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (id textField in txtArray) {
        
        NSString *oldname = [NSString stringWithString:[oldRewards nextObject][@"reward_name"]];
        _notebook = [_notebook updateRewardPriceWithName:oldname toNewPrice:textField fromNotebook:_notebook];
      
    }
    hasSavedRewardPrices = YES;
    oldrewardsArray = array;
}

- (void)LoadRewardList2
{
    NSMutableArray *rewardList = [[NSMutableArray alloc] init];
    rewardList = [_notebook getRewards];
    
    for (id obj in rewardList)
    {
        [self createTextFieldWithText:obj[@"price"]: obj[@"reward_name"]];
    }
}


// Load the values from the DB to be displayed upon reviewing a notebook.
- (void)LoadRewardPrice
{
   /* NSMutableArray *rewardList = [[NSMutableArray alloc]init];
    rewardList = [_notebook getRewards];
    _price2Txt.text = _price3Txt.text = _price4Txt.text = _price8Txt.text = @"";
    _price5Txt.text = _price6Txt.text = _price7Txt.text = @"";
    if ([rewardList[0][@"price"] length] > 0) oldPrice1 = _price1Txt.text = rewardList[0][@"price"];
    if ([rewardList count] > 1) oldPrice2 = _price2Txt.text = rewardList[1][@"price"];
    if ([rewardList count] > 2) oldPrice3 = _price3Txt.text = rewardList[2][@"price"];
    if ([rewardList count] > 3) oldPrice4 = _price4Txt.text = rewardList[3][@"price"];
    if ([rewardList count] > 4) oldPrice5 = _price5Txt.text = rewardList[4][@"price"];
    if ([rewardList count] > 5) oldPrice6 = _price6Txt.text = rewardList[5][@"price"];
    if ([rewardList count] > 6) oldPrice7 = _price7Txt.text = rewardList[6][@"price"];
    if ([rewardList count] > 7) oldPrice8 = _price8Txt.text = rewardList[7][@"price"]; */
}

- (IBAction)closeButton:(id)sender {
    
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)saveAndContinueClick:(id)sender {
    
    /*
    if ([oldPrice1 isEqualToString:_price1Txt.text] == FALSE && ([oldPrice1 length] != 0 || [_price1Txt.text length] != 0)) {
        [_notebook updateRewardPriceWithName:_reward1 toNewPrice:_price1Txt.text fromNotebook:_notebook];
    }
    if ([oldPrice2 isEqualToString:_price2Txt.text] == FALSE && ([oldPrice2 length] != 0 || [_price2Txt.text length] != 0)){
        [_notebook updateRewardPriceWithName:_reward2 toNewPrice:_price2Txt.text fromNotebook:_notebook];
    }
    if ([oldPrice3 isEqualToString:_price3Txt.text] == FALSE && ([oldPrice3 length] != 0 || [_price3Txt.text length] != 0)){
        [_notebook updateRewardPriceWithName:_reward3 toNewPrice:_price3Txt.text fromNotebook:_notebook];
    }
    if ([oldPrice4 isEqualToString:_price4Txt.text] == FALSE && ([oldPrice4 length] != 0 || [_price4Txt.text length] != 0)){
        [_notebook updateRewardPriceWithName:_reward4 toNewPrice:_price4Txt.text fromNotebook:_notebook];
    }
    if ([oldPrice5 isEqualToString:_price5Txt.text] == FALSE && ([oldPrice5 length] != 0 || [_price5Txt.text length] != 0)) {
        [_notebook updateRewardPriceWithName:_reward5 toNewPrice:_price5Txt.text fromNotebook:_notebook];
    }
    if ([oldPrice6 isEqualToString:_price6Txt.text] == FALSE && ([oldPrice6 length] != 0 || [_price6Txt.text length] != 0)){
        [_notebook updateRewardPriceWithName:_reward6 toNewPrice:_price6Txt.text fromNotebook:_notebook];
    }
    if ([oldPrice7 isEqualToString:_price7Txt.text] == FALSE && ([oldPrice7 length] != 0 || [_price7Txt.text length] != 0)){
        [_notebook updateRewardPriceWithName:_reward7 toNewPrice:_price7Txt.text fromNotebook:_notebook];
    }
    if ([oldPrice8 isEqualToString:_price8Txt.text] == FALSE && ([oldPrice8 length] != 0 || [_price8Txt.text length] != 0)){
        [_notebook updateRewardPriceWithName:_reward8 toNewPrice:_price8Txt.text fromNotebook:_notebook];
    }
    NSLog(@"updated prices");
    
    if (_price2Txt.text.length > 0) {
        oldPrice1 = [NSString stringWithFormat:@"%@", _price1Txt.text];
    }
    if (_price2Txt.text.length > 0) {
        oldPrice2 = [NSString stringWithFormat:@"%@", _price2Txt.text];
    }
    if (_price3Txt.text.length > 0) {
        oldPrice3 = [NSString stringWithFormat:@"%@", _price3Txt.text];
    }
    if (_price4Txt.text.length > 0) {
        oldPrice4 = [NSString stringWithFormat:@"%@", _price4Txt.text];
    }
    if (_price5Txt.text.length > 0) {
        oldPrice5 = [NSString stringWithFormat:@"%@", _price5Txt.text];
    }
    if (_price6Txt.text.length > 0) {
        oldPrice6 = [NSString stringWithFormat:@"%@", _price6Txt.text];
    }
    if (_price7Txt.text.length > 0) {
        oldPrice7 = [NSString stringWithFormat:@"%@", _price7Txt.text];
    }
    if (_price8Txt.text.length > 0) {
        oldPrice8 = [NSString stringWithFormat:@"%@", _price8Txt.text];
    }
     */
    
    //[self saveAllTextFields];
    [self shouldPerformSegueWithIdentifier:@"saveRewardPricesGoToCompleteNotebook" sender:self];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    int textFieldNum = 0;
    int textFieldNumCheck = 0;
    // NOTE: Will need updated when we create next screen.
    if ([identifier isEqualToString:@"saveRewardPricesGoToCompleteNotebook"])
    {
        
        for (UITextField *field in _contentView.subviews)
        {
            field.layer.borderColor = [[UIColor clearColor]CGColor];
            
            if ([field isMemberOfClass:[UITextField class]] && field.text.length > 0 && field.tag >= 1)
            {
                textFieldNum = textFieldNum + 1;
                textFieldNumCheck++;
                
            }
            
            if ([field isMemberOfClass:[UITextField class]] && field.text.length == 0 && field.tag >= 1)
            {
                field.layer.borderColor = [[UIColor redColor]CGColor];
                field.layer.borderWidth = 1.0f;
                textFieldNumCheck++;
                
                NSLog(@"NO");
                
            }
            
        }
        
        if (textFieldNum == textFieldNumCheck)
        {
            [self saveAllTextFields];
            NSLog(@"YES");
            
            return YES;
        }
        else
        {
            return NO;
        }
        
    }
    return NO;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // add code to pass data to another view controller during a segue    
    if ([[segue identifier] isEqualToString:@"saveRewardPricesGoToCompleteNotebook"])
    {
        CompleteSetupViewController *controller = (CompleteSetupViewController*)segue.destinationViewController;
        controller.notebook = _notebook;
    }
}
@end
