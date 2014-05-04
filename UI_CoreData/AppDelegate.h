//
//  AppDelegate.h
//  UI_CoreData
//
//  Created by 傅小柳 on 12/11/15.
//  Copyright (c) 2012年 傅小柳. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ViewController;  //用 class 避免交互引用

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
