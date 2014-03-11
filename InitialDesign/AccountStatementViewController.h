//
//  AccountStatementViewController.h
//  InitialDesign
//
//  Created by Neil Gebhard on 2/15/14.
//  Copyright (c) 2014 Azadi Sean Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountStatementViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *goBackToNotebooksBtn;
@property (strong, nonatomic) IBOutlet UILabel *tokenBalanceLabel;

@end
