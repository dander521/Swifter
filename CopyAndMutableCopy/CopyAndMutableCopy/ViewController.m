//
//  ViewController.m
//  CopyAndMutableCopy
//
//  Created by 倩倩 on 2018/10/17.
//  Copyright © 2018年 Swifter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Strong
@property (nonatomic, strong) NSString *sString;
@property (nonatomic, strong) NSArray *sArray;
// Copy
@property (nonatomic, copy) NSString *cString;
@property (nonatomic, copy) NSArray *cArray;

@property (nonatomic, copy) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // copy 对象的 副本是不可变对象 不可进行可变操作
    /*
    self.arr = [NSMutableArray new];
    [self.arr addObject:@"1"];
     */
    /*
    // 使用strong时，如果这个属性指向一个可变对象，修改可变对象时，这个属性值也会被修改
    NSMutableString *mString = [NSMutableString stringWithString:@"strong"];
    self.sString = mString;
    self.cString = mString;
    [mString appendString:@"_change"];
    NSLog(@"\n sString = %@ \n cString = %@", self.sString, self.cString);
    
    // NString，NSArray，NSDictionary都有自己对应的子类：NSMutableString，NSMutableArray，NSMutableDictionary，而父类指针可以指向子类对象，使用copy可以让本对象不受外界（子对象）影响，无论给我传入的是一个可变对象还是一个不可变对象，都能保证自身持有的是一个不可变副本
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@1, @2, @3,  nil];
    self.sArray = mArray;
    self.cArray = mArray;
    [mArray addObject:@4];
    NSLog(@"\n sArray = %@ \n cArray = %@", self.sArray, self.cArray);
    */
    
    // 浅拷贝：地址的拷贝
    // 深拷贝：内容的拷贝
    
    // 非集合对象的copy
    NSString *string = @"string";
    NSString *stringCopy = [string copy];
    NSString *stringMCopy = [string mutableCopy];
    NSLog(@"\nstring: \n%p \nstringCopy: \n%p \nstringMCopy: \n%p", string, stringCopy, stringMCopy);
    
    // 非集合对象的mutableCopy
    NSMutableString *mString = [NSMutableString stringWithString:@"mString"];
    NSString *mStringCopy = [mString copy];
    NSString *mStringMCopy = [mString mutableCopy];
    NSLog(@"\nmString: \n%p \nmStringCopy: \n%p \nmStringMCopy: \n%p", mString, mStringCopy, mStringMCopy);
    
    // 集合对象的copy NSArray，NSDictionary，NSSet
    NSArray *array = @[@1, @2, @3];
    NSArray *arrayCopy = [array copy];
    NSMutableArray *arrayMCopy = [array mutableCopy];
    NSLog(@"\narray: \n%p \narrayCopy: \n%p \narrayMCopy: \n%p", array, arrayCopy, arrayMCopy);
    
    // 集合对象的mutableCopy
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
    NSArray *mArrayCopy = [mArray copy];
    NSMutableArray *mArrayMCopy = [mArray mutableCopy];
    NSLog(@"\nmArray: \n%p \nmArrayCopy: \n%p \nmArrayMCopy: \n%p", mArray, mArrayCopy, mArrayMCopy);
    
    
}


@end
