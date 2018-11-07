From: Brian Dodge <bdodge09@gmail.com>
Subject: [PATCH 0/3] backlight/arcxcnn fix vendor prefix in driver and
 bindings and add support for arc1, arc3
Date: Wed,  7 Nov 2018 07:10:37 -0500
Message-ID: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

VGhlIHZlbmRvci1wcmVmaXgudHh0IGZpbGUgY29ycmVjdGx5IHVzZXMgdGhlIHByZWZpeCBhcmN0
aWMgZm9yIEFyY3RpY1NhbmQuClRoZSBBcmN0aWNTYW5kIGRyaXZlciBhbmQgdGhlIGRldmljZSB0
cmVlIGJpbmRpbmdzIGZvciBpdCBpbmNvcnJlY2x0eSB1c2UKanVzdCBhcmMuIFRoaXMgbWlzbWF0
Y2ggd2FzIGFuIGVycm9yIGluIHRoZSBvcmlnaW5hbCBwYXRjaHNldCBmb3IgdGhlCmRyaXZlciBh
bmQgaXMgZml4ZWQgaW4gdGhlIGZpcnN0IHR3byBwYXRjaGVzIGhlcmUuCgpBcmN0aWNTYW5kIGhh
cyBiZWVuIHB1cmNoYXNlZCBieSBQZXJlZ3JpbmUgU2VtaWNvbmR1Y3Rvciwgbm93IHBTZW1pLiBU
aGUKY29tcGFueSB3aXNoZXMgdG8gY29udGludWUgdXNpbmcgdGhlIEFyY3RpY1NhbmQgbmFtZSBh
bmQgYXJjdGljIHByZWZpeApmb3IgaXRzIExFRCBiYWNrbGlnaHQgZHJpdmVycy4KClRoZXJlIGFy
ZSB0d28gbmV3ZXIgY2hpcHMgY3JlYXRlZCBieSBBcmN0aWNTYW5kIHRlYW0uIFRoZSBjaGlwcyBh
cmUKdmVyeSBzaW1pbGFyIHRvIHRoZSBhcmMyIGNoaXAgc3VwcG9ydGVkIGJ5IHRoZSBjdXJyZW50
IGtlcm5lbCBkcml2ZXIuClN1cHBvcnQgZm9yIHRoZSB0d28gbmV3IGNoaXBzIChhcmMxIGZhbWls
eSBhbmQgYXJjMyBmYW1pbHkpIGlzIGFkZGVkCmhlcmUgYmFzZWQgb24gcmVhZGluZyB0aGUgY2hp
cCBpZCB2aWEgaTJjIGluIHByb2JlIGFuZCBtYWtpbmcgbWlub3IKYWRqdXN0bWVudHMgdG8gcmFu
Z2VzIGFuZCByZWdpc3RlciBhZGRyZXNzZXMgYmFzZWQgb24gdGhlIGlkLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
