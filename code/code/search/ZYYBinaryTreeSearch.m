//
//  ZYYBinaryTreeSearch.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYBinaryTreeSearch.h"
#import "ZYYBinaryTreeNode.h"

@implementation ZYYBinaryTreeSearch

+ (ZYYBinaryTreeNode *)binaryTreeSearch:(ZYYBinaryTreeNode *)root 
                                    key:(NSInteger)key
                              recursive:(BOOL)recursive {
    if (recursive) {
        return [self binaryTreeSearchRecursive:root key:key];
    }
    return [self binaryTreeSearchNonRecursive:root key:key];
}

+ (ZYYBinaryTreeNode *)binaryTreeSearchRecursive:(ZYYBinaryTreeNode *)root
                                             key:(NSInteger)key {
    if (!root) {
        return nil;
    }
    
    if (root.nodeData == key) {
        return root;
    } else if (root.nodeData > key) {
        return [self binaryTreeSearchRecursive:root.leftChild key:key];
    } else {
        return [self binaryTreeSearchRecursive:root.rightChild key:key];
    }
}

+ (ZYYBinaryTreeNode *)binaryTreeSearchNonRecursive:(ZYYBinaryTreeNode *)root
                                                key:(NSInteger)key {
    ZYYBinaryTreeNode *treeNode = root;
    while (treeNode) {
        if (treeNode.nodeData == key) {
            return treeNode;
        } else if (treeNode.nodeData > key) {
            treeNode = treeNode.leftChild;
        } else {
            treeNode = treeNode.rightChild;
        }
    }
    return nil;
}

@end
