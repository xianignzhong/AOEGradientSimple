//
//  AOEGradientCollectionView.h
//  AOEDemo
//
//  Created by 夏宁忠 on 2018/1/9.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOEGradient.h"

@interface AOEGradientCollectionView : UICollectionView

/**
 初始化
 
 @param frame 设置frame
 @param direction 设置渐变方向(组合只能上下 || 左右)
 @param gradientValues 设置渐变大小值 AOEGradientValuesMake(.0f, .0f, .0f, .0f)
 @return id
 */
+(instancetype)gradientTableViewWithFrame:(CGRect)frame Layout:(UICollectionViewLayout *)layout Direction:(AOEGradientDirection)direction GradientValues:(AOEGradientValues)gradientValues;

@end
