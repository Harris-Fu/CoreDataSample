//
//  ViewController.m
//  UI_CoreData
//
//  Created by 傅小柳 on 12/11/15.
//  Copyright (c) 2012年 傅小柳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    AppDelegate *appDelegate;
}
@synthesize myNameTextField;
@synthesize myPhoneTextField;
@synthesize myEmailTextField;
@synthesize lblMessage;
@synthesize btnInsert;
@synthesize btnClear;
@synthesize btnFind;
@synthesize btnUpdate;
@synthesize btnDelete;

- (IBAction)finishTextFieldInput:(id)sender {
    
}

- (IBAction)insertBtn_Click:(id)sender {
    
    [self insertNewData];
}

- (IBAction)clearBtn_Click:(id)sender {
    

}

- (IBAction)findBtn_Click:(id)sender {
    
    if ([myNameTextField.text length] > 0) {
        myEmailTextField.text = @"";
        myPhoneTextField.text = @"";
        [self findData];
    }
}

- (IBAction)updateBtn_Click:(id)sender {
    
    if ([myNameTextField.text length] > 0) {
        [self updateData];
    }
}

- (IBAction)deleteBtn_Click:(id)sender {
    
    if ([myNameTextField.text length] > 0) {
        [self deleteData];
        myNameTextField.text = @"";
        myEmailTextField.text = @"";
        myPhoneTextField.text = @"";
    }
        

}

-(void) insertNewData {

    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObject *newPersonData;
    newPersonData = [NSEntityDescription insertNewObjectForEntityForName:@"Persons" inManagedObjectContext:context];
    
    //如果此欄位有資料
    if ([myNameTextField.text length] > 0) {
        [newPersonData setValue:myNameTextField.text forKey:@"name"];
        [newPersonData setValue:myPhoneTextField.text forKey:@"phone"];
        [newPersonData setValue:myEmailTextField.text forKey:@"email"];
        //輸入完成後欄位清空
        myNameTextField.text = @"";
        myPhoneTextField.text = @"";
        myEmailTextField.text = @"";
        NSError *error;
        if ([context save:&error]) {
            lblMessage.text = @"OK. New Data Saved";
        } else {
            lblMessage.text = [NSString stringWithFormat:@"Error:%@", [error localizedDescription]];
                                                                             //錯誤訊息本地化
        }
    } else {
        lblMessage.text = @"Please Input Data.";
    }
}

-(void) findData {

    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Persons" inManagedObjectContext:context];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)",myNameTextField.text];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entityDesc;
    request.predicate = pred;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        lblMessage.text = [NSString stringWithFormat:@"No match. Error:%@", [error localizedDescription]];
    } else {
        NSManagedObject *match = [objects objectAtIndex:0];
        myEmailTextField.text = [match valueForKey:@"email"];
        myPhoneTextField.text = [match valueForKey:@"phone"];
        lblMessage.text = [NSString stringWithFormat:@"%d matchs found.", [objects count]];
    }
}

-(void) updateData {

    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Persons" inManagedObjectContext:context];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)",myNameTextField.text];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entityDesc;
    request.predicate = pred;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        lblMessage.text = [NSString stringWithFormat:@"No match. Error:%@", [error localizedDescription]];
    } else {
        NSManagedObject *match = [objects objectAtIndex:0];
        [match setValue:myEmailTextField.text forKey:@"email"];
        [match setValue:myPhoneTextField.text forKey:@"phone"];
        lblMessage.text = [NSString stringWithFormat:@"Data Modified"];
        NSError *error;
        [context save:&error];
    }
        
}

-(void) deleteData {
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Persons" inManagedObjectContext:context];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)",myNameTextField.text];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entityDesc;
    request.predicate = pred;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        lblMessage.text = [NSString stringWithFormat:@"No match. Error:%@", [error localizedDescription]];
    } else {
        NSManagedObject *match = [objects objectAtIndex:0];
        [context deleteObject:match];

        lblMessage.text = [NSString stringWithFormat:@"Data deleted"];
        NSError *error;
        [context save:&error];
        
        myEmailTextField.text = @"";
        myNameTextField.text = @"";
        myPhoneTextField.text = @"";
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMyNameTextField:nil];
    [self setMyPhoneTextField:nil];
    [self setMyEmailTextField:nil];
    [self setLblMessage:nil];
    [self setBtnInsert:nil];
    [self setBtnClear:nil];
    [self setBtnFind:nil];
    [self setBtnUpdate:nil];
    [self setBtnDelete:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
