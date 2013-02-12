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

@property (nonatomic, strong) NSLayoutConstraint *currentViewTopConstraint;
@property (nonatomic, strong) NSLayoutConstraint *currentViewLeadingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *currentViewTrailingConstraint;
@property (nonatomic, strong) NSLayoutConstraint *currentViewBottomConstraint;

@end

@implementation PNDNavigationView

- (BOOL)isFlipped;
{
    return YES;
}

- (void)setCurrentView:(PNDContentView *)view;
{
    [self removeConstraints:self.currentViewConstraints];
    [self _tearDownCurrentConstraints];
    
    [self.currentView removeFromSuperview];
    _currentView = view;
    [self addSubview:self.currentView];
    
    [self _setUpCurrentConstraints];
    [self addConstraints:self.currentViewConstraints];
}

- (void)pushNewView;
{
    PNDContentView *nextView = [PNDContentView randomView];
    
    [self addSubview:nextView];
    
    // put views in the right place to do animation
    NSLayoutConstraint *nextViewTopSpaceConstraint = [NSLayoutConstraint constraintWithItem:nextView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    NSLayoutConstraint *nextViewEdgeConstraint = [NSLayoutConstraint constraintWithItem:nextView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
    [self addConstraints:@[ nextViewEdgeConstraint, nextViewTopSpaceConstraint ]];
    
    NSLayoutConstraint *nextViewWidthConstraint = [NSLayoutConstraint constraintWithItem:nextView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:CONTENT_WIDTH];
    [nextView addConstraint:nextViewWidthConstraint];
    
    NSLayoutConstraint *currentViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.currentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0f constant:CONTENT_WIDTH];
    [self.currentView addConstraint:currentViewWidthConstraint];
    
    // immediate layout so the next view gets the right frame
    [self layoutSubtreeIfNeeded];
    
    // move the next view into place
    [self removeConstraint:nextViewEdgeConstraint];
    nextViewEdgeConstraint = [NSLayoutConstraint constraintWithItem:nextView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
    [self addConstraint:nextViewEdgeConstraint];
    
    // detach and move the current view
    [self removeConstraint:self.currentViewBottomConstraint];
    [self removeConstraint:self.currentViewLeadingConstraint];
    [self removeConstraint:self.currentViewTrailingConstraint];
    NSLayoutConstraint *currentViewEdgeConstraint = [NSLayoutConstraint constraintWithItem:self.currentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
    [self addConstraint:currentViewEdgeConstraint];
    
    // animate layout
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 2.0;
        context.allowsImplicitAnimation = YES;
        [self layoutSubtreeIfNeeded];
    } completionHandler:^{
        // fix all the constraints
        [self removeConstraint:self.currentViewTopConstraint];
        [self _tearDownCurrentConstraints];
        
        [self.currentView removeConstraint:currentViewWidthConstraint];
        [nextView removeConstraint:nextViewWidthConstraint];
        [self removeConstraints:@[ currentViewEdgeConstraint, nextViewTopSpaceConstraint, nextViewEdgeConstraint ]];
        
        self.currentView = nextView;
    }];
    
    self.popover.contentSize = nextView.size;
}

- (NSArray *)currentViewConstraints;
{
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:4];
    
    if (self.currentViewTopConstraint)
        [result addObject:self.currentViewTopConstraint];
    if (self.currentViewLeadingConstraint)
        [result addObject:self.currentViewLeadingConstraint];
    if (self.currentViewTrailingConstraint)
        [result addObject:self.currentViewTrailingConstraint];
    if (self.currentViewBottomConstraint)
        [result addObject:self.currentViewBottomConstraint];
    
    return result;
}

- (void)_setUpCurrentConstraints;
{
    self.currentViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.currentView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f];
    self.currentViewLeadingConstraint = [NSLayoutConstraint constraintWithItem:self.currentView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0.0f];
    self.currentViewTrailingConstraint = [NSLayoutConstraint constraintWithItem:self.currentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
    self.currentViewBottomConstraint = [NSLayoutConstraint constraintWithItem:self.currentView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f];
}

- (void)_tearDownCurrentConstraints;
{
    self.currentViewTopConstraint = nil;
    self.currentViewLeadingConstraint = nil;
    self.currentViewTrailingConstraint = nil;
    self.currentViewBottomConstraint = nil;
}

@end
