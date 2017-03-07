//
//  RBViewController.m
//  RBSafeKit
//
//  Created by baxiang on 03/07/2017.
//  Copyright (c) 2017 baxiang. All rights reserved.
//

#import "RBViewController.h"
@interface RBViewController ()

@end

@implementation RBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *testStr = nil;
    NSArray *testArray = @[@"333",testStr];
    NSLog(@"%@",testArray);
    NSArray *arr2 = @[@"1111", @"2222"];
    NSLog(@"%@",[arr2 objectAtIndexedSubscript:4]);
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3",nil];
    NSLog(@"%@",arr[4]);
    
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    [array removeObjectAtIndex:4];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name",@"baxiang",@"age",@(27),nil];
    NSString *key = nil;
    [dict removeObjectForKey:key];
    NSString *value = nil;
    [dict setObject:value forKey:@"key"];
    
    NSString *testString = @"testString";
    NSLog(@"--%c--",[testString characterAtIndex:50]);
    NSLog(@"--%@--",[testString substringFromIndex:50]);
    NSLog(@"--%@--",[testString substringToIndex:50]);
    NSLog(@"--%@--",[testString substringWithRange:NSMakeRange(0, 50)]);
    NSString *nilStr = nil;
    NSLog(@"%@",[testString stringByReplacingOccurrencesOfString:nilStr withString:nilStr]);
    
    
    NSString *str;
    NSRange range = NSMakeRange(0, 1000);
    str = [testString stringByReplacingOccurrencesOfString:@"test" withString:@"" options:NSCaseInsensitiveSearch range:range];
    NSLog(@"%@",str);
    
    
    str = [testString stringByReplacingCharactersInRange:NSMakeRange(0, 1000) withString:@"test"];
    NSLog(@"%@",str);
    
    
    
    
    NSMutableString *mutableStrTest = [NSMutableString stringWithString:nilStr];
//    
    [mutableStrTest replaceCharactersInRange:NSMakeRange(0, 100) withString:@"test"];
//    
    [mutableStrTest insertString:@"test" atIndex:100];
    
    [mutableStrTest deleteCharactersInRange:NSMakeRange(0, 100)];
    
    
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:testString];
    NSLog(@"%@",attributeStr);
    
    NSAttributedString *nilAttributedStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"%@",attributedStr);
    
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor redColor]
                                 };
    
    
    NSLog(@"%@",[[NSAttributedString alloc] initWithString:nilStr attributes:attributes]);
    
    NSLog(@"%@",[[NSMutableAttributedString alloc] initWithString:nilStr]);
    
    NSLog(@"%@",[[NSMutableAttributedString alloc] initWithString:nilStr attributes:attributes]);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
