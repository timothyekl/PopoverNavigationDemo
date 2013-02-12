//
//  PNDContentView.h
//  PopoverNavigationDemo
//
//  Created by Tim Ekl on 2/12/13.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define CONTENT_WIDTH 200.0f

@interface PNDContentView : NSView

@property (nonatomic, readonly) NSSize size;

@property (nonatomic, copy) NSColor *color;

+ (PNDContentView *)randomView;

@end
