//
//  ThingsToDoInsteadViewControllerTutorials.m
//  initializeialDesign
//
//  Created by David Wiza on 1/25/14.
//  Copyright (c) 2014 Azadi Sean Walsh. All rights reserved.
//

#import "ThingsToDoInsteadViewControllerTutorials.h"

@interface ThingsToDoInsteadViewControllerTutorials ()

@end

@implementation ThingsToDoInsteadViewControllerTutorials

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
	// Do any additional setup after loading the view.
    [tutorials showTutorialOnControl:self.behavior1Txt withID:TUT_BEHAVIORS_INSTEAD inView:self.contentView withOrientation:POINTING_UP withCallback:NULL fromSender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
