//
//  KeyChain.h
//  Randomer
//
//  Created by 王子轩 on 16/4/9.
//  Copyright © 2016年 com.wzx. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface KeyChain : NSObject

//MARK: - Basic
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKey:(NSString *)service;


+ (void)saveAccount:(NSString *)account;
+ (NSString *)account;

+ (void)savePassword:(NSString *)password;
+ (NSString *)password;

@end
