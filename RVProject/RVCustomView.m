//
//  RVCustomView.m
//  RVProject
//
//  Created by Hitesh on 4/1/16.
//  Copyright © 2016 Hitesh. All rights reserved.
//
/**RVCustomView class is the subclass of NSView with the capability of customizing 
 the view and redraw thw contents as per user control provided in toolbar**/

#import "RVCustomView.h"
#import "AppDelegate.h"
#import "RVWindowController.h"
#import "RVConstant.h"

@implementation RVCustomView

@synthesize startingColor;
@synthesize endingColor;
@synthesize gradientAngle;
@synthesize borderSelection;
@synthesize colorWellColor;

//Enum used in Switch case to display the selected border.
typedef enum visibleViewEdge: NSInteger {
    all = 1,
    top,
    bottom,
    right,
    left,
    topOff,
    bottomOff,
    rightOff,
    leftOff
}visibleViewEdge;

- (void)awakeFromNib{
    [self setStartingColor:[NSColor redColor]];
    [self setEndingColor:[NSColor whiteColor]];
    [self setGradientAngle:kgradientAngle];
    self.borderSelection = all;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    CGRect bounds = self.bounds;
    [self setNeedsDisplay:YES];
    if (endingColor == nil || [startingColor isEqual:endingColor]) {
        [startingColor set];
        NSRectFill(dirtyRect);
    }
    else {
        NSGradient* aGradient = [[NSGradient alloc]
                                 initWithStartingColor:startingColor
                                 endingColor:endingColor];
        [aGradient drawInRect:bounds angle:gradientAngle];
    }
    [self drawViewContents:borderSelection];
    
}
- (CGContextRef) currentContext {
    return [NSGraphicsContext.currentContext graphicsPort];
}

- (void) drawViewContents:(NSInteger)visibleEdge{
    CGContextRef context = self.currentContext;
    CGFloat* components = (CGFloat*)CGColorGetComponents(self.colorWellColor.CGColor);
    if(!components){
        CGColorRef blackColor = [[NSColor greenColor] CGColor];
        components = (CGFloat*)CGColorGetComponents(blackColor);
    }
    CGFloat rc = components[0];
    CGFloat gc = components[1];
    CGFloat bc = components[2];
    
    CGFloat borderThickness = [[[[NSApplication sharedApplication] mainWindow] windowController] borderThicknessValue];
    if(borderThickness){
        CGContextSetLineWidth (context, borderThickness);
    }
    else{
        CGContextSetLineWidth (context, kdefaultBorderThickness);
    }
    
    switch (visibleEdge) {
        case all:// All the border of the view
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context, 0, 0);
            CGContextAddLineToPoint(context, 0, self.frame.size.height);
            CGContextStrokePath(context);
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context, 0, 0);
            CGContextAddLineToPoint(context, self.frame.size.width, 0);
            CGContextStrokePath(context);
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context, 0, self.frame.size.height);
            CGContextAddLineToPoint(context, self.frame.size.width,self.frame.size.height);
            CGContextStrokePath(context);
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context,self.frame.size.width,self.frame.size.height);
            CGContextAddLineToPoint(context,self.frame.size.width,0);
            CGContextStrokePath(context);
            break;
        case left:// Only left border of the view
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context, 0, 0);
            CGContextAddLineToPoint(context, 0, self.frame.size.height);
            CGContextStrokePath(context);
            break;
        case leftOff:
            break;
        case top: // Only top border of the view
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context, 0, self.frame.size.height);
            CGContextAddLineToPoint(context, self.frame.size.width,self.frame.size.height);
            CGContextStrokePath(context);
            break;
        case topOff:
            break;
        case right:// Only right border of the view
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context,self.frame.size.width,self.frame.size.height);
            CGContextAddLineToPoint(context,self.frame.size.width,0);
            CGContextStrokePath(context);
            break;
        case rightOff:
            break;
        case bottom:// Only bottom border of the view
            CGContextSetRGBStrokeColor (context, rc, gc, bc, 1.0);
            CGContextMoveToPoint(context, 0, 0);
            CGContextAddLineToPoint(context, self.frame.size.width, 0);
            CGContextStrokePath(context);
            break;
        case bottomOff:
            break;
        default:
            break;
    }
    [self setNeedsDisplay:YES];
}

@end
