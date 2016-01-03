//
//  ViewController.m
//  KFMailSenderDemo
//
//  Created by Kevin Fang on 1/2/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import "ViewController.h"
#import "KFMailSender.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    KFMailSender* sender = [KFMailSender initMailControllerWithParentViewController:self];
    [sender setSubject:@"HI" message:@"HI" andTo:[NSArray arrayWithObject:@"reddhelp@gmail.com"] sendInfo:0];
    [sender showMail];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
