//
//  PickBehaviorDateToLoadViewController.h
//  InitialDesign
//
//  Created by Azadi on 2/13/14.
//  Copyright (c) 2014 Azadi Sean Walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePickerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)doneClicked:(id)sender;

@property (weak, nonatomic) UIViewController *parent;

@end
