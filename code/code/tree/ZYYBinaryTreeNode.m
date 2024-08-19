//
//  ZYYBinaryTreeNode.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ZYYBinaryTreeNode.h"

@implementation ZYYBinaryTreeNode

- (instancetype)initWithNodeData:(NSInteger)nodeData
                       leftChild:(nullable ZYYBinaryTreeNode *)leftChild
                      rightChild:(nullable ZYYBinaryTreeNode *)rightChild {
    self = [super init];
    if (self) {
        self.nodeData = nodeData;
        self.leftChild = leftChild;
        self.rightChild = rightChild;
    }
    return self;
}

@end
