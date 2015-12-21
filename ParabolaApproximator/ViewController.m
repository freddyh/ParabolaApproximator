//
//  ViewController.m
//  ParabolaApproximator
//
//  Created by fredhedz on 4/28/15.
//  Copyright (c) 2015 FredHedz. All rights reserved.
//

#import "ViewController.h"
#import "ParabolaFrameView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UISlider *angleSlider;
@property (strong, nonatomic) IBOutlet UISlider *pointSlider;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) ParabolaFrameView *parabolaFrameView;
@property (strong, nonatomic) IBOutlet UILabel *angleLabel;
@property (strong, nonatomic) IBOutlet UILabel *pointsLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _parabolaFrameView = [[ParabolaFrameView alloc] initWithFrame:_scrollView.bounds];
    _parabolaFrameView.backgroundColor = [UIColor lightGrayColor];
    _parabolaFrameView.points = _pointSlider.value;
    _parabolaFrameView.angle = _angleSlider.value;
    
    [_scrollView addSubview:_parabolaFrameView];
    
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.contentSize = self.view.bounds.size;
    _scrollView.pagingEnabled = NO;
    _scrollView.maximumZoomScale = 100.0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _parabolaFrameView;
}

- (IBAction)pointsChanged:(id)sender {
    _pointsLabel.text = [NSString stringWithFormat:@"%f", _pointSlider.value];
    _parabolaFrameView.points = _pointSlider.value;
    [_parabolaFrameView setNeedsDisplay];
}

- (IBAction)angleChanged:(id)sender {
    _angleLabel.text = [NSString stringWithFormat:@"%f", _angleSlider.value];
    _parabolaFrameView.angle = _angleSlider.value;
    [_parabolaFrameView setNeedsDisplay];
}


@end
