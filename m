From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 00/34] treewide: simplify getting the adapter of an I2C
 client
Date: Sun, 9 Jun 2019 16:37:52 +0000
Message-ID: <661f1084-da4e-75f0-e632-335134932801@axentia.se>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Content-ID: <C55F5D15CFF4704BB7913C0E714412B0@eurprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, linux-usb@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

T24gMjAxOS0wNi0wOCAxMjo1NSwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBXaGlsZSBwcmVwYXJp
bmcgYSByZWZhY3RvcmluZyBzZXJpZXMsIEkgbm90aWNlZCB0aGF0IHNvbWUgZHJpdmVycyB1c2Ug
YQ0KPiBjb21wbGljYXRlZCB3YXkgb2YgZGV0ZXJtaW5pbmcgdGhlIGFkYXB0ZXIgb2YgYSBjbGll
bnQuIFRoZSBlYXN5IHdheSBpcw0KPiB0byB1c2UgdGhlIGludGVuZGVkIHBvaW50ZXI6IGNsaWVu
dC0+YWRhcHRlcg0KPiANCj4gVGhlc2UgZHJpdmVycyBkbzoNCj4gCXRvX2kyY19hZGFwdGVyKGNs
aWVudC0+ZGV2LnBhcmVudCk7DQo+IA0KPiBUaGUgSTJDIGNvcmUgcG9wdWxhdGVzIHRoZSBwYXJl
bnQgcG9pbnRlciBhczoNCj4gCWNsaWVudC0+ZGV2LnBhcmVudCA9ICZjbGllbnQtPmFkYXB0ZXIt
PmRldjsNCj4gDQo+IE5vdyB0YWtlIGludG8gY29uc2lkZXJhdGlvbiB0aGF0DQo+IAl0b19pMmNf
YWRhcHRlcigmYWRhcHRlci0+ZGV2KTsNCj4gDQo+IGlzIGEgY29tcGxpY2F0ZWQgd2F5IG9mIHNh
eWluZyAnYWRhcHRlcicsIHRoZW4gd2UgY2FuIGV2ZW4gZm9ybWFsbHkNCj4gcHJvdmUgdGhhdCB0
aGUgY29tcGxpY2F0ZWQgZXhwcmVzc2lvbiBjYW4gYmUgc2ltcGxpZmllZCBieSB1c2luZw0KPiBj
bGllbnQtPmFkYXB0ZXIuDQo+IA0KPiBUaGUgY29udmVyc2lvbiB3YXMgZG9uZSB1c2luZyBhIGNv
Y2NpbmVsbGUgc2NyaXB0IHdpdGggc29tZSBtYW51YWwNCj4gaW5kZW50YXRpb24gZml4ZXMgYXBw
bGllZCBvbiB0b3AuDQo+IA0KPiBUbyBhdm9pZCBhIGJyb3duIHBhcGVyIGJhZyBtaXN0YWtlLCBJ
IGRvdWJsZSBjaGVja2VkIHRoaXMgb24gYSBSZW5lc2FzDQo+IFNhbHZhdG9yLVhTIGJvYXJkIChS
LUNhciBNM04pIGFuZCB2ZXJpZmllZCBib3RoIGV4cHJlc3Npb24gcmVzdWx0IGluIHRoZQ0KPiBz
YW1lIHBvaW50ZXIuIE90aGVyIHRoYW4gdGhhdCwgdGhlIHNlcmllcyBpcyBvbmx5IGJ1aWxkIHRl
c3RlZC4NCg0KU2ltaWxhciB0aGluZ3MgZ28gb24gaW46DQoNCmRyaXZlcnMvaHdtb24vbG05MC5j
DQpkcml2ZXJzL2xlZHMvbGVkcy1pczMxZmwzMTl4LmMNCmRyaXZlcnMvb2YvdW5pdHRlc3QuYw0K
DQpUaG9zZSBoYXZlIHRoaXMgcGF0dGVybjoNCg0KCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZjbGll
bnQtPmRldjsNCglzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0ZXIgPSB0b19pMmNfYWRhcHRlcihk
ZXYtPnBhcmVudCk7DQoNCkFuZCBkcml2ZXJzL3J0Yy9ydGMtZm0zMTMwLmMgaGFzIGEgY291cGxl
IG9mIHRoZXNlOg0KDQoJdG1wID0gaTJjX3RyYW5zZmVyKHRvX2kyY19hZGFwdGVyKGZtMzEzMC0+
Y2xpZW50LT5kZXYucGFyZW50KSwNCgkJCS4uLik7DQoNCndoZXJlIGZtMzEzMC0+Y2xpZW50IGlz
IG9mIHR5cGUgInN0cnVjdCBpMmNfY2xpZW50ICoiDQoNCkNoZWVycywNClBldGVyDQo=
