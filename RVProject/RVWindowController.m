//
//  RVWindowController.m
//  RVProject
//
//  Created by Hitesh on 4/1/16.
//  Copyright © 2016 Hitesh. All rights reserved.
//

#import "RVWindowController.h"
#import "RVCustomView.h"
#import "RVConstant.h"

@interface RVWindowController ()

@end

@implementation RVWindowController
@dynamic window;
@synthesize borderThicknessValue;
@synthesize borderThickness;
@synthesize rvCustomView;
@synthesize viewTopColor;
@synthesize viewBottomColor;
@synthesize isGradient;
@synthesize borderThicknessTextField;


- (void)windowDidLoad {
    [super windowDidLoad];
    [[self window] setToolbar:_windowToolbar];
}

- (void) awakeFromNib
{
    [self.borderThickness setEnabled:YES];
    [self.borderThicknessTextField setFloatValue:kdefaultBorderThickness];
    self.isGradient = YES;
}

- (IBAction)borderThicknessEntered:(id)sender {
    self.borderThicknessValue = [sender floatValue];
    [self.rvCustomView setNeedsDisplay:YES];
}

- (IBAction)toggleViewBorder:(id)sender
{
    if ([[sender title] isEqualToString:kAllBorderOfView])
    {
        if(([sender state]) == 1){
            self.rvCustomView.borderSelection = 1;
        }
        else{
            self.rvCustomView.borderSelection = 10;
        }
        [self.rvCustomView setNeedsDisplay:YES];
    }
    if ([[sender title] isEqualToString:kTopBorderOfView])
    {
        if(([sender state]) == 1){
            self.rvCustomView.borderSelection = 2;
        }
        else{
            self.rvCustomView.borderSelection = 6;
        }
        [self.rvCustomView setNeedsDisplay:YES];
    }
    if ([[sender title] isEqualToString:kBottomBorderOfView])
    {
        if(([sender state]) == 1){
            self.rvCustomView.borderSelection = 3;
        }
        else{
            self.rvCustomView.borderSelection = 7;
        }
        [self.rvCustomView setNeedsDisplay:YES];
    }
    if ([[sender title] isEqualToString:kRightBorderOfView])
    {
        if(([sender state]) == 1){
            self.rvCustomView.borderSelection = 4;
        }
        else{
            self.rvCustomView.borderSelection = 8;
        }
        [self.rvCustomView setNeedsDisplay:YES];
    }
    if ([[sender title] isEqualToString:kLeftBorderOfView])
    {
        if(([sender state]) == 1){
            self.rvCustomView.borderSelection = 5;
        }
        else{
            self.rvCustomView.borderSelection = 9;
        }
        [self.rvCustomView setNeedsDisplay:YES];
    }
}

- (IBAction)gradientCheckBoxClicked:(id)sender {
    int state = [sender state];
    if(state == 0)
    {
        self.isGradient = NO;
        [self.viewBottomColor setColor:[ self.viewTopColor color]];
        [self.viewBottomColor setEnabled:NO];
        self.rvCustomView.endingColor = self.rvCustomView.startingColor;
        
    }
    else if(state == 1)
    {
        [self.viewBottomColor setEnabled:YES];
        self.rvCustomView.endingColor = [self.viewBottomColor color];
        self.isGradient =  YES;
    }
    [self.rvCustomView setNeedsDisplay:YES];
}

- (IBAction)topColorWell:(id)sender {
    
    self.rvCustomView.startingColor = [sender color];
    
    if(!self.isGradient){
        [self.viewBottomColor setColor:[ self.viewTopColor color]];
        self.rvCustomView.endingColor = self.rvCustomView.startingColor;
    }
    [self.rvCustomView setNeedsDisplay:YES];
}

- (IBAction)bottomColorWell:(id)sender {
    self.rvCustomView.endingColor = [sender color];
    [self.rvCustomView setNeedsDisplay:YES];
}

- (IBAction)borderColorSelection:(id)sender {
    NSColor *selectedColor = [sender color];
    self.rvCustomView.colorWellColor = selectedColor;
    [self.rvCustomView setNeedsDisplay:YES];
}


@end
