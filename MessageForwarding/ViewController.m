//
//  ViewController.m
//  MessageForwarding
//
//  Created by liu on 2019/10/16.
//  Copyright © 2019 liu. All rights reserved.
//

#import "ViewController.h"
#import "People.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    People *people = [[People alloc]init];
    [people sayHello];
    
//    [People sayHello];
}


@end
