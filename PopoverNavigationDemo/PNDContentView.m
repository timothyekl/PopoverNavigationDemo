//
//  PNDContentView.m
//  PopoverNavigationDemo
//
//  Created by Tim Ekl on 2/12/13.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import "PNDContentView.h"

#import "NSColor+PNDExtensions.h"

@interface PNDContentView ()

@property (nonatomic, assign) NSSize size;

@property (nonatomic, strong) NSButton *nextButton;

@end

@implementation PNDContentView

+ (PNDContentView *)randomView;
{
    PNDContentView *view = [[PNDContentView alloc] initWithFrame:NSMakeRect(0, 0, 200, 100 + arc4random_uniform(300))];
    view.color = [NSColor randomColor];
    return view;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.size = frame.size;
        
        self.nextButton = [[NSButton alloc] init];
        self.nextButton.translatesAutoresizingMaskIntoConstraints = NO;
        self.nextButton.title = @"Next";
        self.nextButton.bezelStyle = NSRoundedBezelStyle;
        [self addSubview:self.nextButton];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.nextButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-|" options:0 metrics:nil views:@{@"button":self.nextButton}]];
    }
    
    return self;
}

- (NSSize)intrinsicContentSize;
{
    return self.size;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    [self.color set];
    NSRectFill([self bounds]);
}

@end
