//
//  AViewController.m
//  test
//
//  Created by old's mac on 2017/6/28.
//  Copyright © 2017年 gzlc. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

// 创建一个随机链表，并且在index位置构成一个环
- (TreeNode *)createRandomTreeWithRoopAtIndex:(NSInteger)index andLength:(NSInteger)length {
    TreeNode *rootNode = [TreeNode new];
    rootNode.value = arc4random() % 50;
    TreeNode *lastNode = rootNode;
    TreeNode *roopNode = nil;
    for (int i = 0; i < length - 1; i++) {
        TreeNode *newNode = [TreeNode new];
        newNode.value = arc4random() % 50;
        if (i == index) {
            roopNode = newNode;
        }
        lastNode.nextNode = newNode;
        lastNode = newNode;
    }
    // 把尾部接上，形成闭环
    lastNode.nextNode = roopNode;
    return rootNode;
}

- (int)isTreeHasRoopPart:(TreeNode *)root {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    BOOL hasRoop = NO;
    int roopIndex = -1;
    while (!hasRoop && root.nextNode != nil) {
        roopIndex++;
        if (![dict objectForKey:root.description]) {
            [dict setObject:root forKey:root.description];
            root = root.nextNode;
        } else {
            hasRoop = YES;
        }
    }
    return roopIndex;
}

- (void)printTree:(TreeNode *)root maxPrintCount:(NSInteger)maxcount {
    int index = 0;
    while (root.nextNode != nil && index < maxcount) {
        NSLog(@"idx is %d, value is %d", index, root.value);
        root = root.nextNode;
        index++;
    }
}

- (void)viewDidLoad {
    TreeNode *root = [self createRandomTreeWithRoopAtIndex:5 andLength:10];
    [self printTree:root maxPrintCount:20];
    int roopIndex = [self isTreeHasRoopPart:root];
    if (roopIndex >= 0) {
        NSLog(@"This tree has roop");
    } else {
        NSLog(@"This tree has no roop");
    }
}

@end
