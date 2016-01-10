//
//  KFMailSender.m
//
//  Created by Kevin Fang on 1/2/16.
//  Copyright © 2016 Kevin Fang. All rights reserved.
//

#import "KFMailSender.h"

@interface KFMailSender ()

@property UIViewController* parent;
@property MFMailComposeViewController* mailer;
@property NSString* mail_subject;
@property NSString* mail_message;
@property KFMailInfo mail_info;
@property NSMutableArray* mail_recipients;


@end

@implementation KFMailSender

+ (KFMailSender *)initMailControllerWithParentViewController:(UIViewController *)viewController {
    KFMailSender* main = [[KFMailSender alloc] init];
    main.parent = viewController;
    return main;
}
- (KFMailSender *)setSubject:(NSString *)subject message:(NSString *)message andTo:(NSArray *)recipients sendInfo:(KFMailInfo)info {
    self.mailer = [[MFMailComposeViewController alloc] init];
    self.mail_subject = subject;
    self.mail_message = message;
    self.mail_recipients = [NSMutableArray arrayWithArray:recipients];
    self.mail_info = info;
    
    [self.mailer setSubject:self.mail_subject];
    [self.mailer setToRecipients:self.mail_recipients];
    
    return self;
}
- (void)showMail {
    if(self.parent == nil) {
        NSLog(@"MAIN VIEW CONTROLLER NOT DEFINED CAN'T SHOW");
        return;
    }
    self.mailer.delegate = self;
    
    //Message
    
    NSString* string = [self.mail_message stringByAppendingString:@"\n\n-------------------\n"];
    
    UIDevice* device = [UIDevice currentDevice];
    if(self.mail_info > 0) {
        NSString *appName =  [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
//        NSString * appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        string = [[string stringByAppendingString:@"\n"] stringByAppendingString:appName];
    }
    if((self.mail_info & KFMailInfoAppVersion) > 0) {
        NSString * appVersionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        NSString * appBuildString = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
        NSString * versionBuildString = [NSString stringWithFormat:@"App-Version: %@ (%@)", appVersionString, appBuildString];
        string = [[string stringByAppendingString:@"\n"] stringByAppendingString:versionBuildString];
    }
    if((self.mail_info & KFMailInfoDeviceModelAndVersion) > 0) {
        string = [[string stringByAppendingString:@"\n"] stringByAppendingString:[device model]];
        string = [[string stringByAppendingString:@", iOS "] stringByAppendingString:[device systemVersion]];
    }
    
    self.mail_message = string;
    [[self mailer] setMessageBody:self.mail_message isHTML:NO];
    [self.parent presentViewController:self.mailer animated:YES completion:nil];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [self.parent dismissViewControllerAnimated:YES completion:nil];
}
@end