//
//  ZKHttpRequest.m
//  01-网络下载-基本使用
//
//  Created by zhaokai on 15-2-27.
//  Copyright (c) 2015年 zhaokai. All rights reserved.
//

#import "ZKHttpRequest.h"
@interface ZKHttpRequest()<NSURLConnectionDataDelegate>


@property (nonatomic,assign) SEL mySel;
@property(nonatomic,strong)id myTarget;
@end

@implementation ZKHttpRequest
//懒加载
-(NSMutableData *)myData{
    if (_myData == nil) {
        _myData = [NSMutableData data];
    }
    return _myData;
}

-(id)initWithRequest:(NSURLRequest *)request{
    if (self = [super init]) {
        //通过方法异步下载数据
        NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
        
    
    }
    
    return self;
}

-(id)initWithRequest:(NSURLRequest *)request target:(id)target andAction:(SEL)sel{
    if (self = [super init]) {
        //通过方法异步下载数据
        NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
        
        self.mySel = sel;
        self.myTarget = target;
    }
    
    return self;

}

#pragma mark NSURLConnectionDelegate
//错误的时候调用
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"错误");
}
//接收数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //保存所有的数据
    [self.myData appendData:data];
}

//开始接受数据
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"开始接受数据");
}
//接收完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"接收完成");
    

    if ([self.myTarget respondsToSelector:self.mySel]) {
        [self.myTarget performSelector:self.mySel withObject:self];
    }
}

@end
