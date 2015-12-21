//
//  ParabolaFrameView.m
//  ParabolaApproximator
//
//  Created by fredhedz on 4/28/15.
//  Copyright (c) 2015 FredHedz. All rights reserved.
//

#import "ParabolaFrameView.h"

@interface ParabolaFrameView ()

@property (nonatomic) CGPoint frameVertex;
@property (nonatomic) CGPoint upperPoint;
@property (nonatomic) CGPoint lowerPoint;
@property (nonatomic) CGFloat frameWidth;

@end

@implementation ParabolaFrameView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    _frameVertex = CGPointZero;
    _frameVertex.y = self.frame.size.height / 2.0;
    
    _frameWidth = MIN(self.frame.size.width, self.frame.size.height / 2.0);
    
    [self drawParabolaFrame];
}

- (void)drawParabolaFrame {
    
    CGFloat angleInRadians = (_angle * M_PI) / 180.0;
    
    CGFloat xLeg = _frameWidth*cosf(angleInRadians/2.0);
    CGFloat yLeg = _frameWidth*sinf(angleInRadians/2.0);
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor redColor] setStroke];
    path.lineWidth = 8.0;
    path.lineCapStyle = kCGLineCapSquare;
    
    CGPoint pointForUpper = CGPointZero;
    CGPoint pointForLower = CGPointZero;
    CGFloat xStep = xLeg/_points;
    CGFloat yStep = yLeg/_points;
    
    int i = 1;
    int j = _points;
    
    while (j > 0) {
        pointForUpper.x = _frameVertex.x + xStep * i;
        pointForLower.x = _frameVertex.x + xStep * j;
        
        pointForUpper.y = _frameVertex.y - yStep * i;
        pointForLower.y = _frameVertex.y + yStep * j;
        
        [path moveToPoint:pointForUpper];
        [path addLineToPoint:pointForLower];
        [path stroke];
        i++;
        j--;
    }
    _upperPoint = CGPointZero;
    _upperPoint.x = xLeg;
    _upperPoint.y = (self.frame.size.height/2.0) - yLeg;
    
    _lowerPoint = CGPointZero;
    _lowerPoint.x = xLeg;
    _lowerPoint.y = (self.frame.size.height/2.0) + yLeg;
    
    [path moveToPoint:_upperPoint];
    [path addLineToPoint:_frameVertex];
    [path addLineToPoint:_lowerPoint];
    [path stroke];
}

@end
