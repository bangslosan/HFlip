/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComHflipModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation ComHflipModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"37ab6982-66cb-4595-bb20-a8c2d3e2d02d";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.hflip";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

-(UIImage *)convertToUIImage:(id)param
{
    UIImage *source = nil;
    if ([param isKindOfClass:[TiBlob class]]){
        source = [param image];
    }else if ([param isKindOfClass:[UIImage class]]){
        source = param;
    }
    return source;
}

-(NSDictionary *)convertResultDic:(UIImage *)result
{
    TiBlob *blob = [[[TiBlob alloc]initWithImage:result]autorelease];
    NSDictionary *obj = [NSDictionary dictionaryWithObjectsAndKeys:blob,@"image",nil];
    return obj;
}

#pragma Public APIs

-(void)flipthis:(id)params
{
    
    UIImage* source = [self convertToUIImage:[params objectAtIndex:0]];
    UIImage* flippedImage = [UIImage imageWithCGImage:source.CGImage
                                                scale:1.0 orientation: UIImageOrientationUpMirrored];
    [self fireEvent:@"flipped" withObject:[self convertResultDic:flippedImage]];
    RELEASE_TO_NIL(source);
    RELEASE_TO_NIL(flippedImage);
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

@end
