//
//  CPFirstViewController.h
//  Core-Plot
//
//  Created by Muhammed Rashid A on 28/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPPieChartViewController : UIViewController<CPTPlotDataSource>

@property (nonatomic, retain) CPTGraphHostingView *hostView;

- (void)initPlot;
- (void)configureHost;
- (void)configureGraph;
- (void)configureChart;
- (void)configureLegend;


@end
