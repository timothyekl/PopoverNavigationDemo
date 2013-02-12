//
//  NSColor+PNDExtensions.m
//  PopoverNavigationDemo
//
//  Created by Tim Ekl on 2/12/13.
//  Copyright (c) 2013 The Omni Group. All rights reserved.
//

#import "NSColor+PNDExtensions.h"

@implementation NSColor (PNDExtensions)

+ (NSColor *)randomColor;
{
    uint32_t rand = arc4random();
    
    CGFloat r = (float)((rand >> 0) & 0xff) / 255.0f;
    CGFloat g = (float)((rand >> 8) & 0xff) / 255.0f;
    CGFloat b = (float)((rand >> 16) & 0xff) / 255.0f;
    
    return [NSColor colorWithCalibratedRed:r green:g blue:b alpha:1.0f];
}

@end
