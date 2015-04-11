//
//  Method.m
//  01-xml解析实例
//
//  Created by 骆冬宇 on 15/3/3.
//  Copyright (c) 2015年 zhaokai. All rights reserved.
//

#import "Method.h"

@implementation UILabel (addMethod)


+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title textFont:(int )font textColor:(UIColor *)color
{
    UILabel *name = [[UILabel alloc] initWithFrame:frame];
    
    name.font = [UIFont systemFontOfSize:font];
    
    name.textColor = color;
    
    name.text = title;
    
    name.numberOfLines = 0;
    
    name.backgroundColor = [UIColor clearColor];
    
    return name;
    
}
@end

@implementation UIButton (addMethod)

@end