//
//  RVWindowController.h
//  RVProject
//
//  Created by Hitesh on 4/1/16.
//  Copyright © 2016 Hitesh. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RVCustomView.h"

@interface RVWindowController : NSWindowController <NSToolbarDelegate,NSWindowDelegate>
@property (weak) IBOutlet NSToolbar *windowToolbar;
@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSToolbarItem *colorSelection;
@property (weak) IBOutlet NSToolbarItem *borderThickness;
@property (readwrite,assign) float borderThicknessValue;
@property (weak) IBOutlet RVCustomView *rvCustomView;
@property (weak) IBOutlet NSToolbarItem *gradientCheckBox;
@property (weak) IBOutlet NSColorWell *viewTopColor;
@property (weak) IBOutlet NSColorWell *viewBottomColor;
@property (assign) BOOL isGradient;
@property (weak) IBOutlet NSTextField *borderThicknessTextField;


@end

