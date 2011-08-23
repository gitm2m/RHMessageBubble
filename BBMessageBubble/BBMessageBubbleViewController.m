//
//  BBMessageBubbleViewController.m
//  BBMessageBubble
//
//  Created by Ralph Harrer on 22.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BBMessageBubbleViewController.h"
#import "RHMessageBubble.h"

#define RH_MESSAGE_BUBBLE_TIME 1.0f
#define RH_TEST_IMAGE @"Smile"

@implementation BBMessageBubbleViewController

@synthesize remove;
@synthesize textField;
@synthesize time;
@synthesize yValue;
@synthesize xValue;
@synthesize useCoordinates;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
	self.remove = YES;
	self.time = 2.0f;
	self.useCoordinates = NO;
	self.textField.delegate = self;
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)showBubbleWithText:(id)sender
{
	if (self.useCoordinates) {
		
		NSInteger x = [self.xValue.text integerValue];
		NSInteger y = [self.yValue.text integerValue];
		
		[RHMessageBubble bubbleWithString:self.textField.text 
								   toView:self.view 
							   forSeconds:self.time 
							   onPosition:CGPointMake(x, y)];
	} else {
		[RHMessageBubble bubbleWithString:self.textField.text 
								   toView:self.view 
							   forSeconds:self.time];
	}
}

- (IBAction)showBubbleWithSpinner:(id)sender
{
	if (self.useCoordinates) {
		NSInteger x = [self.xValue.text integerValue];
		NSInteger y = [self.yValue.text integerValue];
		
		[RHMessageBubble bubbleWithSpinnerToView:self.view 
									  forSeconds:self.time 
									  onPosition:CGPointMake(x, y)];
	} else {
		[RHMessageBubble bubbleWithSpinnerToView:self.view forSeconds:self.time];
	}
}

- (IBAction)showBubbleWithSpinnerAndText:(id)sender
{
	if (self.useCoordinates) {
		NSInteger x = [self.xValue.text integerValue];
		NSInteger y = [self.yValue.text integerValue];
		
		[RHMessageBubble bubbleWithSpinnerAndString:self.textField.text toView:self.view forSeconds:self.time onPosition:CGPointMake(x,y)];
	} else {
		[RHMessageBubble bubbleWithSpinnerAndString:self.textField.text toView:self.view forSeconds:self.time];
	}
	
}

- (IBAction)showBubbleWithImageAndText:(id)sender
{
	if (self.useCoordinates) {
		NSInteger x = [self.xValue.text integerValue];
		NSInteger y = [self.yValue.text integerValue];
		
		[RHMessageBubble bubbleWithString:self.textField.text andImageNamed:RH_TEST_IMAGE ToView:self.view forSeconds:self.time onPosition:CGPointMake(x, y)];
	} else {
		[RHMessageBubble bubbleWithString:self.textField.text andImageNamed:RH_TEST_IMAGE ToView:self.view forSeconds:self.time];
	}
}

- (IBAction)removeBubbleViews:(id)sender
{
	[RHMessageBubble removeBubbleFromView:self.view];
}

- (IBAction)switchChanged:(id)sender
{
	UISwitch* switchButton = (UISwitch*)sender;
	self.remove = switchButton.selected;
	
	if (self.remove) {
		self.time = RH_MESSAGE_BUBBLE_TIME;
	} else {
		self.time = -RH_MESSAGE_BUBBLE_TIME;
	}
	
	[RHMessageBubble removeBubbleFromView:self.view];
}

- (IBAction)coordSwitchChanged:(id)sender {
	UISwitch* switchButton = (UISwitch*)sender;
	self.useCoordinates = switchButton.on;
	self.xValue.enabled = self.yValue.enabled = switchButton.on;
	
	[RHMessageBubble removeBubbleFromView:self.view];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textFieldSource
{
	[textFieldSource resignFirstResponder];
	return YES;
}

@end
