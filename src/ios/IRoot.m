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



// IROOT Version 2 

// #import "Cordova/CDV.h"
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

//     //extra paths for Rema Team Suggestion start 


//      if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/blackra1n.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/FakeCarrier.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Icy.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/IntelliScreen.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/MxTube.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/RockApp.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/SBSettings.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/WinterBoard.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Veency.plist"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Shadow.dylib"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/Frameworks/Shadow.framework"])
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
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/libexec/sftp-server"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/cydia"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/mobile/Library/SBSettings/Themes"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/stash"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/tmp/cydia.log"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/System/Library/LaunchDaemons/com.ikey.bbot.plist"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/binpack"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/jb"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/lib/substitute-inserter.dylib"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/lib/substitute-loader.dylib"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt/sources.list.d/shadow.sources"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Sileo.app"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt/sources.list.d/sileo.sources"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/org.coolstar.sileo.list"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/frida-server"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/bin/frida-server"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/local/bin/frida-server"])
//     {
//         return YES;
//     }
//     else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/preboot/palera1n"])
//     {
//         return YES;
//     }

// //extra paths for Rema Team Suggestion End 

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



// paths for Rema suggestion start 

    // // Check for Frida URL scheme
    // else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"frida://"]])
    // {
    //     return YES;
    // }
    // // Check for Shadow URL scheme
    // else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"shadow://"]])
    // {
    //     return YES;
    // }
    // // Check for Substrate URL scheme
    // else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"substrate://"]])
    // {
    //     return YES;
    // }
    // // Check for Palera1n URL scheme
    // else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"palera1n://"]])
    // {
    //     return YES;
    // }
    // // Check for Substitute URL scheme
    // else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"substitute://"]])
    // {
    //     return YES;
    // }

    // paths for Rema suggestion start End

#endif

    return NO;
}

@end



//
//  IRoot.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//  Techniques from http://highaltitudehacks.com/2013/12/17/ios-application-security-part-24-jailbreak-detection-and-evasion/
//

//
//  IRoot.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//  Techniques from http://highaltitudehacks.com/2013/12/17/ios-application-security-part-24-jailbreak-detection-and-evasion/
//

//
//  IRoot.m
//  Copyright (c) 2014 Lee Crossley - http://ilee.co.uk
//  Techniques from http://highaltitudehacks.com/2013/12/17/ios-application-security-part-24-jailbreak-detection-and-evasion/
//


