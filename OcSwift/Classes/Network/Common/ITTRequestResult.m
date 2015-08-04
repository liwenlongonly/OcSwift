//
//  HHRequestResult
//
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "ITTRequestResult.h"


@implementation ITTRequestResult
///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

-(id)initWithCode:(NSString*)code withMessage:(NSString*)message
{
    ITTDPRINT(@"code-> %@  message-> %@",code,message);
    self = [super init];
    if (self) {
        if ([code isKindOfClass:[NSString class]]||[code isKindOfClass:[NSNumber class]])
        {
            if ([code integerValue] == 0) {
                _code = @0;
            }else{
                _code = @([code integerValue]);
            }
        }else{
            _code = @(-1);
        }
        _message = message;
    }
    return self;
}

-(BOOL)isSuccess
{
    return (_code && [_code intValue] == 0);
}

-(void)showErrorMessage
{
    if (_message && _message.length > 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:_message
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
}

@end