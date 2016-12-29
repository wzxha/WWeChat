//
//  AddressBookModel.m
//  WWeChat
//
//  Created by WzxJiang on 16/12/29.
//  Copyright © 2016年 wzxjiang. All rights reserved.
//

#import "AddressBookModel.h"

@implementation AddressBookModel

- (void)setName:(NSString *)name {
    _name = name;
    
    [self setIndexTitleWithName:name];
}

- (void)setIndexTitleWithName:(NSString *)name {
    _indexTitle = @"#";
    
    NSMutableString * source = [name mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    unichar firstChar = [source characterAtIndex:0];
    NSString * firstPhonetic = [NSString stringWithFormat:@"%c",firstChar];
    
    NSString *re = @"[A-Za-z]";
    NSRange range = [firstPhonetic rangeOfString:re options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        _indexTitle =  [firstPhonetic uppercaseString];
    }
}

@end
