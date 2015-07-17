# UIViewBorder
set each border for a UIView or UIView subclass instance seperatedly



# Demo
<img src="https://github.com/andy380743909/UIViewBorder/raw/master/ScreenShots/screenshot-1.png" style="width:320px;">

# Use
```
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
```
