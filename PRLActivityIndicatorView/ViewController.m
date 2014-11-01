//
//  ViewController.m
//  PRLActivityIndicatorView
//
//  Created by Parliant on 2014-11-01.
//  Copyright (c) 2014 Parliant. All rights reserved.
//

#import "ViewController.h"
#import "PRLActivityIndicatorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)stopSignal:(id)sender {
	self.activityIndicatorView.status = PRLActivityIndicatorStatusNoError;
}

- (IBAction)startProgress:(id)sender {
	self.activityIndicatorView.status = PRLActivityIndicatorStatusInProgress;
}

- (IBAction)errorSignal:(id)sender {
	self.activityIndicatorView.status = PRLActivityIndicatorStatusError;
}

- (IBAction)showSuccess:(id)sender {
	self.activityIndicatorView.status = PRLActivityIndicatorStatusSuccess;
}

@end
