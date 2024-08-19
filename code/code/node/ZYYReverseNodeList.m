//
//  ZYYReverseNodeList.m
//  code
//
//  Created by zoezyyzhang on 2024/8/6.
//

#import "ZYYReverseNodeList.h"

#import "ZYYNode.h"

@implementation ZYYReverseNodeList

+ (void)showNodeList:(ZYYNode *)head {
    ZYYNode *pNode = head;
    while (pNode) {
        NSLog(@"%@", @(pNode.value));
        pNode = pNode.next;
    }
}

+ (ZYYNode *)createNodeListWithArray:(NSArray<NSNumber *> *)array {
    if (array.count == 0) {
        return nil;
    }
    ZYYNode *head = [[ZYYNode alloc] init];
    head.value = array[0].integerValue;
    head.next = nil;
    ZYYNode *pNode = head;
    for (int i = 1; i < array.count; i++) {
        ZYYNode *node = [[ZYYNode alloc] init];
        node.value = array[i].intValue;
        node.next = nil;
        pNode.next = node;
        pNode = pNode.next;
    }
    return head;
}

+ (ZYYNode *)reverseNodeList:(ZYYNode *)head
                   recursive:(BOOL)recursive {
    if (recursive) {
        return [self reverseNodeListRecursive:head];
    }
    return [self reverseNodeListNoRecursive:head];
}

+ (ZYYNode *)reverseNodeListNoRecursive:(ZYYNode *)head {
    if (!head || !head.next) {
        return head;
    }
    ZYYNode *reversedHead = head;
    ZYYNode *unReversedHead = head.next;
    reversedHead.next = nil;
    while (unReversedHead) {
        ZYYNode *temp = unReversedHead.next;
        unReversedHead.next = reversedHead;
        reversedHead = unReversedHead;
        unReversedHead = temp;
    }
    return reversedHead;
}

+ (ZYYNode *)reverseNodeListRecursive:(ZYYNode *)head {
    if (!head || !head.next) {
        return head;
    }
    
    ZYYNode *pNode = [self reverseNodeListRecursive:head.next];
    head.next.next = head;
    head.next = nil;
    return pNode;
}

@end
