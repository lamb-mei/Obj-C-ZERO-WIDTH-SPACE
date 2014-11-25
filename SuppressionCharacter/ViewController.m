//
//  ViewController.m
//  SuppressionCharacter
//
//  Created by 羊小咩 on 2014/11/25.
//  Copyright (c) 2014年 羊小咩. All rights reserved.
//


//ZERO-WIDTH-SPACE(ZWSP)
// http://en.wikipedia.org/wiki/Zero-width_space
//



#import "ViewController.h"


#define TEST_URL @"​​http://www.googole.com1"

//含有兩個(ZWSP)
#define AP_URL @"​​http://www.lamb-mei.com"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@" ,TEST_URL); //看不見
    NSLog(@"%@" ,[self escapesURL:TEST_URL]); //含有 %E2%80%8B
    
    NSLog(@"%@" ,AP_URL); //看不見
    NSLog(@"%@" ,[self escapesURL:AP_URL]); //含有 %E2%80%8B
    
    NSString *nstr = [self removeZeroWdthSpace:AP_URL];
    NSLog(@"%@" ,nstr);
    NSLog(@"%@" ,[self escapesURL:nstr]); //已清除 ZWSP
    
}

//清除 ZWSP
-(NSString *)removeZeroWdthSpace:(NSString *) string
{
    NSString* pString = @"\u200B";
    return [string stringByReplacingOccurrencesOfString:pString withString:@""];
}


//Encoding
-(NSString *)escapesURL:(NSString *) string
{
    return [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
