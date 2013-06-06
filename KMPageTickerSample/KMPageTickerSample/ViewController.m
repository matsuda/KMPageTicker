//
//  ViewController.m
//  KMPageTickerSample
//
//  Created by Kosuke Matsuda on 2013/06/06.
//  Copyright (c) 2013年 matsuda. All rights reserved.
//

#import "ViewController.h"
#import "KMPageTicker.h"

static UIColor * randomColorWithRGB() {
    srand(time(NULL));
    int rgb = random() % 3;
    int code = random() % 10;
    UIColor *color;
    switch (rgb) {
        case 0:
            color = [UIColor colorWithRed:0.1 * code green:1.0 blue:1.0 alpha:1.0];
            break;
        case 1:
            color = [UIColor colorWithRed:1.0 green:0.1 * code blue:1.0 alpha:1.0];
            break;
        default:
            color = [UIColor colorWithRed:1.0 green:1.0 blue:0.1 * code alpha:1.0];
            break;
    }
    return color;
}

@interface ViewController () <KMPageTickerDataSource>

@property (nonatomic, strong) KMPageTicker *tickerView;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.items = [@[] mutableCopy];
    for (int i = 0; i < 3; i++) {
        [self.items addObject:[NSString stringWithFormat:@"test test test test test test %d", i]];
    }

    self.tickerView = [[KMPageTicker alloc] initWithFrame:CGRectMake(0, 200, 320, 40)];
    self.tickerView.dataSource = self;
    [self.view addSubview:self.tickerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfItemsInPageTicker:(KMPageTicker *)pageTicker
{
    return [self.items count];
}

- (UIView *)pageTicker:(KMPageTicker *)pageTicker viewAtIndex:(NSInteger)index
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = randomColorWithRGB();
    label.text = self.items[index];
    return label;
}

@end
