//
//  AOEGradientTableView.m
//  AOEDemo
//
//  Created by 夏宁忠 on 2018/1/9.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AOEGradientTableView.h"

@interface AOEGradientTableView ()

@property (nonatomic, assign) AOEGradientDirection direction;

@end

@implementation AOEGradientTableView

+(instancetype)gradientTableViewWithFrame:(CGRect)frame Style:(UITableViewStyle)style Direction:(AOEGradientDirection)direction GradientValues:(AOEGradientValues)gradientValues{
    
    return [[self alloc] initWithFrame:frame Style:style Direction:direction GradientValues:gradientValues];
}

-(instancetype)initWithFrame:(CGRect)frame Style:(UITableViewStyle)style Direction:(AOEGradientDirection)direction GradientValues:(AOEGradientValues)gradientValues{
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.direction = direction;
        NSNumber *topValue = @0, *bottomValue = @0, *leftValue = @0, *rightValue = @0;
        if (direction & AOEGradientDirectionTop) {
            
            topValue = @(gradientValues.topValue);
        }
        if (direction & AOEGradientDirectionBottom) {
            
            bottomValue = @(gradientValues.bottomValue);
        }
        if (direction & AOEGradientDirectionLeft) {
            
            leftValue = @(gradientValues.leftValue);
        }
        if (direction & AOEGradientDirectionBottom) {
            
            rightValue = @(gradientValues.rightValue);
        }
        
        if (!self.layer.mask) {
            
            CAGradientLayer *maskLayer = [CAGradientLayer layer];
            if (direction & (AOEGradientDirectionTop | AOEGradientDirectionBottom)) {
                
                maskLayer.locations = @[@(0), topValue, @(1-bottomValue.doubleValue), @(1)];
            }else if (direction & (AOEGradientDirectionLeft | AOEGradientDirectionRight)){
                
                maskLayer.locations = @[@(0), leftValue, @(1-rightValue.doubleValue), @(1)];
            }
            maskLayer.bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            maskLayer.anchorPoint = CGPointZero;
            self.layer.mask = maskLayer;
        }
        
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        
        if (direction==(AOEGradientDirectionTop|AOEGradientDirectionBottom) || direction == AOEGradientDirectionTop || direction == AOEGradientDirectionBottom) {
            
            [self gradientChangeY];
            
        }else if (direction==(AOEGradientDirectionLeft|AOEGradientDirectionRight) || direction == AOEGradientDirectionLeft || direction == AOEGradientDirectionRight){
            
            [self gradientChangeX];
        }
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        if (self.direction==(AOEGradientDirectionTop|AOEGradientDirectionBottom) || self.direction == AOEGradientDirectionTop || self.direction == AOEGradientDirectionBottom) {
            
            [self gradientChangeY];
            
        }else if (self.direction==(AOEGradientDirectionLeft|AOEGradientDirectionRight) || self.direction == AOEGradientDirectionLeft || self.direction == AOEGradientDirectionRight){
            
            [self gradientChangeX];
        }
    }
}

-(void)gradientChangeX{
    
    UIScrollView *scrollView = (UIScrollView *)self;
    CGColorRef outerColor = [UIColor colorWithWhite:1.0 alpha:0.0].CGColor;
    CGColorRef innerColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    NSArray *colors;
    
    if (scrollView.contentOffset.x + scrollView.contentInset.left <= 0) {
        //left of scrollView
        colors = @[(__bridge id) innerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) outerColor];
    } else if (scrollView.contentOffset.x + scrollView.frame.size.width
               >= scrollView.contentSize.width) {
        //right of tableView
        colors = @[(__bridge id) outerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) innerColor];
    }else {
        //Middle
        colors = @[(__bridge id) outerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) outerColor];
    }
    
    ((CAGradientLayer *) scrollView.layer.mask).colors = colors;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    scrollView.layer.mask.position = CGPointMake(scrollView.contentOffset.x, 0);
    [CATransaction commit];
}

-(void)gradientChangeY{
    
    UIScrollView *scrollView = (UIScrollView *)self;
    CGColorRef outerColor = [UIColor colorWithWhite:1.0 alpha:0.0].CGColor;
    CGColorRef innerColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    NSArray *colors;
    
    if (scrollView.contentOffset.y + scrollView.contentInset.top <= 0) {
        //Top of scrollView
        colors = @[(__bridge id) innerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) outerColor];
    } else if (scrollView.contentOffset.y + scrollView.frame.size.height
               >= scrollView.contentSize.height) {
        //Bottom of tableView
        colors = @[(__bridge id) outerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) innerColor];
    }else {
        //Middle
        colors = @[(__bridge id) outerColor, (__bridge id) innerColor,
                   (__bridge id) innerColor, (__bridge id) outerColor];
    }
    
    ((CAGradientLayer *) scrollView.layer.mask).colors = colors;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    scrollView.layer.mask.position = CGPointMake(0, scrollView.contentOffset.y);
    [CATransaction commit];
}

-(void)dealloc{
    
    [self removeObserver:self forKeyPath:@"contentOffset"];
}

@end
