//
//  ContactModel.h
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/20.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactModel : NSObject

@property (strong, nonatomic) NSMutableArray * mobilePhonesArray;
@property (strong, nonatomic) NSString * nickName;
@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * familyName;
@property (strong, nonatomic) NSString * address;
@property (strong, nonatomic) NSString * givenName;
@property (strong, nonatomic) NSData * imageData;
@property (strong, nonatomic) NSData * thumbnailImageData;

@end
