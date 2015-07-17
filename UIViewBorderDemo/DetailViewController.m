//
//  DetailViewController.m
//  UIViewBorderDemo
//
//  Created by CuiPanJun on 15/7/17.
//  Copyright (c) 2015年 CuiPanJun. All rights reserved.
//

#import "DetailViewController.h"

#import "UIView+Border.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    
    
    
    [self setupTestBorder];
    
    
    
}

- (void)setupTestBorder{
    
    CGFloat itemWidth = CGRectGetWidth((self.view.frame))/3;
    CGFloat itemHeight = 100;
    
    int maxRow = 2;
    int maxCol = 3;
    
    for (int row = 0; row < maxRow; row++) {
        for (int col = 0; col < maxCol; col++) {
            
            UIView *testBorderView = [[UIView alloc] initWithFrame:CGRectMake(col*(itemWidth), 100+row*itemHeight, itemWidth, itemHeight)];
            CALayer *layer = testBorderView.layer;
            layer.shadowColor = [UIColor blackColor].CGColor;
            layer.shadowOpacity = 0.0f;
            layer.shadowOffset = CGSizeZero;
            
            testBorderView.backgroundColor = [UIColor whiteColor];
            // Test
            
            NSDictionary *styleTop = @{
                                       @"width":@(1),
                                       @"inset":NSStringFromUIEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 0)),
                                       @"color":[UIColor redColor]
                                       };
            
            if (row == 0) {
                [testBorderView setBorderWithStyle:styleTop forEdge:UIViewBorderEdgeTop];
            }
            
            /*
            NSDictionary *styleLeft = @{
                                        @"width":@(1),
                                        @"inset":NSStringFromUIEdgeInsets(UIEdgeInsetsMake((row==0)?10:0, 0, (row==maxRow-1)?10:0, 0)),
                                        @"color":[UIColor greenColor]
                                        };
            
            if (col == 0) {
                [testBorderView setBorderWithStyle:nil forEdge:UIViewBorderEdgeLeft];
            }else{
                [testBorderView setBorderWithStyle:styleLeft forEdge:UIViewBorderEdgeLeft];
            }
            */
            
            NSDictionary *styleRight = @{
                                         @"width":@(1),
                                         @"inset":NSStringFromUIEdgeInsets(UIEdgeInsetsMake((row==0)?10:0, 0, (row==maxRow-1)?10:0, 0)),
                                         @"color":[UIColor blueColor]
                                         };
            if (col==maxCol-1) {
                [testBorderView setBorderWithStyle:nil forEdge:UIViewBorderEdgeRight];
            }else{
                [testBorderView setBorderWithStyle:styleRight forEdge:UIViewBorderEdgeRight];
            }
            NSDictionary *styleBottom = @{
                                          @"width":@(1),
                                          @"inset":NSStringFromUIEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 0)),
                                          @"color":[UIColor purpleColor]
                                          };
            
            [testBorderView setBorderWithStyle:styleBottom forEdge:UIViewBorderEdgeBottom];
            
            [self.view addSubview:testBorderView];
            
        }
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
