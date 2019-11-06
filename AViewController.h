//
//  AViewController.h
//  test
//
//  Created by old's mac on 2017/6/28.
//  Copyright © 2017年 gzlc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AViewController : UIViewController

@end

@interface TreeNode : NSObject

@property (nonatomic, assign) int value;
@property (nonatomic, strong) TreeNode *nextNode;

@end

@implementation TreeNode

@end
