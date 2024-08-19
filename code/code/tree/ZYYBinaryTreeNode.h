//
//  ZYYBinaryTreeNode.h
//  code
//
//  Created by zyy on 2024/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYYBinaryTreeNode : NSObject

@property (nonatomic, assign) NSInteger nodeData;
@property (nonatomic, strong) ZYYBinaryTreeNode *leftChild;
@property (nonatomic, strong) ZYYBinaryTreeNode *rightChild;

@property (nonatomic, assign) NSInteger level;

- (instancetype)initWithNodeData:(NSInteger)nodeData
                       leftChild:(nullable ZYYBinaryTreeNode *)leftChild
                      rightChild:(nullable ZYYBinaryTreeNode *)rightChild;

@end

NS_ASSUME_NONNULL_END
