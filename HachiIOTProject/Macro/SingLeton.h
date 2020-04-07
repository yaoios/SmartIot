//
//  SingLeton.h
//  DuoLeRong
//
//  Created by iOSzhb on 16/4/5.
//  Copyright © 2016年 wangbin2. All rights reserved.
//

#define hc_singleton_h(bbgName) +(instancetype)share##bbgName


#if __has_feature(objc_arc) //ARC

#define hc_singleton_m(bbgName) \
static id _instace; \
+(id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken,^{ \
_instace = [super allocWithZone:zone];\
});\
return _instace;\
}\
\
+(instancetype)share##bbgName\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken,^{\
_instace = [[self alloc]init];\
});\
return _instace;\
}\

#else

#define bbg_singleton_m(bbgName) \
static id _instace; \
+(id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken,^{ \
_instace = [super allocWithZone:zone];\
});\
return _instace;\
}\
\
+(instancetype)share##bbgName\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken,^{\
_instace = [[self alloc]init];\
});\
return _instace;\
}\
-(oneway void)release\
{\
\
}\
\
-(id)autorelease\
{\
return _instace;\
}\
\
-(id)retain\
{\
return _instace;\
}\
\
+(id)copyWithZone:(struct _NSZone *)zone\
{\
return _instace;\
}\
\
-(NSUInteger)retainCount\
{\
return 1;\
}

#endif


