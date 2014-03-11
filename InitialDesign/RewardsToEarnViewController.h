//
//  RewardsToEarnViewController.h
//  initializeialDesign
//
//  Created by Neil Gebhard and Sean Walsh on 1/17/14.
//  Copyright (c) 2014 Neil Gebhard and Sean Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteBooks.h"

@interface RewardsToEarnViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *reward1Txt;
@property (weak, nonatomic) IBOutlet UITextField *reward2Txt;
@property (weak, nonatomic) IBOutlet UITextField *reward3Txt;
@property (weak, nonatomic) IBOutlet UITextField *reward4Txt;
@property (weak, nonatomic) IBOutlet UITextField *reward5Txt;
@property (weak, nonatomic) IBOutlet UITextField *reward6Txt;
@property (weak, nonatomic) IBOutlet UITextField *reward7Txt;
@property (weak, nonatomic) IBOutlet UITextField *reward8Txt;
@property (weak, nonatomic) IBOutlet UIButton *saveAndContinue;
@property (strong, nonatomic) NoteBooks *notebook;
//content view embedded into scrollview
@property (strong, nonatomic) IBOutlet UIView *contentView;
//scrollview
@property (strong, nonatomic) IBOutlet UIScrollView *nbScrollView;

- (IBAction) textfieldChecker: (id)sender;
- (IBAction)saveAndContinueClick:(id)sender;
- (IBAction)closeButton:(id)sender;
- (IBAction)createTextField;
- (IBAction)keyboardAdapter: (UITextField*)textfieldName;


- (IBAction)infoClick:(id)sender;

@end
