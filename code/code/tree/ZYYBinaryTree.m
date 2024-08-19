//
//  ZYYBinaryTree.m
//  code
//
//  Created by zyy on 2024/7/22.
//

#import "ZYYBinaryTree.h"
#import "ZYYBinaryTreeNode.h"
#import "ZYYStack.h"
#import "ZYYQueue.h"
#import "ZYYReverseNodeList.h"

@implementation ZYYBinaryTree

/** 根据二叉树的前序遍历序列和中序遍历序列构建一颗二叉树
 *
 *
 */

+ (ZYYBinaryTreeNode *)createBinaryTreeWithPreorder:(NSArray<NSNumber *> *)preorder 
                                            inorder:(NSArray<NSNumber *> *)inorder {
    return [self createBinaryTreeRecursiveWithPreorder:preorder
                                               inorder:inorder
                                           preorderLow:0
                                          preorderHigh:(preorder.count - 1)
                                            inorderLow:0
                                           inorderHigh:(inorder.count - 1)];
}

/** 根据二叉树的前序遍历序列和中序遍历序列构建一颗二叉树（递归）
 *
 *
 */

+ (ZYYBinaryTreeNode *)createBinaryTreeRecursiveWithPreorder:(NSArray<NSNumber *> *)preorder
                                            
                                                     inorder:(NSArray<NSNumber *> *)inorder
                                                 preorderLow:(NSInteger)preorderLow
                                                preorderHigh:(NSInteger)preorderHigh
                                                  inorderLow:(NSInteger)inorderLow
                                                 inorderHigh:(NSInteger)inorderHigh {
    
    if (preorderLow > preorderHigh) {
        return nil;
    }
    NSInteger nodeData = preorder[preorderLow].integerValue;
    if (preorderLow == preorderHigh) {
        return [[ZYYBinaryTreeNode alloc] initWithNodeData:nodeData leftChild:nil rightChild:nil];
    }
    ZYYBinaryTreeNode *node = [[ZYYBinaryTreeNode alloc] initWithNodeData:nodeData leftChild:nil rightChild:nil];
    NSInteger inorderIndex = inorderLow;
    while (inorder[inorderIndex].integerValue != nodeData) {
        inorderIndex ++;
    }
    node.leftChild = [self createBinaryTreeRecursiveWithPreorder:preorder
                                                         inorder:inorder
                                                     preorderLow:(preorderLow + 1)
                                                    preorderHigh:(preorderLow + inorderIndex - inorderLow)
                                                      inorderLow:inorderLow
                                                     inorderHigh:(inorderIndex - 1)];
    
    node.rightChild = [self createBinaryTreeRecursiveWithPreorder:preorder
                                                          inorder:inorder
                                                      preorderLow:(preorderLow + inorderIndex - inorderLow + 1)
                                                     preorderHigh:preorderHigh
                                                       inorderLow:(inorderIndex + 1)
                                                      inorderHigh:inorderHigh];
    return node;
}

/** 二叉树后序遍历
 *
 *
 */

+ (void)traversePostorder:(ZYYBinaryTreeNode *)root
                recursive:(BOOL)recursive {
    if (recursive) {
        [self traversePostorderRecursive:root];
    } else {
        [self traversePostorderNonRecursive:root];
    }
    
}

/** 二叉树后序遍历（非递归）
 *
 *
 */

+ (void)traversePostorderNonRecursive:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return;
    }
    ZYYStack *stack = [[ZYYStack alloc] init];
    ZYYStack *stack1 = [[ZYYStack alloc] init];
    [stack push:root];
    while (![stack empty]) {
        ZYYBinaryTreeNode *node = (ZYYBinaryTreeNode *)[stack top];
        //从stack 出栈之后，stack1入栈
        [stack pop];
        [stack1 push:node];
        
        if (node.leftChild) {
            [stack push:node.leftChild];
        }
        if (node.rightChild) {
            [stack push:node.rightChild];
        }
    }
    while (![stack1 empty]) {
        ZYYBinaryTreeNode *node = (ZYYBinaryTreeNode *)[stack1 top];
        
        //从stack1 出栈之后，输出节点
        [stack1 pop];
        NSLog(@"%@", @(node.nodeData));
    }
}
/** 二叉树后序遍历（递归）
 *
 *
 */
+ (void)traversePostorderRecursive:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return;
    }
    [self traversePostorderRecursive:root.leftChild];
    [self traversePostorderRecursive:root.rightChild];
    NSLog(@"%@", @(root.nodeData));
}

+ (void)traverseInorder:(ZYYBinaryTreeNode *)root
              recursive:(BOOL)recursive {
    if (recursive) {
        [self traverseInorderRecursive:root];
    } else {
        [self traverseInorderNonRecursive:root];
    }
    
}

/** 二叉树中序遍历（非递归）
 *
 *
 *
 **/

+ (void)traverseInorderNonRecursive:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return;
    }
    ZYYStack *stack = [[ZYYStack alloc] init];
    ZYYBinaryTreeNode *node = root;
    while (node) {
        [stack push:node];
        node = node.leftChild;
    }
    while (![stack empty]) {
        ZYYBinaryTreeNode *node = (ZYYBinaryTreeNode *)[stack top];
        
        //出栈的时候输出节点，此时这个节点的左子树已经全部输出，
        [stack pop];
        NSLog(@"%@", @(node.nodeData));
        
        //将右子树根节点入栈，然后将这个右子树根节点上的左子节点入栈
        node = node.rightChild;
        while (node) {
            [stack push:node];
            node = node.leftChild;
        }
    }
}

/** 二叉树中序遍历（递归）
 *
 *
 */

+ (void)traverseInorderRecursive:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return;
    }
    [self traverseInorderRecursive:root.leftChild];
    NSLog(@"%@", @(root.nodeData));
    [self traverseInorderRecursive:root.rightChild];
}

+ (void)traversePreoder:(ZYYBinaryTreeNode *)root
              recursive:(BOOL)recursive {
    if (recursive) {
        [self traversePreoderRecursive:root];
    } else {
        [self traversePreoderNonRecursive:root];
    }
    
    
}

/** 二叉树前序遍历（非递归）
 *
 *
 */
+ (void)traversePreoderNonRecursive:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return;
    }
    ZYYStack *stack = [[ZYYStack alloc] init];
    [stack push:root];
    while (![stack empty]) {
        ZYYBinaryTreeNode *node = (ZYYBinaryTreeNode *)[stack top];
        [stack pop];
        NSLog(@"%@", @(node.nodeData));
        if (node.rightChild) {
            [stack push:node.rightChild];
        }
        if (node.leftChild) {
            [stack push:node.leftChild];
        }
    }
}

/** 二叉树前序遍历（递归）
 *
 *
 */

+ (void)traversePreoderRecursive:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return;
    }
    NSLog(@"%@", @(root.nodeData));
    [self traversePreoderRecursive:root.leftChild];
    [self traversePreoderRecursive:root.rightChild];
}

/** 二叉树层序遍历（非递归）
 *
 *
 */

+ (void)traverseLevel:(ZYYBinaryTreeNode *)root {
    if (!root) {
        return;
    }
    ZYYQueue *queue = [[ZYYQueue alloc] init];
    [queue enqueue:root];
    while (![queue empty]) {
        ZYYBinaryTreeNode *node = (ZYYBinaryTreeNode *)[queue head];
        
        //出队的时候输出node
        [queue dequeue];
        NSLog(@"%@", @(node.nodeData));
        
        if (node.leftChild) {
            [queue enqueue:node.leftChild];
        }
        if (node.rightChild) {
            [queue enqueue:node.rightChild];
        }
    }
}

@end
