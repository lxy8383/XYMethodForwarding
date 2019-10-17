//
//  People.m
//  MessageForwarding
//
//  Created by liu on 2019/10/16.
//  Copyright © 2019 liu. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>
#import "OtherPeople.h"


@implementation People


#pragma mark - 三步中的第一步

//void newSayHello(id self, SEL sel , NSString  * string)
//{
//    NSLog(@" --> %@", string);
//}
//+ (BOOL)resolveInstanceMethod:(SEL)sel
//{
//    NSLog(@"resolveInstanceMethod == %@",NSStringFromSelector(sel));
//
////    if(sel == @selector(sayHello)){
////
////        class_addMethod(self, sel, (IMP)newSayHello, "v@:");
////
////        return YES;
////    }
//    return [super resolveClassMethod:sel];
//}

// class 实现
//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    NSLog(@"resolveClassMethod%@",NSStringFromSelector(sel));
//    return [super resolveClassMethod:sel];
//}



#pragma mark - 三步中的第二步
//方法重定向
//可以创建一个其他类，类中定义方法，以及实现方法
//- (id)forwardingTargetForSelector:(SEL)aSelector
//{
//    NSLog(@"forwardingTargetForSelector : %@", NSStringFromSelector(aSelector));
//    return [[OtherPeople alloc]init];
//}


#pragma mark - 三步中的第三步
// 生成签名方法
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
//     转化字符
    NSString *sel = NSStringFromSelector(aSelector);
    //判断，手动生成签名
    if([sel isEqualToString:@"sayHello"]){
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else{
        return [super methodSignatureForSelector:aSelector];
    }
}
// 如何签名函数类中的方法 在.m 文件实现就可以，.h 文件没有实现可以， 签名访问的是私有方法
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"---> %@",anInvocation);
    
    //取到消息
    SEL seletor = [anInvocation selector];
    //转发
    OtherPeople *otherPeople = [[OtherPeople alloc]init];
    if([otherPeople respondsToSelector:seletor]){
        //调用对象,进行转发
        [anInvocation invokeWithTarget:otherPeople];
    }else{
        return [super forwardInvocation:anInvocation];
    }
}


@end
