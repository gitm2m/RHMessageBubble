//
//  BBMessageBubbleAppDelegate.h
//  BBMessageBubble
//
//  Created by Ralph Harrer on 22.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BBMessageBubbleViewController;

@interface BBMessageBubbleAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BBMessageBubbleViewController *viewController;

@end
