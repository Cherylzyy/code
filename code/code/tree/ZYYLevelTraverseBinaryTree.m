//
//  ZYYLevelTraverseBinaryTree.m
//  code
//
//  Created by zoezyyzhang on 2024/8/10.
//

#import "ZYYLevelTraverseBinaryTree.h"
#import "ZYYBinaryTreeNode.h"
#import "ZYYQueue.h"

@interface ZYYLevelBinaryTreeNode : ZYYBinaryTreeNode

@property (nonatomic, assign) BOOL levelStart;

@property (nonatomic, assign) BOOL levelEnd;

@end

@implementation ZYYLevelBinaryTreeNode

@end


@implementation ZYYLevelTraverseBinaryTree

+ (NSArray<NSArray<NSNumber *> *> *)traverseTree:(ZYYBinaryTreeNode *)root {
    
    if (!root) {
        return nil;
    }
    
    //创建队列
    ZYYQueue *queue = [[ZYYQueue alloc] init];
    
    NSMutableArray<NSArray<NSNumber *> *> *levels = [[NSMutableArray alloc] init];
    NSMutableArray<NSNumber *> *level = [[NSMutableArray alloc] init];
    [queue enqueue:root];
    root.level = 1;
    NSInteger preLevelNum = 0;
    while (!queue.empty) {
        
        ZYYBinaryTreeNode *node = (ZYYBinaryTreeNode *)[queue head];
        //出队
        [queue dequeue];
    
        if (node.leftChild) {
            [queue enqueue:node.leftChild];
            node.leftChild.level = node.level + 1;
        }
        
        if (node.rightChild) {
            [queue enqueue:node.rightChild];
            node.rightChild.level = node.level + 1;
        }
        
        if (queue.empty) {
            [level addObject:@(node.nodeData)];
            [levels addObject:level.copy];
            break;
        }
        
        if (node.level == preLevelNum + 1 && node != root) {
            [levels addObject:level.copy];
            [level removeAllObjects];
        }
        
        [level addObject:@(node.nodeData)];
        preLevelNum = node.level;
    }
    
    return levels.copy;
}

+ (NSArray<NSArray<NSNumber *> *> *)traverseTree2:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return nil;
    }
    
    //创建队列
    ZYYQueue *queue = [[ZYYQueue alloc] init];
    
    NSMutableArray<NSArray<NSNumber *> *> *levels = [[NSMutableArray alloc] init];
    NSMutableArray<NSNumber *> *level = [[NSMutableArray alloc] init];
    [queue enqueue:root];
    while (!queue.empty) {
        NSInteger size = queue.size;
        for (int i = 0; i < size; i ++) {
            
            ZYYBinaryTreeNode *node = (ZYYBinaryTreeNode *)[queue head];
            [queue dequeue];
            [level addObject:@(node.nodeData)];
            
            if (node.leftChild) {
                [queue enqueue:node.leftChild];
            }
            if (node.rightChild) {
                [queue enqueue:node.rightChild];
            }
        }
        [levels addObject:level.copy];
        [level removeAllObjects];
    }
    return levels.copy;
}

@end
