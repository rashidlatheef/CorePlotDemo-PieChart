//
//  CPFirstViewController.m
//  Core-Plot
//
//  Created by Muhammed Rashid A on 28/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CPPieChartViewController.h"

@interface CPPieChartViewController ()

@end

@implementation CPPieChartViewController

@synthesize hostView = hostView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Pie Chart", @"Pie Chart");
        self.tabBarItem.image = [UIImage imageNamed:@"pie_chart"];
    }
    return self;
}
		
#pragma - mark View Lifew Cycle

- (void)viewDidAppear:(BOOL)animated
{   
    [super viewDidAppear:animated];
    [self initPlot];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

#pragma mark - CPTPlotDataSource

- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return [[Accidents sharedInstance].typesOfVehicles count];
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index 
{
    if (CPTPieChartFieldSliceWidth == fieldEnum) 
    {
        return [[[Accidents sharedInstance] accidentsAtTrivandrumCity] objectAtIndex:index];
    }
    return [NSDecimalNumber zero];
}

-(CPTLayer *)dataLabelForPlot:(CPTPlot *)plot recordIndex:(NSUInteger)index
{
    // 1 - Define label text style
    static CPTMutableTextStyle *labelText = nil;
    if (!labelText)
    {
        labelText= [[CPTMutableTextStyle alloc] init];
        labelText.color = [CPTColor grayColor];
    }
    
    // 2 - Calculate total number of accidents
    NSDecimalNumber *totalNumberOfAccidents = [NSDecimalNumber zero];
    for (NSDecimalNumber *accident in [[Accidents sharedInstance] accidentsAtTrivandrumCity]) 
    {
        totalNumberOfAccidents = [totalNumberOfAccidents decimalNumberByAdding:accident];
    }
    
    // 3 - Calculate percentage value
    NSDecimalNumber *accident = [[[Accidents sharedInstance] accidentsAtTrivandrumCity] objectAtIndex:index];
    NSDecimalNumber *percent = [accident decimalNumberByDividingBy:totalNumberOfAccidents];
    
    // 4 - Set up display label
    NSString *labelValue = [NSString stringWithFormat:@"%d accidents (%0.1f %%)", [accident intValue], ([percent floatValue] * 100.0f)];
    
    // 5 - Create and return layer with label text
    return [[CPTTextLayer alloc] initWithText:labelValue style:labelText];
}

-(NSString *)legendTitleForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)index 
{
    if (index < [[[Accidents sharedInstance]typesOfVehicles]count])
    {
        return [[[Accidents sharedInstance] typesOfVehicles] objectAtIndex:index];;
    }
    
    return @"N/A";
}

#pragma mark - Graph initialization and configuration

- (void)initPlot
{
    [self configureHost];
    [self configureGraph]; 
    [self configureChart];
    [self configureLegend];
}

- (void)configureHost
{
    CGRect hostViewFrame = CGRectMake(10,10, 460, 240);
    self.hostView = [[CPTGraphHostingView alloc]initWithFrame:hostViewFrame];
    self.hostView.allowPinchScaling = NO;
    [self.view addSubview:self.hostView];
}

- (void)configureGraph
{
    // 1 - Create and initialize graph
    CPTGraph *graph = [[CPTXYGraph alloc] initWithFrame:self.hostView.bounds];
    self.hostView.hostedGraph = graph;
    
    graph.paddingLeft = 0.0f;
    graph.paddingTop = 0.0f;
    graph.paddingRight = 0.0f;
    graph.paddingBottom = 0.0f;
    
    graph.axisSet = nil;
    // 2 - Set up text style
    CPTMutableTextStyle *textStyle = [CPTMutableTextStyle textStyle];
    textStyle.color = [CPTColor grayColor];
    textStyle.fontName = @"Helvetica-Bold";
    textStyle.fontSize = 16.0f;
    // 3 - Configure title
    NSString *title = @"Accidents in trivandrum city ";
    graph.title = title;    
    graph.titleTextStyle = textStyle;
    graph.titlePlotAreaFrameAnchor = CPTRectAnchorTop;    
    graph.titleDisplacement = CGPointMake(0.0f, -12.0f);         

    [self.hostView.hostedGraph applyTheme:[CPTTheme themeNamed:kCPTPlainWhiteTheme]];
}

- (void)configureChart
{
    // 1 Get reference to graph
    CPTGraph *graph = self.hostView.hostedGraph;    
    // 2 - Create chart
    CPTPieChart *pieChart = [[CPTPieChart alloc] init];
    pieChart.dataSource = self;
    pieChart.delegate = self;
    pieChart.pieRadius = (self.hostView.bounds.size.height * 0.7) / 2;
    pieChart.identifier = graph.title;
    pieChart.startAngle = M_PI_4;
    pieChart.sliceDirection = CPTPieDirectionClockwise;    
    // 3 - Create gradient
    CPTGradient *overlayGradient = [[CPTGradient alloc] init];
    overlayGradient.gradientType = CPTGradientTypeRadial;
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.0] atPosition:0.9];
    overlayGradient = [overlayGradient addColorStop:[[CPTColor blackColor] colorWithAlphaComponent:0.4] atPosition:1.0];
    pieChart.overlayFill = [CPTFill fillWithGradient:overlayGradient];
    // 4 - Add chart to graph    
    [graph addPlot:pieChart];
}

- (void)configureLegend
{
    // 1 - Get graph instance
    CPTGraph *graph = self.hostView.hostedGraph;
    // 2 - Create legend
    CPTLegend *theLegend = [CPTLegend legendWithGraph:graph];
    // 3 - Configure legend
    theLegend.numberOfColumns = 1;
    theLegend.fill = [CPTFill fillWithColor:[CPTColor whiteColor]];
    theLegend.borderLineStyle = [CPTLineStyle lineStyle];
    theLegend.cornerRadius = 5.0;
    // 4 - Add legend to graph
    graph.legend = theLegend;     
    graph.legendAnchor = CPTRectAnchorRight;
    CGFloat legendPadding = -(self.view.bounds.size.width / 16);
    graph.legendDisplacement = CGPointMake(legendPadding, 0.0);
}

@end