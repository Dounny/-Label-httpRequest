//
//  ZKHttpRequest.h
//  01-网络下载-基本使用
//
//  Created by zhaokai on 15-2-27.
//  Copyright (c) 2015年 zhaokai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZKHttpRequest : NSObject

@property(nonatomic,strong)NSMutableData *myData;
/**
 动作-目标 模式 动作:方法  目标:是动作所在的对象
 作用:专门用来传值
 */

//构造方法-构造方法家族(必须以init开头,遵循驼峰原则)
-(id)initWithRequest:(NSURLRequest *)request;

-(id)initWithRequest:(NSURLRequest *)request target:(id)target andAction:(SEL)sel;
@end
