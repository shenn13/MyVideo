//
//  MovieTabBarViewController.m
//  GetLocalVideo
//
//  Created by shen on 17/2/22.
//  Copyright © 2017年 com.picovr.picovr. All rights reserved.
//

#import "MovieTabBarViewController.h"
#import "WIFINavigationVC.h"
@interface MovieTabBarViewController ()

@end

@implementation MovieTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithRed:80.0/255 green:80.0/255 blue:80.0/255 alpha:1]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [self.tabBar setBarTintColor:kMainScreenColor];
    
    [self addSubViewsControllers];
    [self customItem];
    
}
-(void)addSubViewsControllers{
    NSArray *classTitles = @[@"MovieViewController",@"TVViewController",@"GreatVideoViewController",@"MySettingViewController"];
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:0];
    
    for (int i = 0; i < classTitles.count; i++) {
        
        Class cts = NSClassFromString(classTitles[i]);
        
        UIViewController *vc = [[cts alloc] init];
        WIFINavigationVC *naVC = [[WIFINavigationVC alloc] initWithRootViewController:vc];
        [mutArr addObject:naVC];
    }
    self.viewControllers = mutArr;
    
    
}

#pragma mark 设置item
-(void)customItem{
    
    NSArray *titles = @[@"电影",@"电视剧",@"精彩推荐",@"我的"];
    NSArray *normalImages = @[@"Movieimage",@"TVimage",@"greatvideoimage",@"my"];
    NSArray *selectImages = @[@"Movieimage-select",@"TVimage-select",@"greatvideoimage-select",@"my-select"];
    
    for (int i = 0; i < titles.count; i++) {
        
        UIViewController *vc = self.viewControllers[i];

        UIImage *normalImage = [UIImage imageWithOriginalImageName:normalImages[i]];
        UIImage *selectImage = [UIImage imageWithOriginalImageName:selectImages[i]];
        
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:normalImage selectedImage:selectImage];
        
    }
}



- (BOOL)shouldAutorotate
{
//    if ([self.selectedViewController isEqual:[self.viewControllers objectAtIndex:0]]) {
//        
//        return [self.selectedViewController shouldAutorotate];
//        
//    }
    return NO; // tabbar第一栏旋转控制交给下级控制器，其他栏不支持自动旋转
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
//    if ([self.selectedViewController isEqual:[self.viewControllers objectAtIndex:0]]) {
//        
//        return [self.selectedViewController supportedInterfaceOrientations];
//        
//    }
    
    return UIInterfaceOrientationMaskPortrait; // tabbar第一栏控制器所支持旋转方向交给下级控制器处理，其他栏只支持竖屏方向
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
