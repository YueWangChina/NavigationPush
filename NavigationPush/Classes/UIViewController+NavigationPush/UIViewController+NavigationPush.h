//
//  UIViewController+NavigationPush.h
//  XDYCar
//
//  Created by xdy on 2018/5/31.
//  Copyright © 2018年 xindongyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIViewController (NavigationPush)

/**
 push操作删除栈中的VC保留当前控制器和首控制器
 */
-(void)pushDeleteControllers;
/**
 push操作删除栈中的VC保留当前控制器和首控制器
 vcName:要删除的控制器名称数组
 */
-(void)pushDeleteControllers:(NSArray*)vcNameArray;

/**
 针对开单 模态 和车辆列表 的跳转
 */
-(void)popViewController;


/**
   runtime跳转
   vcName: 类名
   dic:参数 以key-Value 去匹配
   nav:当前类的导航
 */
+ (void)runtimePush:(NSString *)vcName dic:(NSDictionary *)dic nav:(UINavigationController *)nav;
+ (void)runtimepresentVC:(NSString *)vcName dic:(NSDictionary *)dic nav:(UINavigationController *)nav;
@end
