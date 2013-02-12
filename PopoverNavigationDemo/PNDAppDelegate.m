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
    popover.animates = YES;
    popover.contentViewController = [[PNDNavigationViewController alloc] initWithPopover:popover];
    [popover showRelativeToRect:NSZeroRect ofView:sender preferredEdge:NSMaxYEdge];
}

@end
