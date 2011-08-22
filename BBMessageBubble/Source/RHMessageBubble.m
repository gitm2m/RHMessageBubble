//
//  RHMessageBubble.m
//  BMWBoerseUniversal
//
//  Created by Ralph Harrer on 28.06.11.
//  Copyright 2011. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "RHMessageBubble.h"


//####################################################//
//################  RHMessageBubble  #################//
//####################################################//

@implementation RHMessageBubble

/*#### String ####*/

+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent
{
	[RHMessageBubble bubbleWithString:text toView:parent forSeconds:-1];
}

+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent onPosition:(CGPoint)position 
{
	[RHMessageBubble bubbleWithString:text toView:parent forSeconds:-1 onPosition:position];
}

+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithText:text];
	
	[RHMessageBubble addView:view centeredToParent:parent];
	
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithText:text];
	
	[RHMessageBubble addView:view toParent:parent onPosition:position];
	
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

/*#### Spinner ####*/

+ (void)bubbleWithSpinnerToView:(UIView*)parent
{
	[RHMessageBubble bubbleWithSpinnerToView:parent forSeconds:-1];
}

+ (void)bubbleWithSpinnerToView:(UIView*)parent onPosition:(CGPoint)position
{
	[RHMessageBubble bubbleWithSpinnerToView:parent forSeconds:-1 onPosition:position];
}

+ (void)bubbleWithSpinnerToView:(UIView*)parent forSeconds:(CGFloat)seconds
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithSpinner];
	
	[RHMessageBubble addView:view centeredToParent:parent];
	
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

+ (void)bubbleWithSpinnerToView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithSpinner];
	
	[RHMessageBubble addView:view toParent:parent onPosition:position];
	
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

/*#### Spinner & String ####*/

+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent
{
	[RHMessageBubble bubbleWithSpinnerAndString:text toView:parent forSeconds:-1];
}

+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent onPosition:(CGPoint)position
{
	[RHMessageBubble bubbleWithSpinnerAndString:text toView:parent forSeconds:-1 onPosition:position];
}

+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithSpinnerAndText:text];
	
	[RHMessageBubble addView:view centeredToParent:parent];
	
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithSpinnerAndText:text];
	
	[RHMessageBubble addView:view toParent:parent onPosition:position];
	
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

/*#### String & Image ####*/

+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent
{
	[RHMessageBubble bubbleWithString:text andImageNamed:imgName ToView:parent forSeconds:-1];
}

+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent onPosition:(CGPoint)position
{
	[RHMessageBubble bubbleWithString:text andImageNamed:imgName ToView:parent forSeconds:-1 onPosition:position];
}

+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent forSeconds:(CGFloat)seconds
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithText:text andImageNamed:imgName];
	[RHMessageBubble addView:view centeredToParent:parent];
		
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position
{
	[RHMessageBubble removeBubbleFromView:parent];
	
	RHBubbleView* view = [RHMessageBubble getViewWithText:text andImageNamed:imgName];
	[RHMessageBubble addView:view toParent:parent onPosition:position];
	
	if (seconds > 0) {
		[view showAndPerformSelector:@selector(hideAndRemove) target:view after:seconds];
	} else {
		[view show];
	}
}

+ (void)removeBubbleFromView:(UIView *)parent
{
	for (UIView* subview in [parent subviews]) {
		if (subview.tag == RH_MESSAGE_BUBBLE_TAG && [subview class] == [RHBubbleView class]) {
			[((RHBubbleView*)subview) hideAndRemove];
		}
	}
}



/*########################*/
/*#### Helper methods ####*/
/*########################*/

+ (RHBubbleView*)getViewWithSpinnerAndText:(NSString*)text
{
	CGSize maxSize = CGSizeMake(RH_MESSAGE_BUBBLE_SIDE_LENGTH, RH_MESSAGE_BUBBLE_SIDE_LENGTH);
	
	RHBubbleView* view = [[[RHBubbleView alloc] initWithFrame:CGRectMake(0, 0, maxSize.width, maxSize.height)] autorelease];
	view.backgroundColor = [UIColor clearColor];
	
	UILabel* label = [RHMessageBubble getLabelWithText:text];
	

	UIActivityIndicatorView* activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] autorelease];
	[activityIndicator startAnimating];

	[RHMessageBubble addBackground:view];
	[RHMessageBubble addTopView:activityIndicator andBottomView:label toView:view];
	
	return view;
}

+ (RHBubbleView*)getViewWithSpinner
{
	RHBubbleView* view = [[[RHBubbleView alloc] initWithFrame:CGRectMake(0, 0, RH_MESSAGE_BUBBLE_SIDE_LENGTH, RH_MESSAGE_BUBBLE_SIDE_LENGTH)] autorelease];
	view.backgroundColor = [UIColor clearColor];
	
	UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[view addSubview:activityIndicator];
	[activityIndicator startAnimating];
	[activityIndicator release];
	
	CGRect spinnerFrame = activityIndicator.frame;
	spinnerFrame.origin = CGPointMake(view.frame.size.width / 2 - 
									  activityIndicator.frame.size.width / 2, 
									  view.frame.size.height / 2 - 
									  activityIndicator.frame.size.height / 2);
	activityIndicator.frame = spinnerFrame;
	
	[RHMessageBubble addBackground:view];
	[view bringSubviewToFront:activityIndicator];
	
	return view;
}

+ (RHBubbleView*)getViewWithText:(NSString*)text
{
	CGSize maxSize = CGSizeMake(RH_MESSAGE_BUBBLE_SIDE_LENGTH, RH_MESSAGE_BUBBLE_SIDE_LENGTH);
	
	RHBubbleView* view = [[[RHBubbleView alloc] initWithFrame:CGRectMake(0, 0, maxSize.width, maxSize.height)] autorelease];
	view.backgroundColor = [UIColor clearColor];
	
	/* 
	 adding the text label to the bubble view: 
	 firstly calculating the number of lines for the given text
	 */
	UIFont* font = [UIFont boldSystemFontOfSize:17];
	CGSize size = [text sizeWithFont:font];
	NSInteger numLines = 1;
	
	if (size.width > (RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING)) {
		NSInteger maxWidth = RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING;
		CGFloat lines = (CGFloat)size.width / (CGFloat)maxWidth;
		NSInteger rounded = (NSInteger)lines;
		CGFloat over = lines - rounded;
		
		if (over > 0) 
			rounded++;
		numLines = rounded;
	}
	
	CGRect rect = CGRectMake(RH_MESSAGE_BUBBLE_PADDING, RH_MESSAGE_BUBBLE_PADDING, RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING, RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING);
	
	UILabel* label = [RHMessageBubble getLabelWithText:text];
	label.frame = rect;
	label.numberOfLines = numLines;
	label.textAlignment = UITextAlignmentCenter;
	label.textColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	
	[RHMessageBubble addView:label centeredToParent:view];
	[RHMessageBubble addBackground:view];
	[view bringSubviewToFront:label];
	
	return view;
}

+ (UILabel*)getLabelWithText:(NSString*)text
{
	/* 
	 adding the text label to the bubble view: 
	 firstly calculating the number of lines for the given text
	 */
	UIFont* font = [UIFont boldSystemFontOfSize:17];
	CGSize size = [text sizeWithFont:font];
	CGSize lineHeight = [@"b" sizeWithFont:font];
	NSInteger numLines = 1;
	
	if (size.width > (RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING)) {
		NSInteger maxWidth = RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING;
		CGFloat lines = (CGFloat)size.width / (CGFloat)maxWidth;
		NSInteger rounded = (NSInteger)lines;
		CGFloat over = lines - rounded;
		
		if (over > 0) 
			rounded++;
		numLines = rounded;
	}
	
	CGRect rect = CGRectMake(0, 0, RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING, numLines * lineHeight.height);
	
	UILabel* label = [[UILabel alloc] initWithFrame:rect];
	[label setText:text];
	label.font = font;
	label.numberOfLines = numLines;
	label.textAlignment = UITextAlignmentCenter;
	label.textColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	
	return [label autorelease];

}

+ (RHBubbleView*)getViewWithText:(NSString*)text andImageNamed:(NSString*)imageName
{
	UIImage* img = [UIImage imageNamed:imageName];
	
	if (img) {
		UIImageView* imgView = [[[UIImageView alloc] initWithImage:img] autorelease];
		[imgView setContentMode:UIViewContentModeCenter];
		
		CGRect imgRect = imgView.frame;
		
		if (imgRect.size.width > RH_MESSAGE_BUBBLE_IMAGE_MAX_WIDTH_HEIGHT) {
			imgRect.size.width = RH_MESSAGE_BUBBLE_IMAGE_MAX_WIDTH_HEIGHT;
		}
		
		if (imgRect.size.height > RH_MESSAGE_BUBBLE_IMAGE_MAX_WIDTH_HEIGHT) {
			imgRect.size.height = RH_MESSAGE_BUBBLE_IMAGE_MAX_WIDTH_HEIGHT;
		}
		
		CGPoint pos = CGPointMake(0, 0);
		imgRect.origin = pos;
		imgView.frame = imgRect;
		
		RHBubbleView* view = [[[RHBubbleView alloc] initWithFrame:CGRectMake(0, 0, RH_MESSAGE_BUBBLE_SIDE_LENGTH, RH_MESSAGE_BUBBLE_SIDE_LENGTH)] autorelease];
		view.backgroundColor = [UIColor clearColor];
		[RHMessageBubble addBackground:view];
		
		// adding label
		UILabel* label = [RHMessageBubble getLabelWithText:text];
	
		[RHMessageBubble addTopView:imgView andBottomView:label toView:view];
	
		[view bringSubviewToFront:imgView];
		[view bringSubviewToFront:label];
		
		return view;
	} else {
		return [RHMessageBubble getViewWithText:text];
	}
}

+ (void)addBackground:(UIView*)view
{
	// adding transparent background to the bubble view
	UIView* backgroundView = [[UIView alloc] initWithFrame:view.frame];
	backgroundView.backgroundColor = [UIColor blackColor];
	backgroundView.alpha = 0.7;
	backgroundView.layer.cornerRadius = RH_MESSAGE_BUBBLE_CORNER_RADIUS;
	[view addSubview:backgroundView];
	[backgroundView release];
}

+ (void)addTopView:(UIView*)topView andBottomView:(UIView*)bottomView toView:(UIView*)view
{
	UIView* container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING, 1)];
	container.backgroundColor = [UIColor clearColor];
	
	NSInteger paddingBetween = 10;
	
	CGRect rect = CGRectMake(RH_MESSAGE_BUBBLE_PADDING, 0, RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2 * RH_MESSAGE_BUBBLE_PADDING, topView.frame.size.height + bottomView.frame.size.height + paddingBetween);
	container.frame = rect;
	
	NSInteger topViewCenter = (RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2*RH_MESSAGE_BUBBLE_PADDING) / 2 - topView.frame.size.width / 2;
	
	topView.frame = CGRectMake(topViewCenter, 
							   0, 
							   topView.frame.size.width, 
							   topView.frame.size.height);
	
	NSInteger bottomViewCenter = (RH_MESSAGE_BUBBLE_SIDE_LENGTH - 2*RH_MESSAGE_BUBBLE_PADDING) / 2 - bottomView.frame.size.width / 2;
	
	bottomView.frame = CGRectMake(bottomViewCenter, 
								  topView.frame.size.height + paddingBetween, 
								  bottomView.frame.size.width, 
								  bottomView.frame.size.height);
	
	[container addSubview:topView];
	[container addSubview:bottomView];
	
	CGRect contRect = container.frame;
	
	contRect.origin.y = view.frame.size.height / 2 - container.frame.size.height / 2;
	
	if (bottomView.frame.size.height + topView.frame.size.height > RH_MESSAGE_BUBBLE_SIDE_LENGTH - RH_MESSAGE_BUBBLE_PADDING * 2) {
		contRect.size.height = RH_MESSAGE_BUBBLE_SIDE_LENGTH - RH_MESSAGE_BUBBLE_PADDING * 2;
	}
	
	container.frame = contRect;
	
	[view addSubview:container];
	
	[container release];
}

+ (void)addView:(UIView*)view centeredToParent:(UIView*)parent
{
	CGRect frameRect = view.frame;
	CGPoint loc = CGPointMake(parent.frame.size.width/2 - frameRect.size.width/2, 
							  parent.frame.size.height/2 - frameRect.size.height/2);
	[RHMessageBubble addView:view toParent:parent onPosition:loc];
}

+ (void)addView:(UIView*)view toParent:(UIView*)parent onPosition:(CGPoint)position
{
	CGRect frameRect = view.frame;
	frameRect.origin = position;
	
	view.frame = frameRect;
	[view setUserInteractionEnabled:NO];
	[parent addSubview:view];
	[parent bringSubviewToFront:view];
}

@end

//####################################################//
//##################  RHBubbleView  ##################//
//####################################################//

@implementation RHBubbleView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	
	if (self) {
		self.tag = RH_MESSAGE_BUBBLE_TAG;
		self.backgroundColor = [UIColor clearColor];
	}
	
	return self;
}

- (id)init
{
	self = [super initWithFrame:CGRectMake(0, 0, RH_MESSAGE_BUBBLE_SIDE_LENGTH, RH_MESSAGE_BUBBLE_SIDE_LENGTH)];
	
	if (self) {
		self.tag = RH_MESSAGE_BUBBLE_TAG;
		self.backgroundColor = [UIColor clearColor];
	}
	
	return self;
}

- (void)show
{
	self.alpha = 0.0;
	self.transform = CGAffineTransformMakeScale(3.0, 3.0);
	self.hidden = NO;
	
	[UIView animateWithDuration:0.3 animations:^{
		self.transform = CGAffineTransformIdentity;
		self.alpha = 1.0;
	}];
}

- (void)showAndPerformSelector:(SEL)action target:(id)target after:(CGFloat)seconds
{
	self.alpha = 0.0;
	self.transform = CGAffineTransformMakeScale(3.0, 3.0);
	self.hidden = NO;
	
	[UIView animateWithDuration:0.3 animations:^{
		self.transform = CGAffineTransformIdentity;
		self.alpha = 1.0;
	} completion:^(BOOL finished){
		if ([target respondsToSelector:action]) {
			[target performSelector:action withObject:target afterDelay:seconds];
		}
	}];
}

- (void)hideAndRemove
{
	[UIView animateWithDuration:0.3 animations:^{
		self.alpha = 0;
		self.transform = CGAffineTransformMakeScale(0.5, 0.5);
	} completion:^(BOOL finished) {
		[self removeFromSuperview];
	}];
}

- (void)dealloc
{
    [super dealloc];
}

@end