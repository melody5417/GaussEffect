//
//  ViewController.m
//  TestGaussEffectView
//
//  Created by Yiqi Wang on 2016/12/15.
//  Copyright © 2016年 Melody5417. All rights reserved.
//

#import "ViewController.h"
#import "GausssWindow.h"

@interface ViewController ()
@property (nonatomic, strong) GausssWindow *window;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)setupGauss:(NSButton *)sender {
    self.window = [[GausssWindow alloc] init];
    [self.window setFrame:NSMakeRect(0, 0, 100, 100) display:NO];
    [self.window center];
    [self.window makeKeyAndOrderFront:nil];
    [self.window orderFrontRegardless];
}

@end
