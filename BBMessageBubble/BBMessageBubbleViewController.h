//
//  BBMessageBubbleViewController.h
//  BBMessageBubble
//
//  Created by Ralph Harrer on 22.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBMessageBubbleViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, assign) BOOL remove;
@property (nonatomic, assign) BOOL useCoordinates;
@property (nonatomic, retain) IBOutlet UITextField* textField;
@property (nonatomic, retain) IBOutlet UITextField* xValue;
@property (nonatomic, retain) IBOutlet UITextField* yValue;
@property (nonatomic, assign) CGFloat time;

- (IBAction)showBubbleWithText:(id)sender;
- (IBAction)showBubbleWithSpinner:(id)sender;
- (IBAction)showBubbleWithSpinnerAndText:(id)sender;
- (IBAction)showBubbleWithImageAndText:(id)sender;
- (IBAction)removeBubbleViews:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)coordSwitchChanged:(id)sender;

@end
