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
    NSString *nilStr = nil;
    NSArray *emArray = [NSArray new];
    NSArray *singlArray = @[@"1"];
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3",nil];
    [emArray objectAtIndexedSubscript:10];
    [singlArray objectAtIndex:4];
    [arr subarrayWithRange:NSMakeRange(50, 100)];
    [NSArray arrayWithObject:nilStr];
    NSString *strings[2];
    strings[0] = nilStr;
    strings[1] = @"2";
    [NSArray arrayWithObjects:strings count:2];
    [NSArray arrayWithObjects: nilStr, nil ];
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    [mutableArray removeObjectAtIndex:5];
    [[NSMutableArray new] addObject:nilStr];
    [mutableArray insertObject:nilStr atIndex:10];
    [mutableArray replaceObjectAtIndex:5 withObject:@"test"];
    [mutableArray removeObjectsInRange:NSMakeRange(50, 10)];
    
    NSDictionary *dict = @{@"name" : nilStr,@"age":@(27)};
    NSLog(@"%@",dict);
    
    
    
    NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"name",@"baxiang",@"age",@(27),nil];
    NSString *key = nil;
    [mdict removeObjectForKey:key];
    [mdict setObject:nilStr forKey:@"key"];
    
    NSString *testString = @"testString";
    [testString characterAtIndex:50];
    [testString substringFromIndex:50];
    [testString substringToIndex:50];
    [testString substringWithRange:NSMakeRange(0, 50)];
    
    [testString stringByReplacingOccurrencesOfString:nilStr withString:nilStr];
    NSString *str;
    [testString stringByReplacingOccurrencesOfString:@"test" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(100, 1000)];
    
     char *strChr = NULL;
    str = [NSString stringWithUTF8String:strChr];
    str = [NSString stringWithCString:strChr encoding:NSUTF8StringEncoding];
    str = [[NSString alloc] initWithCString:strChr encoding:NSUTF8StringEncoding];
    str = [[NSMutableString alloc] initWithCString:strChr encoding:NSUTF8StringEncoding];
   
    [testString stringByAppendingString:nilStr];
   
    [testString stringByReplacingCharactersInRange:NSMakeRange(0, 1000) withString:@"test"];
    
    NSMutableString *mutableStrTest = [NSMutableString stringWithString:nilStr];
    mutableStrTest = [[NSMutableString alloc] initWithString:nilStr];
    [mutableStrTest replaceCharactersInRange:NSMakeRange(0, 100) withString:@"test"];
    [mutableStrTest insertString:@"test" atIndex:100];
    [mutableStrTest deleteCharactersInRange:NSMakeRange(0, 100)];
    
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:testString];
    NSLog(@"%@",attributeStr);
    
    NSAttributedString *nilAttributedStr = nil;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithAttributedString:nilAttributedStr];
    NSLog(@"%@",attributedStr);
    
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor blueColor]};
    NSLog(@"%@",[[NSAttributedString alloc] initWithString:nilStr attributes:attributes]);
    
    NSLog(@"%@",[[NSMutableAttributedString alloc] initWithString:nilStr]);
    
    NSLog(@"%@",[[NSMutableAttributedString alloc] initWithString:nilStr attributes:attributes]);

    NSMutableSet *sets= [NSMutableSet new];
    [sets addObject:nilStr];
    
    
    NSSet *set = [NSSet setWithObject:nilStr];
    NSLog(@"%@",set);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
