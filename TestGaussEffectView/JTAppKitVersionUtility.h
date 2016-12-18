//
//  JTAppKitVersionUtility.h
//  JietuMac
//
//  Created by Yiqi Wang on 16/7/27.
//  Copyright © 2016年 Yiqi Wang. All rights reserved.
//

#ifndef JTAppKitVersionUtility_h
#define JTAppKitVersionUtility_h

#ifndef NSAppKitVersionNumber10_9
#define NSAppKitVersionNumber10_9 1265
#endif

#ifndef NSAppKitVersionNumber10_10
#define NSAppKitVersionNumber10_10 1343
#endif

NS_INLINE BOOL IsHigherThanMavericks() {
    return (NSInteger)NSAppKitVersionNumber >= NSAppKitVersionNumber10_9;
}

NS_INLINE BOOL IsHigherThanYosemite() {
    return (NSInteger)NSAppKitVersionNumber >= NSAppKitVersionNumber10_10;
}

#endif /* JTAppKitVersionUtility_h */
