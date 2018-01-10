//
//  ThreeViewController.m
//  AOEDemo
//
//  Created by 夏宁忠 on 2018/1/9.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "ThreeViewController.h"
#import "AOEGradientCollectionView.h"
#import "ImgCell.h"

@interface ThreeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)AOEGradientCollectionView * collectionView;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg.jpg"]];
    [self.view addSubview:backgroundImage];
    backgroundImage.frame = self.view.bounds;
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImgCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

-(AOEGradientCollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.minimumLineSpacing = 2;
        layout.minimumInteritemSpacing = 2;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [AOEGradientCollectionView gradientTableViewWithFrame:CGRectMake(10, 100, 300, 500) Layout:layout Direction:AOEGradientDirectionTop|AOEGradientDirectionBottom GradientValues:AOEGradientValuesMake(.3f, .3f, .3f, .3f)];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ImgCell class]) bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    
    return _collectionView;
}

@end
