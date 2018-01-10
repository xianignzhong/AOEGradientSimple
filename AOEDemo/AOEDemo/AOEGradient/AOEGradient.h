//
//  AOEGradient.h
//  AOEDemo
//
//  Created by 夏宁忠 on 2018/1/9.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#ifndef AOEGradient_h
#define AOEGradient_h

/**
 枚举需要设置的Gradient方向 (在这里要么单独使用 要么Top + Bottom 要么Left + Right 也就是说横向组合/纵向组合)
 目的:快速解决特定类需求
 */
typedef NS_OPTIONS(NSInteger, AOEGradientDirection){
    
    AOEGradientDirectionTop = 1<<1,
    AOEGradientDirectionBottom = 1<<2,
    AOEGradientDirectionLeft = 1<<3,
    AOEGradientDirectionRight = 1<<4,
};

/**
 每个方向所对应的值
 */
struct AOEGradientValues{
    
    double topValue;
    double bottomValue;
    double leftValue;
    double rightValue;
};
typedef struct CG_BOXABLE AOEGradientValues AOEGradientValues;

/**
 内联函数
 */
CG_INLINE AOEGradientValues
AOEGradientValuesMake(double topValue, double bottomValue, double leftValue, double rightValue)
{
    AOEGradientValues values;
    values.topValue = topValue;
    values.bottomValue = bottomValue;
    values.leftValue = leftValue;
    values.rightValue = rightValue;
    return values;
}

#import "AOEGradientTableView.h"
#import "AOEGradientScrollView.h"
#import "AOEGradientCollectionView.h"

#endif /* AOEGradient_h */
