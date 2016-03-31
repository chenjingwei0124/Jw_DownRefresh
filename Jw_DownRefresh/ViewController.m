//
//  ViewController.m
//  Jw_DownRefresh
//
//  Created by Jw on 16/3/31.
//  Copyright © 2016年 Jw. All rights reserved.
//

#import "ViewController.h"
#import "Jw_DownRefresh-Swift.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollV.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2);
    
    [self setupPullToRefreshView:self.scrollV];
    
}

- (void)setupPullToRefreshView:(UIScrollView *)scrollView{
    
    DGElasticPullToRefreshLoadingViewCircle *cycle = [[DGElasticPullToRefreshLoadingViewCircle alloc]init];
    
    cycle.tintColor = [UIColor colorWithRed:0.29 green:0.77 blue:0.97 alpha:1.0];
    //    cycle.tintColor = [UIColor redColor];
    
    [scrollView dg_addPullToRefreshWithActionHandler:^{
        [scrollView dg_stopLoading];
        dispatch_async(dispatch_get_main_queue(), ^{
//            [self refreshCurrentViewData];
        });
        
    } loadingView:cycle];
    
    [scrollView dg_setPullToRefreshFillColor:[UIColor colorWithRed:0.06 green:0.2 blue:0.35 alpha:1]];
    
    [scrollView dg_setPullToRefreshBackgroundColor:[UIColor brownColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
