//
//  AdsBookModel.m
//  DTZOCDate
//
//  Created by wuhaibin on 16/6/6.
//  Copyright © 2016年 wuhaibin. All rights reserved.
//

#import "AdsBookModel.h"
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>
#import "ContactModel.h"

@implementation AdsBookModel


- (void)getPersonWithDtzSuccessBlock:(DtzSuccessBlock)dtzSuccessBlock DtzFailBlock:(DtzFailBlock)dtzFailBlock {
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error){
            CFErrorRef *error1 = NULL;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
            // 如果没有设置权限 策略如何
            
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        CFErrorRef *error = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        //使用CNContact 来替换AddressBook框架
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        //创建通讯录对象
        CNContactStore * contactStore = [[CNContactStore alloc]init];
        NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey,CNContactThumbnailImageDataKey,CNContactImageDataKey];
        CNContactFetchRequest * request = [[CNContactFetchRequest alloc]initWithKeysToFetch:keys];
        
        NSMutableArray * contactsArray = [[NSMutableArray alloc]init];
        //遍历所有的联系人
        [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
            //初始化 ContactModel 并且Add 到ContactsArray中 用block 形式返回到ScheduleViewController 中在主线程中更新界面
            ContactModel * contactModel = [[ContactModel alloc]init];
            contactModel.mobilePhonesArray = [[NSMutableArray alloc] init];
            NSLog(@"familyName是%@",contact.familyName);
            NSLog(@"givenName是%@",contact.givenName);
            NSArray * phoneNums = contact.phoneNumbers;
            contactModel.familyName = contact.familyName;
            contactModel.givenName = contact.givenName;
            contactModel.imageData = contact.imageData;
            contactModel.thumbnailImageData = contact.thumbnailImageData;
            for (CNLabeledValue *labeledValue in phoneNums) {
                // 2.1.获取电话号码的KEY
                CNPhoneNumber *phoneNumer = labeledValue.value;
                NSString *phoneValue = phoneNumer.stringValue;
                [contactModel.mobilePhonesArray addObject:phoneValue];
                // 通过回调返回 contactModel // 需要去判断是否是11 位数再去判断 否则可能存在不是11位数的 手机号码出现
                NSLog(@"出现手机号码了%@",phoneValue);
            }
            [contactsArray addObject:contactModel];
        }];
        dtzSuccessBlock(contactsArray);
    }
    else {
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    }
}



@end
