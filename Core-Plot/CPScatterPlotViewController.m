//
//  CPScatterPlotViewController.m
//  Core-Plot
//
//  Created by Muhammed Rashid A on 28/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CPScatterPlotViewController.h"

@interface CPScatterPlotViewController ()

@end

@implementation CPScatterPlotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
        self.title = NSLocalizedString(@"Scatter Plot", @"Scatter Plot");
        self.tabBarItem.image = [UIImage imageNamed:@"line_graph"];
    }
    return self;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

@end
