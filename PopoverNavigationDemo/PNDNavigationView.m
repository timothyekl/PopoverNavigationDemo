//
//  PNDNavigationView.m
//  PopoverNavigationDemo
//
//  Created by Tim Ekl on 2/12/13.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import "PNDNavigationView.h"
#import "PNDContentView.h"

@interface PNDNavigationView ()

@property (nonatomic, strong) NSArray *contentViewConstraints;

@end

@implementation PNDNavigationView

- (void)setCurrentView:(PNDContentView *)view;
{
    if (self.contentViewConstraints)
        [self removeConstraints:self.contentViewConstraints];
    self.contentViewConstraints = nil;
    
    [self.currentView removeFromSuperview];
    _currentView = view;
    [self addSubview:self.currentView];
    
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    self.contentViewConstraints = constraints;
    [self addConstraints:self.contentViewConstraints];
}

@end
