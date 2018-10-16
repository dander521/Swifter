//
//  HelloClass.m
//  MessageTransform
//
//  Created by 倩倩 on 2018/10/16.
//  Copyright © 2018年 Swifter. All rights reserved.
//

#import "SportAction.h"
#import <objc/runtime.h>
#import "Bird.h"
#import "Coder.h"

void speak(id self, SEL _cmd) {
    NSLog(@"I can speak!");
}

@implementation SportAction

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod : %@", NSStringFromSelector(sel));
    if (sel == @selector(speak)) {
        class_addMethod([self class], sel, (IMP)speak, "V@:");
        return true;
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector : %@", NSStringFromSelector(aSelector));
    Bird *bird = [Bird new];
    if ([bird respondsToSelector:aSelector]) {
        return bird;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"methodSignatureForSelector : %@", NSStringFromSelector(aSelector));
    if (aSelector == @selector(code)) {
        return [NSMethodSignature signatureWithObjCTypes:"V@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation = %@", NSStringFromSelector([anInvocation selector]));
    if ([anInvocation selector] == @selector(code)) {
        Coder *coder = [Coder new];
        [anInvocation invokeWithTarget:coder];
    }
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"doesNotRecognizeSelector : %@", NSStringFromSelector(aSelector));
    [super doesNotRecognizeSelector:aSelector];
}

@end
