//
//  DetailViewController.h
//  UIViewBorderDemo
//
//  Created by CuiPanJun on 15/7/17.
//  Copyright (c) 2015年 CuiPanJun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

