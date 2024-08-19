//
//  ViewController.m
//  code
//
//  Created by zyy on 2024/7/21.
//

#import "ViewController.h"
#import "ZYYOrderSearch.h"
#import "ZYYBinarySearch.h"
#import "ZYYBinaryTreeSearch.h"
#import "ZYYBinaryTreeNode.h"
#import "ZYYBubbleSort.h"
#import "ZYYSelectionSort.h"
#import "ZYYInsertionSort.h"
#import "ZYYMergeSort.h"
#import "ZYYQuickSort.h"
#import "ZYYBinaryTree.h"
#import "ZYYNode.h"
#import "ZYYReverseNodeList.h"
#import "ZYYLevelTraverseBinaryTree.h"
#import "ZYYStockProfile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    //[self testOrderSearch];
    //[self testBinarySearch];
    //[self testBinaryTreeSearch];
    //[self testBubbleSort];
    //[self testSelectionSort];
    //[self testInsertionSort];
    //[self testMergeSort];
    //[self testQuickSort];
    //[self testTraverseTree];
    //[self testReverseNodeList];
    //[self testLevelTraverseBinaryTree];
    [self testStockProfile];
}

- (void)testOrderSearch {
    NSArray *array = @[@2, @3, @(-1), @(7)];
    NSInteger key = -1;
    NSInteger index = [ZYYOrderSearch orderSearch:array key:key];
    NSLog(@"OrderSearch index = %@", @(index));
}

- (void)testBinarySearch {
    NSArray *array = @[@(-3), @0, @(8), @(9), @(12)];
    NSInteger key = 12;
    
    NSInteger indexRecursive = [ZYYBinarySearch binarySearch:array key:key recursive:YES];
    NSInteger indexNonRecursive = [ZYYBinarySearch binarySearch:array key:key recursive:NO];
    NSLog(@"BinarySearch indexRecursive = %@, indexNonRecursive = %@", @(indexRecursive), @(indexNonRecursive));
}

- (void)testBinaryTreeSearch {
    
    NSInteger key = 10;
    
    ZYYBinaryTreeNode *left = [[ZYYBinaryTreeNode alloc] initWithNodeData:-2 leftChild:nil rightChild:nil];
    ZYYBinaryTreeNode *right = [[ZYYBinaryTreeNode alloc] initWithNodeData:20 leftChild:nil rightChild:nil];
    ZYYBinaryTreeNode *root = [[ZYYBinaryTreeNode alloc] initWithNodeData:10 leftChild:left rightChild:right];
    ZYYBinaryTreeNode *nodeRecursive = [ZYYBinaryTreeSearch binaryTreeSearch:root key:key recursive:YES];
    ZYYBinaryTreeNode *nodeNonRecursive = [ZYYBinaryTreeSearch binaryTreeSearch:root key:key recursive:NO];
    NSLog(@"BinaryTreeSearch nodeRecursive = %@, nodeNonRecursive = %@", nodeRecursive, nodeNonRecursive);
}

- (void)testBubbleSort {
    NSMutableArray *array = @[@(7), @(0), @(-1), @(-20), @(80)].mutableCopy;
    //array = @[@(80)].mutableCopy;
    [ZYYBubbleSort bubbleSort:array];
    NSLog(@"BubbleSort array = %@", array);
}

- (void)testSelectionSort {
    NSMutableArray *array = @[@(7), @(0), @(-1), @(-20), @(80)].mutableCopy;
    //array = @[@(80)].mutableCopy;
    [ZYYSelectionSort selectionSort:array];
    NSLog(@"SelectionSort array = %@", array);
}

- (void)testInsertionSort {
    NSMutableArray *array = @[@(7), @(0), @(-1), @(-20), @(-20), @(80)].mutableCopy;
    //array = @[@(80)].mutableCopy;
    [ZYYInsertionSort insertionSort:array];
    NSLog(@"InsertionSort array = %@", array);
}

- (void)testMergeSort {
    NSMutableArray *array = @[@(7), @(0), @(-1), @(-20), @(-20), @(80), @(3)].mutableCopy;
    //array = @[@(80)].mutableCopy;
    [ZYYMergeSort mergeSort:array recursive:YES];
    NSLog(@"MergeSort recursive array = %@", array);
    
    NSMutableArray *array1 = @[@(7), @(0), @(-1), @(-20), @(-20), @(80), @(3)].mutableCopy;
    [ZYYMergeSort mergeSort:array1 recursive:NO];
    NSLog(@"MergeSort non recursive array1 = %@", array1);
    
}

- (void)testQuickSort {
    NSMutableArray *array = @[@(7), @(0), @(-1), @(-20), @(-20), @(80), @(3)].mutableCopy;
    //array = @[@(80)].mutableCopy;
    
    [ZYYQuickSort quickSort:array recusive:YES];
    NSLog(@"QuickSort recursive array = %@", array);
    
    NSMutableArray *array1 = @[@(7), @(0), @(-1), @(-20), @(-20), @(80), @(3)].mutableCopy;
    [ZYYQuickSort quickSort:array1 recusive:NO];
    NSLog(@"QuickSort non recursive array1 = %@", array1);
    
}

- (void)testTraverseTree {
    //前序遍历 preorder = [3,9,20,15,7]
    //中序遍历 inorder = [9,3,15,20,7]
    //后序遍历 postorder = [9,15,7,20,3]
    NSArray *preorder = @[@3, @9, @20, @15, @7];
    NSArray *inorder = @[@9, @3, @15, @20, @7];
    ZYYBinaryTreeNode *root = [ZYYBinaryTree createBinaryTreeWithPreorder:preorder inorder:inorder];
    NSLog(@"TraversePreoderTree recursive");
    [ZYYBinaryTree traversePreoder:root recursive:YES];
    NSLog(@"TraversePreoderTree nonrecursive");
    [ZYYBinaryTree traversePreoder:root recursive:NO];
    
    NSLog(@"TraverseInorderTree recursive");
    [ZYYBinaryTree traverseInorder:root recursive:YES];
    
    NSLog(@"TraverseInorderTree nonrecursive");
    [ZYYBinaryTree traverseInorder:root recursive:NO];
    
    NSLog(@"TraversePostorderTree recursive");
    [ZYYBinaryTree traversePostorder:root recursive:YES];
    
    NSLog(@"TraversePostorderTree nonrecursive");
    [ZYYBinaryTree traversePostorder:root recursive:NO];
    
    NSLog(@"TraverseLevelTree");
    [ZYYBinaryTree traverseLevel:root];
    
}

- (void)testReverseNodeList {
    NSArray *array = @[@1, @2, @3, @4, @5, @6];
    ZYYNode *head = [ZYYReverseNodeList createNodeListWithArray:array];
    NSLog(@"testReverseNodeList 顺序输出：");
    [ZYYReverseNodeList showNodeList:head];
    head = [ZYYReverseNodeList reverseNodeList:head recursive:NO];
    NSLog(@"testReverseNodeList 非递归反转之后输出：");
    [ZYYReverseNodeList showNodeList:head];
    
    head = [ZYYReverseNodeList createNodeListWithArray:array];
    NSLog(@"testReverseNodeList 顺序输出：");
    [ZYYReverseNodeList showNodeList:head];
    head = [ZYYReverseNodeList reverseNodeList:head recursive:YES];
    NSLog(@"testReverseNodeList 递归反转之后输出：");
    [ZYYReverseNodeList showNodeList:head];
    
    
}

- (void)testLevelTraverseBinaryTree {
    NSArray *preorder = @[@1, @2, @4, @5, @3];
    NSArray *inorder = @[@4, @2, @5, @1, @3];
    ZYYBinaryTreeNode *root = [ZYYBinaryTree createBinaryTreeWithPreorder:preorder inorder:inorder];
    
    //NSArray *array = [ZYYLevelTraverseBinaryTree traverseTree:root];
    NSArray *array = [ZYYLevelTraverseBinaryTree traverseTree2:root];
    NSLog(@"testLevelTraverseBinaryTree array = %@", array);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    UIControl *c = [[UIControl alloc] initWithFrame:CGRectZero];
//    UIScrollView *s = [[UIScrollView alloc] initWithFrame:CGRectZero];
}

- (void)testStockProfile {
    NSArray *array = @[@9, @11,@8,@5, @7, @12, @16, @14];
    //array = @[@7, @6, @4, @3, @1];
    NSInteger maxProfile = [ZYYStockProfile maxStockProfileforOneTransaction:array];
    NSLog(@"testStockProfile maxStockProfileforOneTransaction = %@", @(maxProfile));
    
    maxProfile = [ZYYStockProfile dpMaxStockProfileforOneTransaction:array];
    NSLog(@"testStockProfile dpMaxStockProfileforOneTransaction = %@", @(maxProfile));
    
    array = @[@10, @1, @5, @3, @6, @4];
    //array = @[@7, @6, @4, @3, @1];
    maxProfile = [ZYYStockProfile dpMaxStockProfileforMultipleTransaction:array];
    NSLog(@"testStockProfile dpMaxStockProfileforMultipleTransaction = %@", @(maxProfile));
    
    array = @[@3, @3, @5, @0, @0, @3, @1, @4];
    maxProfile = [ZYYStockProfile dpMaxStockProfileforAtMostTwiceTransaction:array];
    NSLog(@"testStockProfile dpMaxStockProfileforAtMostTwiceTransaction = %@", @(maxProfile));
    
}


@end
