//
//  ZYYBinaryTree.h
//  code
//
//  Created by zyy on 2024/7/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ZYYBinaryTreeNode;

@interface ZYYBinaryTree : NSObject

+ (ZYYBinaryTreeNode *)createBinaryTreeWithPreorder:(NSArray<NSNumber *> *)preorder
                                            inorder:(NSArray<NSNumber *> *)inorder;

+ (void)traversePreoder:(ZYYBinaryTreeNode *)root
              recursive:(BOOL)recursive;

+ (void)traverseInorder:(ZYYBinaryTreeNode *)root
              recursive:(BOOL)recursive;

+ (void)traversePostorder:(ZYYBinaryTreeNode *)root
                recursive:(BOOL)recursive;

+ (void)traverseLevel:(ZYYBinaryTreeNode *)root;

@end

NS_ASSUME_NONNULL_END
