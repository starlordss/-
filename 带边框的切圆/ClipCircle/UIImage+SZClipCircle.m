//
//  UIImage+SZClipCircle.m
//  带边框的切圆
//
//  Created by Zahi on 2017/9/4.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import "UIImage+SZClipCircle.h"

@implementation UIImage (SZClipCircle)


+ (UIImage *)imageWithClipCircle:(UIImage *)image
{
    UIGraphicsBeginImageContext(image.size);
    
    
    CGPoint center = CGPointMake(image.size.width * 0.5, image.size.height * 0.5);
    
    CGFloat radius = image.size.width * 0.5;
    // 需要裁剪的区域
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:YES];
    // 裁剪
    [path addClip];
    
    // 绘制图片到裁剪区域
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.width)];
    
    // 生成新图
    UIImage *targetImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return targetImage;
}


+ (UIImage *)imageWithBorderWidth:(CGFloat)bWidth
                       boderColor:(UIColor *)bColor
                            image:(UIImage *)image
{

    // 图片上下文的大小
    CGSize ctxSize = CGSizeMake(image.size.width + bWidth*2, image.size.height + bWidth*2);
    // 开启图片上下文
    UIGraphicsBeginImageContextWithOptions(ctxSize, NO, 0);
    
    // 外环的路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ctxSize.width, ctxSize.height)];
    // 设置外环的颜色
    [bColor set];
    // 填充外环
    [path fill];
    
    // 内环的路径
    CGRect rect = CGRectMake(bWidth, bWidth, image.size.width, image.size.height);
    path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    // 裁剪绘制的形状区域
    [path addClip];
    
    // 绘制图片
    [image drawInRect:rect];
    
    // 生成图片
    UIImage *targerImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return targerImage;
    
}

@end
