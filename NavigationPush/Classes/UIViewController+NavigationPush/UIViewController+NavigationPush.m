//
//  UIViewController+NavigationPush.m
//  XDYCar
//
//  Created by xdy on 2018/5/31.
//  Copyright © 2018年 xindongyuan. All rights reserved.
//

#import "UIViewController+NavigationPush.h"

@implementation UIViewController (NavigationPush)

-(void)pushDeleteControllers{
    NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
    NSInteger currentStackCount = self.navigationController.viewControllers.count;
    for (NSInteger i = currentStackCount - 2; i >0; i--)
    {
        if (![viewControllers[i] isKindOfClass:NSClassFromString(@"XDYSolveSchemeListController")] && ![viewControllers[i] isKindOfClass:NSClassFromString(@"XDYPretestDetailController")] && ![viewControllers[i] isKindOfClass:NSClassFromString(@"XDYPretestListController")] && ![viewControllers[i] isKindOfClass:NSClassFromString(@"XDYVehicleDetailsViewController")]) {
            [viewControllers removeObjectAtIndex:i];
        }
    }
    [self.navigationController setViewControllers:[NSArray arrayWithArray:viewControllers]];
}
-(void)pushDeleteControllers:(NSArray*)vcNameArray{

    NSMutableArray *viewControllers = [self.navigationController.viewControllers mutableCopy];
    NSInteger currentStackCount = self.navigationController.viewControllers.count;
    for (NSInteger i = currentStackCount - 2; i >0; i--)
    {

        
        for (NSInteger j = 0 ;j<vcNameArray.count;j++) {
            if (![viewControllers[i] isKindOfClass:NSClassFromString(vcNameArray[j])]) {
                [viewControllers removeObjectAtIndex:i];
            }
        }
        
    }
    [self.navigationController setViewControllers:[NSArray arrayWithArray:viewControllers]];
}



-(void)popViewController{

    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:NSClassFromString(@"XDYPickCarViewController")]) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            return;
        }
    }
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:NSClassFromString(@"XDYOutInFactoryCarsController")]) {
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
        if ([controller isKindOfClass:NSClassFromString(@"XDYSolveSchemeListController")]) {
            [self.navigationController popViewControllerAnimated:YES];
            return;
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
// push控制器
+ (void)runtimePush:(NSString *)vcName dic:(NSDictionary *)dic nav:(UINavigationController *)nav {
    //类名(对象名)
    NSString *class = vcName;
    const char *className = [class cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    if (!newClass) {
        //创建一个类
        Class superClass = [UIViewController class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        //注册你创建的这个类
        objc_registerClassPair(newClass);
    }
    // 创建对象(写到这里已经可以进行随机页面跳转了)
    id instance = [[newClass alloc] init];
    //下面是传值－－－－－－－－－－－－－－
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([self checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {
            //kvc给属性赋值
            NSLog(@"%@,%@",obj,key);
            [instance setValue:obj forKey:key];
        }else {
            NSLog(@"不包含key=%@的属性",key);
        }
    }];
    [nav pushViewController:instance animated:YES];
    
}
// 模态控制器
+ (void)runtimepresentVC:(NSString *)vcName dic:(NSDictionary *)dic nav:(UINavigationController *)nav{
    
    //类名(对象名)
    NSString *class = vcName;
    const char *className = [class cStringUsingEncoding:NSASCIIStringEncoding];
    Class newClass = objc_getClass(className);
    if (!newClass) {
        //创建一个类
        Class superClass = [UIViewController class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        //注册你创建的这个类
        objc_registerClassPair(newClass);
    }
    // 创建对象(写到这里已经可以进行随机页面跳转了)
    id instance = [[newClass alloc] init];
    //下面是传值－－－－－－－－－－－－－－
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([self checkIsExistPropertyWithInstance:instance verifyPropertyName:key]) {
            //kvc给属性赋值
            NSLog(@"%@,%@",obj,key);
            [instance setValue:obj forKey:key];
        }else {
            NSLog(@"不包含key=%@的属性",key);
        }
    }];
    [nav presentViewController:instance animated:YES completion:^{
        
    }];
    
    
}
/**
 *  检测对象是否存在该属性
 */
+ (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
{
    unsigned int outCount, i;
    
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance
                                                           class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    // 再遍历父类中的属性
    Class superClass = class_getSuperclass([instance class]);
    
    //通过下面的方法获取属性列表
    unsigned int outCount2;
    objc_property_t *properties2 = class_copyPropertyList(superClass, &outCount2);
    
    for (int i = 0 ; i < outCount2; i++) {
        objc_property_t property2 = properties2[i];
        //  属性名转成字符串
        NSString *propertyName2 = [[NSString alloc] initWithCString:property_getName(property2) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName2 isEqualToString:verifyPropertyName]) {
            free(properties2);
            return YES;
        }
    }
    free(properties2); //释放数组
    
    return NO;
}



@end
