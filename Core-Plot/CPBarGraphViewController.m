//
//  CPSecondViewController.m
//  Core-Plot
//
//  Created by Muhammed Rashid A on 28/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CPBarGraphViewController.h"

@interface CPBarGraphViewController ()

@end

@implementation CPBarGraphViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Bar Graph", @"Bar Graph");
        self.tabBarItem.image = [UIImage imageNamed:@"bar_graph"];
    }
    return self;
}
							

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
   return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

@end
