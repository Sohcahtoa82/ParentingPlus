//
//  RewardPricesViewController.h
//  initializeialDesign
//
//  Created by Neil Gebhard on 1/17/14.
//  Copyright (c) 2014 Sean Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteBooks.h"

@interface RewardPricesViewController : UIViewController

// text boxes
@property (weak, nonatomic) IBOutlet UITextField *price1Txt;
@property (weak, nonatomic) IBOutlet UITextField *price2Txt;
@property (weak, nonatomic) IBOutlet UITextField *price3Txt;
@property (weak, nonatomic) IBOutlet UITextField *price4Txt;
@property (weak, nonatomic) IBOutlet UITextField *price5Txt;
@property (weak, nonatomic) IBOutlet UITextField *price6Txt;
@property (weak, nonatomic) IBOutlet UITextField *price7Txt;
@property (weak, nonatomic) IBOutlet UITextField *price8Txt;

// buttons
@property (weak, nonatomic) IBOutlet UIButton *saveAndContinue;

// labels
@property (strong, nonatomic) IBOutlet UILabel *reward1Lbl;
@property (strong, nonatomic) IBOutlet UILabel *reward2Lbl;
@property (strong, nonatomic) IBOutlet UILabel *reward3Lbl;
@property (strong, nonatomic) IBOutlet UILabel *reward4Lbl;
@property (strong, nonatomic) IBOutlet UILabel *reward5Lbl;
@property (strong, nonatomic) IBOutlet UILabel *reward6Lbl;
@property (strong, nonatomic) IBOutlet UILabel *reward7Lbl;
@property (strong, nonatomic) IBOutlet UILabel *reward8Lbl;

// segue variables
@property (strong, nonatomic) NSString *reward1;
@property (strong, nonatomic) NSString *reward2;
@property (strong, nonatomic) NSString *reward3;
@property (strong, nonatomic) NSString *reward4;
@property (strong, nonatomic) NSString *reward5;
@property (strong, nonatomic) NSString *reward6;
@property (strong, nonatomic) NSString *reward7;
@property (strong, nonatomic) NSString *reward8;
@property (strong, nonatomic) NoteBooks *notebook;


@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *nbScrollView;

- (IBAction)closeButton:(id)sender;
- (IBAction)keyboardAdapter: (UITextField*)textfieldName;
- (IBAction)createTextField;
- (IBAction)saveAndContinueClick:(id)sender;
@end

