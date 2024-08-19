//
//  ZYYLevelTraverseBinaryTree.h
//  code
//
//  Created by zoezyyzhang on 2024/8/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ZYYBinaryTreeNode;

@interface ZYYLevelTraverseBinaryTree : NSObject

+ (NSArray<NSArray<NSNumber *> *> *)traverseTree:(ZYYBinaryTreeNode *)root;

+ (NSArray<NSArray<NSNumber *> *> *)traverseTree2:(ZYYBinaryTreeNode *)root;

@end

NS_ASSUME_NONNULL_END
