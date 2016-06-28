#import <Foundation/Foundation.h>
#import <Sora/SoraMessage.h>

@interface SoraOfferResponse : SoraMessage

@property(nonatomic, readwrite, nonnull) NSString *clientId;
@property(nonatomic, readwrite, nonnull) NSString *SDP;

- (nullable instancetype)initWithClientId:(nonnull NSString *)clientId
                                      SDP:(nonnull NSString *)SDP;

- (nullable RTCSessionDescription *)sessionDescription;

@end