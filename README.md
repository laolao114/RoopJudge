# RoopJudge
## 如何判断一个链表是否包含环？
利用字典结构的key-value唯一性这个特性，遍历链表，把链表的节点地址依次放入字典中，在放入前检查字典中是否已包含对应的地址，如果已包含，说明原链表中包含环

```objective-c
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

```
