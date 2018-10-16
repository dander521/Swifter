//
//  ViewController.m
//  MessageTransform
//
//  Created by 倩倩 on 2018/10/16.
//  Copyright © 2018年 Swifter. All rights reserved.
//

#import "ViewController.h"
#import "SportAction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SportAction *action = [SportAction new];
    [action performSelector:@selector(speak)];
    [action performSelector:@selector(fly)];
    [action performSelector:@selector(code)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SportAction *action = [SportAction new];
    [action performSelector:@selector(RogerChen)];
}

@end
