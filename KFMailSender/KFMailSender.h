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
    KFMailInfoAppVersion = 1,
    KFMailInfoDeviceModelAndVersion = 2,
    KFMailInfoOtherInfo = 4,
    KFMailInfoAll = 63,
} KFMailInfo;

@interface KFMailSender : NSObject <MFMailComposeViewControllerDelegate,UINavigationControllerDelegate>

+ (KFMailSender*) initMailControllerWithParentViewController: (UIViewController*) viewController;
- (KFMailSender*) setSubject: (NSString*) subject message: (NSString*) message andTo: (NSArray*) recipients sendInfo: (KFMailInfo) info;
- (KFMailSender*) setOtherInfo: (NSString*) info;

- (void) showMail;
@end
