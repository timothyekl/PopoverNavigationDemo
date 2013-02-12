//
//  PNDNavigationViewController.m
//  PopoverNavigationDemo
//
//  Created by Tim Ekl on 2/12/13.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import "PNDNavigationViewController.h"
#import "PNDNavigationView.h"
#import "PNDContentView.h"

@interface PNDNavigationViewController ()

@property (nonatomic, weak) NSPopover *popover;

@end

@implementation PNDNavigationViewController

- (id)initWithPopover:(NSPopover *)popover;
{
    if (!(self = [super init]))
        return nil;
    
    self.popover = popover;
    
    return self;
}

- (void)loadView;
{
    PNDNavigationView *navigationView = [[PNDNavigationView alloc] init];
    navigationView.wantsLayer = YES;
    navigationView.currentView = [PNDContentView randomView];
    navigationView.popover = self.popover;
    [self setView:navigationView];
}

@end
