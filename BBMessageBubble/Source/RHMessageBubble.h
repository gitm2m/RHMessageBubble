//
//  BBMessageBubble.h
//  BMWBoerseUniversal
//
//  Created by Ralph Harrer on 28.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


#define RH_MESSAGE_BUBBLE_TAG 668
#define RH_MESSAGE_BUBBLE_PADDING 10
#define RH_MESSAGE_BUBBLE_SIDE_LENGTH 160
#define RH_MESSAGE_BUBBLE_CORNER_RADIUS 10
#define RH_MESSAGE_BUBBLE_IMAGE_MAX_WIDTH_HEIGHT 120

/**
 * this class should not be instantiated directly. it is used by BBMessageBubble.
 * @see BBMessageBubble
 */
@interface RHBubbleView : UIView {
}

/**
 * shows the view with an animation
 */
- (void)show;

/**
 * shows the view and performs a selector after a certain amount of time
 * @param action the selector that should be performed
 * @param target the target class that should perform the selector
 * @param seconds the time in seconds after which the selector will be performed
 */
- (void)showAndPerformSelector:(SEL)action target:(id)target after:(CGFloat)seconds;

/**
 * hides the view and removes it afterwards from the parent view
 */
- (void)hideAndRemove;

@end


/**
 * this class adds message bubbles to a view. these bubbles can stay as long as you want or 
 * just display themselfs for a certain amount of seconds
 */
@interface RHMessageBubble : NSObject

/**
 * adds a RHBubbleView containing only a text to a view
 * @param text the message that should be shown
 * @param parent the UIView* object where the bubble should be put to
 */
+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent;
+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent onPosition:(CGPoint)position;

/**
 * adds a temporary RHBubbleView containing only a text to a view
 * @param text the message that should be shown
 * @param parent the UIView* object where the bubble should be put to
 * @param seconds the time the bubble should be visible (in seconds)
 */
+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds;
+ (void)bubbleWithString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position;




/**
 * adds a RHBubbleView containing a UIActivityIndicator and a text to a view
 * @param text the message that should be shown
 * @param parent the UIView* object where the bubble should be put to
 */
+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent;
+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent onPosition:(CGPoint)position;
/**
 * adds a temporary RHBubbleView containing a UIActivityIndicator and a text to a view
 * @param text the message that should be shown
 * @param parent the UIView* object where the bubble should be put to
 * @param seconds the time the bubble should be visible (in seconds)
 */
+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds;
+ (void)bubbleWithSpinnerAndString:(NSString*)text toView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position;

+ (void)bubbleWithSpinnerToView:(UIView*)parent;
+ (void)bubbleWithSpinnerToView:(UIView*)parent onPosition:(CGPoint)position;

+ (void)bubbleWithSpinnerToView:(UIView*)parent forSeconds:(CGFloat)seconds;
+ (void)bubbleWithSpinnerToView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position;

+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent;
+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent onPosition:(CGPoint)position;

+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent forSeconds:(CGFloat)seconds;
+ (void)bubbleWithString:(NSString*)text andImageNamed:(NSString*)imgName ToView:(UIView*)parent forSeconds:(CGFloat)seconds onPosition:(CGPoint)position;
/**
 * removes all RHBubbleView objects from the given view
 * @param parent the view that should be cleared from RHBubbleView objects
 */
+ (void)removeBubbleFromView:(UIView*)parent;

/**
 * this method is private! it is only for internal purpose.
 * this method returns a ready configured RHBubbleView with a text and an optional spinner if not set to nil
 * @param text a thext message to be shown in the bubble
 * @param spinner if true a UIActivityIndicator will be added to the bubble above the text
 * @return a RHBubbleView object containing the message and a spinner if not set to nil
 */
+ (RHBubbleView*)getViewWithSpinnerAndText:(NSString*)text;

+ (RHBubbleView*)getViewWithSpinner;

+ (RHBubbleView*)getViewWithText:(NSString*)text;

+ (RHBubbleView*)getViewWithText:(NSString*)text andImageNamed:(NSString*)imageName;

+ (void)addBackground:(UIView*)view;

+ (void)addTopView:(UIView*)topView andBottomView:(UIView*)bottomView toView:(UIView*)view;

+ (UILabel*)getLabelWithText:(NSString*)text;

+ (void)addView:(UIView*)view centeredToParent:(UIView*)parent;

+ (void)addView:(UIView*)view toParent:(UIView*)parent onPosition:(CGPoint)position;
@end