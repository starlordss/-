//
//  UIImage+SZClipCircle.h
//  带边框的切圆
//
//  Created by Zahi on 2017/9/4.
//  Copyright © 2017年 Zahi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SZClipCircle)



/**
 * 带边框的切圆图
 *
 * @param bWidth    边框的宽
 * @param bColor    边框的颜色
 * @param image     要设置的图片
 * @return 设置后的切图
 */
+ (UIImage *)imageWithBorderWidth:(CGFloat)bWidth
                       boderColor:(UIColor *)bColor
                            image:(UIImage *)image;


/**
 * 不带边框的切圆图
 *
 * @param image 需要切图的图片
 * @return 设置后的切图
 */
+ (UIImage *)imageWithClipCircle:(UIImage *)image;
@end
