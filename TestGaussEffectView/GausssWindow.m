//
//  GausssWindow.m
//  TestGaussEffectView
//
//  Created by Yiqi Wang on 2016/12/15.
//  Copyright © 2016年 Melody5417. All rights reserved.
//

#import "GausssWindow.h"
#import "GaussViewController.h"

@interface BackgroundView : NSView

@end

@implementation BackgroundView

@end

@interface GausssWindow ()

@end

@implementation GausssWindow

- (instancetype)init {
    // NSWindowStyleMaskTitled maskImage not work
    // NSWindowStyleMaskBorderless work
    self =  [super initWithContentRect:NSZeroRect
                             styleMask:NSWindowStyleMaskBorderless
                               backing:NSBackingStoreBuffered
                                 defer:NO
                                screen:[NSScreen mainScreen]];
    if (self) {
        [self setAlphaValue:1.0];
        [self setOpaque:NO];
        [self setReleasedWhenClosed:YES];
        [self setBackgroundColor:[NSColor clearColor]];
        [self setMovableByWindowBackground:YES];
        
        [self setupGaussView];
    }
    
    return self;
}

- (void)setupGaussView {
    NSView *view = [[BackgroundView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
    [self.contentView addSubview:view];
    
    GaussViewController *controller = [[GaussViewController alloc] init];
    [controller.view setFrame:NSMakeRect(0, 0, 100, 100)];
    [view addSubview:controller.view];
}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (BOOL)canBecomeMainWindow {
    return YES;
}

@end
