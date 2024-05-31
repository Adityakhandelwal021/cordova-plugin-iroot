//
//  IRoot.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//  Techniques from http://highaltitudehacks.com/2013/12/17/ios-application-security-part-24-jailbreak-detection-and-evasion/
//

// #import "Cordova/CDV.h"
// #import "Cordova/CDVViewController.h"
// #import "IRoot.h"

// @implementation IRoot

// - (void) isRooted:(CDVInvokedUrlCommand*)command;
// {
//     CDVPluginResult *pluginResult;

//     @try
//     {
//         bool jailbroken = [self jailbroken];
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:jailbroken];
//     }
//     @catch (NSException *exception)
//     {
//         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.reason];
//     }
//     @finally
//     {
//         [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
//     }
// }

// - (bool) jailbroken {

// #if !(TARGET_IPHONE_SIMULATOR)

//     if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"])
//     {
//         return YES;
//     }

//     NSError *error;
//     NSString *testWriteText = @"Jailbreak test";
//     NSString *testWritePath = @"/private/jailbreaktest.txt";

//     [testWriteText writeToFile:testWritePath atomically:YES encoding:NSUTF8StringEncoding error:&error];

//     if (error == nil)
//     {
//         [[NSFileManager defaultManager] removeItemAtPath:testWritePath error:nil];
//         return YES;
//     }
//     else
//     {
//         [[NSFileManager defaultManager] removeItemAtPath:testWritePath error:nil];
//     }

//     if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]])
//     {
//         return YES;
//     }

// #endif

//     return NO;
// }

// @end
//
//  IRoot.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//  Techniques from http://highaltitudehacks.com/2013/12/17/ios-application-security-part-24-jailbreak-detection-and-evasion/
//

#import "Cordova/CDV.h"
#import "Cordova/CDVViewController.h"
#import "IRoot.h"

@implementation IRoot

- (void) isRooted:(CDVInvokedUrlCommand*)command;
{
    CDVPluginResult *pluginResult;

    @try
    {
        bool jailbroken = [self jailbroken];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:jailbroken];
    }
    @catch (NSException *exception)
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:exception.reason];
    }
    @finally
    {
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (bool) jailbroken {

#if !(TARGET_IPHONE_SIMULATOR)

    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"])
    {
        return YES;
    }
    // Added Sileo detection
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Sileo.app"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt/sources.list.d/sileo.sources"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/org.coolstar.sileo.list"])
    {
        return YES;
    }

// Added Frida detection
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/frida-server"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/bin/frida-server"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/local/bin/frida-server"])
    {
        return YES;
    }
    // Added Shadow detection
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Shadow.dylib"])
    {
        return YES;
    }
    // Added Substrate detection
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"])
    {
        return YES;
    }
    // Added Palera1n detection
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/binpack"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/jb"])
    {
        return YES;
    }
    // Added Substitute detection
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/lib/substitute-inserter.dylib"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/lib/substitute-loader.dylib"])
    {
        return YES;
    }
    else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt/sources.list.d/shadow.sources"])
    {
        return YES;
    }



    NSError *error;
    NSString *testWriteText = @"Jailbreak test";
    NSString *testWritePath = @"/private/jailbreaktest.txt";

    [testWriteText writeToFile:testWritePath atomically:YES encoding:NSUTF8StringEncoding error:&error];

    if (error == nil)
    {
        [[NSFileManager defaultManager] removeItemAtPath:testWritePath error:nil];
        return YES;
    }
    else
    {
        [[NSFileManager defaultManager] removeItemAtPath:testWritePath error:nil];
    }

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]])
    {
        return YES;
    }
    // Check for Sileo URL scheme
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sileo://package/com.example.package"]])
    {
        return YES;
    }

#endif

    return NO;
}

@end
