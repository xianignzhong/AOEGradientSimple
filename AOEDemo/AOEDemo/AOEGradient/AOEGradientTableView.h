//
//  AOEGradientTableView.h
//  AOEDemo
//
//  Created by 夏宁忠 on 2018/1/9.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOEGradient.h"

@interface AOEGradientTableView : UITableView

/**
 初始化

 @param frame frame
 @param style style
 @param direction 方向随意组合
 @param gradientValues 渐变方向的宽度值（0~1）
 @return id
 */
+(instancetype)gradientTableViewWithFrame:(CGRect)frame Style:(UITableViewStyle)style Direction:(AOEGradientDirection)direction GradientValues:(AOEGradientValues)gradientValues;

@end
