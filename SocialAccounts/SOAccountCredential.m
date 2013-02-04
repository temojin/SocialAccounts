//
// Copyright 2011-2012 Adar Porat (https://github.com/aporat)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "SOAccountCredential.h"

@implementation SOAccountCredential

- (id)initWithOAuth2Token:(NSString *)token
             refreshToken:(NSString *)refreshToken
               expiryDate:(NSDate *)expiryDate {
    self = [super initWithOAuth2Token:token refreshToken:refreshToken expiryDate:expiryDate];
    
    self.credentialType = SOAccountCredentialTypeOAuth2;
    
    return self;
}

- (id)initWithOAuthToken:(NSString *)token tokenSecret:(NSString *)secret {
    self = [super initWithOAuthToken:token tokenSecret:secret];
    
    self.oauth1Token = token;
    self.oauth1Secret = secret;
    
    self.credentialType = SOAccountCredentialTypeOAuth1;
    
    return self;
}

- (NSDictionary*)info {
    if (self.credentialType==SOAccountCredentialTypeOAuth2) {
        return @{@"access_token": self.oauthToken, @"scope" : self.scope};
    } else if (self.credentialType==SOAccountCredentialTypeOAuth1) {
        return @{@"oauth_token": self.oauth1Token, @"oauth_token_secret" : self.oauth1Secret};
    }
    
    return [NSDictionary dictionary];
}

@end