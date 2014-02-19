//
//  SCViewController.m
//  Gauges-SoundMeter
//
//  Created by Sam Davies on 18/02/2014.
//  Copyright (c) 2014 Shinobi Controls. All rights reserved.
//

#import "SCViewController.h"
#import "SCAudioMeter.h"
#import <ShinobiGauges/ShinobiGauges.h>

@interface SCViewController ()

@property (nonatomic, strong) SCAudioMeter *audioMeter;
@property (nonatomic, strong) SGaugeRadial *gauge;

@end

@implementation SCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [ShinobiGauges setLicenseKey:@"<YOUR LICENSE KEY HERE>"];
    // Create a gauge
    self.gauge = [[SGaugeRadial alloc] initWithFrame:CGRectInset(self.view.bounds, 40, 100)
                                         fromMinimum:@0
                                           toMaximum:@5];
    
    [self.view addSubview:self.gauge];
    
    // Let's try the audio meter
    self.audioMeter = [SCAudioMeter new];
    [self.audioMeter beginAudioMeteringWithCallback:^(double value) {
        NSLog(@"RMS Value: %0.3f", value);
        self.gauge.value = value;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
