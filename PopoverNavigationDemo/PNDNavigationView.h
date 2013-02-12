//
//  PNDNavigationView.h
//  PopoverNavigationDemo
//
//  Created by Tim Ekl on 2/12/13.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PNDContentView;

@interface PNDNavigationView : NSView

@property (nonatomic, strong) PNDContentView *currentView;
@property (nonatomic, weak) NSPopover *popover;

- (void)pushNewView;

@end
