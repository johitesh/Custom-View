//
//  RVCustomView.h
//  RVProject
//
//  Created by Hitesh on 4/1/16.
//  Copyright © 2016 Hitesh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RVCustomView : NSView
{
NSColor *startingColor;
NSColor *endingColor;
int gradientAngle;
}

@property(nonatomic, retain) NSColor *startingColor;
@property(nonatomic, retain) NSColor *endingColor;
@property(nonatomic,retain,strong) NSColor* colorWellColor;
@property(assign) int gradientAngle;
@property(assign) int borderSelection;
- (void) drawViewContents:(NSInteger)visibleEdge;

@end
