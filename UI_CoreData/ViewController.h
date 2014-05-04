//
//  ViewController.h
//  UI_CoreData
//
//  Created by 傅小柳 on 12/11/15.
//  Copyright (c) 2012年 傅小柳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *myNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *myPhoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *myEmailTextField;
@property (strong, nonatomic) IBOutlet UILabel *lblMessage;
@property (strong, nonatomic) IBOutlet UIButton *btnInsert;
@property (strong, nonatomic) IBOutlet UIButton *btnClear;
@property (strong, nonatomic) IBOutlet UIButton *btnFind;
@property (strong, nonatomic) IBOutlet UIButton *btnUpdate;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;

- (IBAction)finishTextFieldInput:(id)sender;
- (IBAction)insertBtn_Click:(id)sender;
- (IBAction)clearBtn_Click:(id)sender;
- (IBAction)findBtn_Click:(id)sender;
- (IBAction)updateBtn_Click:(id)sender;
- (IBAction)deleteBtn_Click:(id)sender;



@end
