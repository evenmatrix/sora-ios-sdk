import Foundation
import WebRTC
import SocketRocket
import UIKit

public enum ConnectionError: Error {
    case failureSetConfiguration(RTCConfiguration)
    case connectionWaitTimeout
    case connectionDisconnected
    case connectionTerminated
    case connectionBusy
    case webSocketClose(Int, String)
    case webSocketError(Error)
    case peerConnectionError(Error)
    case iceConnectionFailed
    case iceConnectionDisconnected
    case mediaCapturerFailed
}

public class Connection {
    
    public var URL: Foundation.URL
    public var mediaChannelId: String
    public var eventLog: EventLog
    
    public init(URL: Foundation.URL, mediaChannelId: String) {
        self.URL = URL
        self.mediaChannelId = mediaChannelId
        eventLog = EventLog(URL: URL, mediaChannelId: mediaChannelId)
    }

}
