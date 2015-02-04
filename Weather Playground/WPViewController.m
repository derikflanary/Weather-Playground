//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WPObjectController.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherTempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)searchPressed:(id)sender {
    
    [[WPObjectController sharedInstance] getWeatherWithName:[self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]  completion:^(Weather *weather) {
        
        self.locationNameLabel.text = weather.locationName;
        //self.weatherMainLabel.text = weather.weatherMain;
        self.weatherDescriptionLabel.text = weather.weatherDescription;
        double actualTemp = [weather.weatherTemp doubleValue];
        actualTemp = 1.8 * (actualTemp - 273) +32;
        NSInteger temp = actualTemp;
        self.weatherTempLabel.text = [NSString stringWithFormat:@"%ld F", (long)temp];
        NSString *iconUrl = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weather.weatherIcon];
        NSURL *url =[[NSURL alloc]initWithString:iconUrl];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:urlData];
        [self.iconView setImage:image];
    }];
    
}
@end
