//
//  GaussViewController.m
//  TestGaussEffectView
//
//  Created by Yiqi Wang on 2016/12/15.
//  Copyright © 2016年 Melody5417. All rights reserved.
//

#import "GaussViewController.h"
#import "JTAppKitVersionUtility.h"

@interface GaussViewController ()
@property (nonatomic, strong) NSVisualEffectView *gaussEffectView;
@end

@implementation GaussViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupGaussEffect];
    }
    return self;
}

- (void)setupGaussEffect {
#ifdef MAC_OS_X_VERSION_10_10
    if (IsHigherThanYosemite()) {
        NSVisualEffectView *effectView = [[NSVisualEffectView alloc] initWithFrame:NSZeroRect];
        [self setView:effectView];
        
        [effectView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [effectView setBlendingMode:NSVisualEffectBlendingModeBehindWindow];
        [effectView setMaterial:NSVisualEffectMaterialDark];
        [effectView setState:NSVisualEffectStateActive];
        
        NSImage *maskImage = [self generateImageWithSize:NSMakeSize(40, 40) cornerRadius:5.0];
        [effectView setMaskImage:maskImage];
        
        self.gaussEffectView = effectView;
    }
#endif
}

- (NSImage *)generateImageWithSize:(NSSize)size cornerRadius:(CGFloat)radius {
    if (( radius >= 0 && size.width > radius && size.height > radius)) {
        NSBitmapImageRep *theImage = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL
                                                                             pixelsWide:size.width
                                                                             pixelsHigh:size.height
                                                                          bitsPerSample:8
                                                                        samplesPerPixel:4
                                                                               hasAlpha:YES
                                                                               isPlanar:NO
                                                                         colorSpaceName:NSDeviceRGBColorSpace bytesPerRow:0
                                                                           bitsPerPixel:0];
        
        [NSGraphicsContext saveGraphicsState];
        [NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithBitmapImageRep:theImage]];
        
        NSImage *retImage = [[NSImage alloc] initWithSize:size];
        
        [retImage lockFocus];
        
        [[NSColor blackColor] set];
        [[NSBezierPath bezierPathWithRoundedRect:NSMakeRect(0, 0, size.width, size.height) xRadius:radius yRadius:radius] fill];
        
        [retImage unlockFocus];
        
        [NSGraphicsContext restoreGraphicsState];
        
        return retImage;
    }
    
    return nil;
}

@end
