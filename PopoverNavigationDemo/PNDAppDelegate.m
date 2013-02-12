//
//  PNDAppDelegate.m
//  PopoverNavigationDemo
//
//  Created by Tim Ekl on 2/12/13.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import "PNDAppDelegate.h"
#import "PNDNavigationViewController.h"

@implementation PNDAppDelegate

- (IBAction)showPopover:(id)sender;
{
    NSPopover *popover = [[NSPopover alloc] init];
    popover.contentViewController = [[PNDNavigationViewController alloc] init];
    [popover showRelativeToRect:NSZeroRect ofView:sender preferredEdge:NSMaxYEdge];
}

@end
