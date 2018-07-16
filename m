From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: REGRESSION: [RESEND PATCH v3 1/4] backlight: pwm_bl: linear
 interpolation between brightness-levels
Date: Mon, 16 Jul 2018 14:03:52 +0000
Message-ID: <1531749830.6547.25.camel@toradex.com>
References: <20180409083333.1249-1-enric.balletbo@collabora.com>
         <20180409083333.1249-2-enric.balletbo@collabora.com>
         <1531580895.7579.7.camel@toradex.com> <20180715075732.GA2989@wychelm.lan>
         <1531664796.7579.13.camel@toradex.com>
         <20180716094223.syzwviia4wdx74yh@holly.lan>
         <1531742247.6547.4.camel@toradex.com>
         <20180716135127.2hvlqxi6mibp7yrh@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716135127.2hvlqxi6mibp7yrh@holly.lan>
Content-Language: en-US
Content-ID: <6937285CC943F041849C258A6DD02789@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dianders@google.com" <dianders@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>, "briannorris@google.com" <briannorris@google.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "amstan@google.com" <amstan@google.com>, "groeck@google.com" <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

T24gTW9uLCAyMDE4LTA3LTE2IGF0IDE0OjUxICswMTAwLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6
DQo+IE9uIE1vbiwgSnVsIDE2LCAyMDE4IGF0IDExOjU3OjI5QU0gKzAwMDAsIE1hcmNlbCBaaXN3
aWxlciB3cm90ZToNCj4gPiBPbiBNb24sIDIwMTgtMDctMTYgYXQgMTA6NDIgKzAxMDAsIERhbmll
bCBUaG9tcHNvbiB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IEZyb20gZGJiMzFkMDBjOWYyODcz
YWZmZWRiY2VhZTkxN2M5ZDdmY2U1ZjgzMiBNb24gU2VwIDE3DQo+ID4gPiA+IDAwOjAwOjAwDQo+
ID4gPiA+IDIwMDENCj4gPiA+ID4gTWVzc2FnZS1JZDoNCj4gPiA+ID4gPGRiYjMxZDAwYzlmMjg3
M2FmZmVkYmNlYWU5MTdjOWQ3ZmNlNWY4MzIuMTUzMTY2NDY2My5naXQubWENCj4gPiA+ID4gcmNl
bC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4gPiA+ID4gRnJvbTogRGFuaWVsIFRob21wc29uIDxk
YW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4NCj4gPiA+ID4gRGF0ZTogU3VuLCAxNSBKdWwgMjAx
OCAwODo0OTowNSArMDEwMA0KPiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0hdIGJhY2tsaWdodDogcHdt
X2JsOiBGaXggdW5pbml0aWFsaXplZCB2YXJpYWJsZQ0KPiA+ID4gPiANCj4gPiA+ID4gQ3VycmVu
dGx5LCBpZiB0aGUgRFQgZG9lcyBub3QgZGVmaW5lIG51bS1pbnRlcnBvbGF0ZWQtc3RlcHMNCj4g
PiA+ID4gdGhlbg0KPiA+ID4gPiBudW1fc3RlcHMgaXMgdW5kZWZpbmVkIG1lYW5pbmcgdGhlIGlu
dGVycG9sYXRpb24gY29kZSB3aWxsDQo+ID4gPiA+IGRlcGxveQ0KPiA+ID4gPiByYW5kb21seS4g
Rml4IHRoaXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBGaXhlczogNTczZmU2ZDFjMjVjICgiYmFja2xp
Z2h0OiBwd21fYmw6IExpbmVhciBpbnRlcnBvbGF0aW9uDQo+ID4gPiA+IGJldHdlZW4NCj4gPiA+
ID4gYnJpZ2h0bmVzcy1sZXZlbHMiKQ0KPiA+ID4gPiBSZXBvcnRlZC1ieTogTWFyY2VsIFppc3dp
bGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+DQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29t
Pg0KPiA+ID4gDQo+ID4gPiBJcyBpdCBUZXN0ZWQtYnk6IHRvbz8gSXQgd291bGQgYmUgZ29vZCB0
byBjb25maXJtIEkgd2FzIHJpZ2h0DQo+ID4gPiBhYm91dA0KPiA+ID4gdGhlDQo+ID4gPiBjYXVz
ZSBvZiB0aGUgcHJvYmxlbS4NCj4gPiANCj4gPiBZZXMgYW5kIEkgY29uZmlybSB5b3Ugd2VyZSBy
aWdodC4NCj4gDQo+IFRoYW5rcy4NCj4gDQo+IA0KPiA+ID4gPiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvcHdtX2JsLmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0NCj4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jDQo+ID4gPiA+
IGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMNCj4gPiA+ID4gaW5kZXggOWVlNGMx
YjczNWIyLi5lODg0ZDU4OTM3OGQgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L3B3bV9ibC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3B3bV9ibC5jDQo+ID4gPiA+IEBAIC0yNTAsNyArMjUwLDcgQEAgc3RhdGljIGludCBwd21fYmFj
a2xpZ2h0X3BhcnNlX2R0KHN0cnVjdA0KPiA+ID4gPiBkZXZpY2UNCj4gPiA+ID4gKmRldiwNCj4g
PiA+ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBkZXYtPm9mX25vZGU7DQo+ID4gPiA+
ICAJdW5zaWduZWQgaW50IG51bV9sZXZlbHMgPSAwOw0KPiA+ID4gPiAgCXVuc2lnbmVkIGludCBs
ZXZlbHNfY291bnQ7DQo+ID4gPiA+IC0JdW5zaWduZWQgaW50IG51bV9zdGVwczsNCj4gPiA+ID4g
Kwl1bnNpZ25lZCBpbnQgbnVtX3N0ZXBzID0gMDsNCj4gPiA+IA0KPiA+ID4gVGhpcyBjYW4gZ28u
IElmIHdlIGNoZWNrIHRoZSByZXR1cm4gY29kZSB0aGVtIHRoaXMgdmFyaWFibGUgaXMgbm8NCj4g
PiA+IGxvbmdlcg0KPiA+ID4gdXNlZCB1bmluaXRpYWxpemVkIFtJJ20gT0sgdG8gbWFrZSB0aGUg
Y2hhbmdlIHRob3VnaC4uLiBzaW5jZQ0KPiA+ID4geW91J3ZlDQo+ID4gPiBrZXB0IG15IG5hbWUg
YXQgdGhlIHRvcCA7LSkgXS4NCj4gPiANCj4gPiBZZXMsIEkgY29uZmlybSB0aGF0IHRoaXMgd29y
a3MgZm9yIG1lLiBBcmUgeW91IGdvbmEgc2VuZCBhIHByb3Blcg0KPiA+IHBhdGNoDQo+ID4gb3V0
IG9yIHNob3VsZCBJIGRvIGl0Pw0KPiANCj4gSSBjYW4gc2VuZCBpdCBvdXQuDQo+IA0KPiANCj4g
RGFuaWVsLg0KDQpUaGFuayB5b3UuDQoNCkNoZWVycw0KDQpNYXJjZWw=
