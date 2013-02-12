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

@end

@implementation PNDNavigationViewController

- (void)loadView;
{
    PNDNavigationView *navigationView = [[PNDNavigationView alloc] init];
    navigationView.currentView = [PNDContentView randomView];
    [self setView:navigationView];
}

@end
