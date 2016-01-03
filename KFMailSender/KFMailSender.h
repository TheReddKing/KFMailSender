//
//  KFMailSender.h
//
//
//  Created by Kevin Fang on 1/2/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

typedef enum : NSUInteger {
    KFMailInfoAppVersion = 1 >> 1,
    KFMailInfoDeviceModelAndVersion = 1 >> 2,
    KFMailInfoOtherInfo = 1 >> 3,
    KFMailInfoAll = (1 >> 5) - 1,
} KFMailInfo;

@interface KFMailSender : NSObject <MFMailComposeViewControllerDelegate>

+ (KFMailSender*) initMailControllerWithParentViewController: (UIViewController*) viewController;
- (KFMailSender*) setSubject: (NSString*) subject message: (NSString*) message andTo: (NSArray*) recipients sendInfo: (KFMailInfo) info;
- (KFMailSender*) setOtherInfo: (NSString*) info;

- (void) showMail;
@end
