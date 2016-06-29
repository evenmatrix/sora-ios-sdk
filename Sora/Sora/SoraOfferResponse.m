#import "SoraOfferResponse.h"
#import "SoraError.h"

static NSString * const ClientIdKey = @"client_id";
static NSString * const SDPKey = @"sdp";
static NSString * const TypeKey = @"type";

@implementation SoraOfferResponse

- (nullable instancetype)initWithClientId:(nonnull NSString *)clientId
                                      SDP:(nonnull NSString *)SDP
{
    self = [super init];
    if (self != nil) {
        self.clientId = clientId;
        self.SDP = SDP;
    }
    return self;
}

- (SoraMessageType)messageType
{
    return SoraMessageTypeOffer;
}

- (nullable RTCSessionDescription *)sessionDescription
{
    return [[RTCSessionDescription alloc] initWithType: SoraSessionDescriptionTypeOffer
                                                   sdp: self.SDP];
}

#pragma mark SoraJSONEncoding

- (BOOL)decodeWithJSONObject:(nonnull NSDictionary *)dict
                      error:(NSError * _Nullable *_Nullable)error
{
    if ((self.clientId = dict[SoraMessageJSONKeyClientId]) == nil) {
        if (error != nil)
            *error = [SoraError JSONKeyNotFoundError: SoraMessageJSONKeyClientId];
        return NO;
    }
    if ((self.SDP = dict[SoraMessageJSONKeySDP]) == nil) {
        if (error != nil)
            *error = [SoraError JSONKeyNotFoundError: SoraMessageJSONKeySDP];
        return NO;
    }
    return YES;
}

- (void)encodeIntoJSONObject:(nonnull NSMutableDictionary *)dict
{
    [super encodeIntoJSONObject: dict];
    dict[SoraMessageJSONKeyClientId] = self.clientId;
    dict[SoraMessageJSONKeySDP] = self.SDP;
}

@end
