//
//  CommonMethods.m
//  TraitWare
//
//  Created by Ruvato on 22/04/2013.
//  Copyright (c) 2013 Ruvato. All rights reserved.
//

#import "CommonMethods.h"
#import <MediaPlayer/MediaPlayer.h>
#import "NSString+Additions.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <sys/sysctl.h>
#import "Constants.h"
#import "AppDelegate.h"


@implementation CommonMethods

+(void)setUpPageController:(UIPageControl*)pageController size:(int)size
{
    int pages = lroundf(size/24.0);
    float pages1 = size/24.0;
    if([[self currentDevice] isEqualToString:@"iphon4"])
    {
        pages = lroundf(size/20.0);
        pages1 = size/20.0;
    }
    
    NSLog(@"totalPages:%d totalElements:%f photos:%d",pages,pages1,size);
    pageController.numberOfPages = pages;
    pageController.currentPage = 0;
    
}

+(void)setUpPageController1:(UIPageControl*)pageController size:(int)size
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    int pages = lroundf(size/24.0);
    float pages1 = size/24.0;
    if([[self currentDevice] isEqualToString:@"iphon4"])
    {
        pages = lroundf(size/20.0);
        pages1 = size/20.0;
    }
    
    NSLog(@"totalPages:%d totalElements:%f photos:%d",pages,pages1,size);
    pageController.numberOfPages = [appDelegate.imagesLinks count];
    pageController.currentPage = 0;
    
}

+(NSString*)currentDevice
{
    CGSize iOSDeviceScreenSize = [[UIScreen mainScreen] bounds].size;
    if (iOSDeviceScreenSize.height == 480 || iOSDeviceScreenSize.width == 480)
    {
        return @"iphon4";
    }
    else if(iOSDeviceScreenSize.height == 568 || iOSDeviceScreenSize.width == 568)
    {
        return @"iphon5";
        
    }
    else
    {
        return @"ipad";
    }
    
}

+(void)showAlert:(NSString*)title message:(NSString*)msg 
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    

    [alert show];
    
}
                          
+(void)showAlert:(NSString*)title message:(NSString*)msg cancelButtonTitle:(NSString*)cancelTitle otherTitles:(NSString*)otherTitles
{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                     message:(NSString *)msg
                                                    delegate:(id)nil
                                           cancelButtonTitle:(NSString *)@"cancel"
                                           otherButtonTitles:(NSString *)otherTitles];
                           
    [alert show];
}
                               
+(void)setUserDefaultValue:(id)value forKey:(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    
    [prefs setValue:value forKey:key];
    [prefs synchronize];
}
+(id)getValueFromUserDefaultForKey:(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs objectForKey:key];
}

+(NSString*)convertToJson:(NSDictionary*)dic{
    
    //convert object to data
    NSError *error = [[NSError alloc] init];
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    NSString *JsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    
    return JsonString;
}

#pragma mark SignaturesCreatingMethods
+ (NSString*) createTraitSignatureAlbums
{
    NSArray *arrayOfSongs = [self fetchAlbumInfoAlgorithm];
    
    if(arrayOfSongs == nil) return nil;
    
    NSString *strSongs = [arrayOfSongs componentsJoinedByString:@""];
    
    if(strSongs) [strSongs Sha1EncryptString];
    
    return strSongs;
}



+ (NSArray*) fetchAlbumInfoAlgorithm
{
    NSMutableArray *arrayOfSongs = [NSMutableArray arrayWithCapacity:0];
    
    MPMediaQuery *query = [MPMediaQuery albumsQuery];
    NSArray *albums = [query collections];
    
    for (MPMediaItemCollection *albumCollection in albums)
    {
        //SArray *songs = albumCollection.items;
        for (MPMediaItem *song in albumCollection.items)
        {
            NSString *title = [song valueForProperty:MPMediaItemPropertyTitle];
            if(title)[arrayOfSongs addObject: [self truncateString:[title Sha1EncryptString]]];
        }
    }
    
    return arrayOfSongs;
}

+(NSString*)truncateString:(NSString*)str{
    ////NSLog(@"%@",str);
    NSRange stringRange = {0, MIN([str length], 8)};
    
    stringRange = [str rangeOfComposedCharacterSequencesForRange:stringRange];
    
    ////NSLog(@"%@",[str substringWithRange:stringRange]);
    return [str substringWithRange:stringRange];
}
+ (NSString*) clearExtraThingsFromString:(NSString*)str
{
    if(str == nil) return nil;
    
    NSCharacterSet *cleanUp = [NSCharacterSet characterSetWithCharactersInString:@"!@#$%^&*(){}[]/<>,.'\";:~`\\+=_- "];
    
    str = [[str componentsSeparatedByCharactersInSet: cleanUp] componentsJoinedByString: @""];
    //[str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}


@end
