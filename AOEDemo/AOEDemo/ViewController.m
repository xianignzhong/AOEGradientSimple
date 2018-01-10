//
//  ViewController.m
//  AOEDemo
//
//  Created by 夏宁忠 on 2018/1/9.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "ViewController.h"
#import "AOEGradientTableView.h"
#import "MessageCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)AOEGradientTableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg.jpg"]];
    [self.view addSubview:backgroundImage];
    backgroundImage.frame = self.view.bounds;
    
    [self aoe_setupView];
}

-(void)aoe_setupView{
    
    [self.view addSubview:self.tableView];
}

#pragma mark <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(AOEGradientTableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [AOEGradientTableView gradientTableViewWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) Style:UITableViewStylePlain Direction:AOEGradientDirectionTop GradientValues:AOEGradientValuesMake(.3f, .3f, .3f, .3f)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"MessageCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    
    return _tableView;
}


@end
