//
//  TowViewController.m
//  AOEDemo
//
//  Created by 夏宁忠 on 2018/1/9.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "TowViewController.h"
#import "AOEGradientScrollView.h"

@interface TowViewController ()

@property (nonatomic, strong)AOEGradientScrollView * scrollView;

@end

@implementation TowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg.jpg"]];
    [self.view addSubview:backgroundImage];
    backgroundImage.frame = self.view.bounds;
    
    [self aoe_setupView];
}

-(void)aoe_setupView{
    
    [self.view addSubview:self.scrollView];
    
    for (int i=0; i<10; i++) {
        
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(40 * i + 5 * i, 10, 40, 40)];
        btn.backgroundColor = [UIColor blueColor];
        [self.scrollView addSubview:btn];
    }
    
    self.scrollView.contentSize = CGSizeMake(1000, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter/gstter
-(AOEGradientScrollView *)scrollView{
    
    if (!_scrollView) {
        
        _scrollView = [AOEGradientScrollView gradientTableViewWithFrame:CGRectMake(10, 100, 300, 400) Direction:AOEGradientDirectionLeft|AOEGradientDirectionRight GradientValues:AOEGradientValuesMake(.3f, .3f, .3f, .3f)];
        _scrollView.backgroundColor = [UIColor redColor];
    }
    
    return _scrollView;
}


@end
