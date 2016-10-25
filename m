From: Hui Chun Ong <hui.chun.ong@ni.com>
Subject: Re: [PATCH] leds: Add user LED driver for NIC78bx device
Date: Tue, 25 Oct 2016 10:07:08 +0000
Message-ID: <1477390026.2682.3.camel@ni.com>
References: <CGME20161021063441eucas1p221cdc9bd704f03ad367df8cf59fa35e6@eucas1p2.samsung.com>
         <1477031633-70909-1-git-send-email-hui.chun.ong@ni.com>
         <335a9cd9-2af7-2d7c-12ab-1000dddbd0d6@samsung.com>
         <20161021213347.GA15895@jcartwri.amer.corp.natinst.com>
         <5bd2fac9-0fe7-4445-e0a6-0342b08f7e33@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-co1nam03on0092.outbound.protection.outlook.com ([104.47.40.92]:55219
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933206AbcJYMkw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 25 Oct 2016 08:40:52 -0400
In-Reply-To: <5bd2fac9-0fe7-4445-e0a6-0342b08f7e33@gmail.com>
Content-Language: en-US
Content-ID: <47626D64ED652541B61E7A9D6A30A689@namprd04.prod.outlook.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Julia Cartwright <julia.cartwright@ni.com>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, Jonathan Hearn <jonathan.hearn@ni.com>, Brad Mouring <brad.mouring@ni.com>

SGkgSmFjZWssDQoNCk9uIFN1biwgMjAxNi0xMC0yMyBhdCAxNjoxMiArMDIwMCwgSmFjZWsgQW5h
c3pld3NraSB3cm90ZToNCj4gSGkgSnVsaWEsDQo+IA0KPiBPbiAxMC8yMS8yMDE2IDExOjMzIFBN
LCBKdWxpYSBDYXJ0d3JpZ2h0IHdyb3RlOg0KPiA+IA0KPiA+IE9uIEZyaSwgT2N0IDIxLCAyMDE2
IGF0IDAyOjU2OjE1UE0gKzAyMDAsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6DQo+ID4gPiANCj4g
PiA+IEhpIEh1aSwNCj4gPiA+IA0KPiA+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guIEkgaGF2ZSBm
ZXcgY29tbWVudHMgaW4gdGhlIGNvZGUgYmVsb3cuDQo+ID4gPiANCj4gPiA+IE9uIDEwLzIxLzIw
MTYgMDg6MzMgQU0sIEh1aSBDaHVuIE9uZyB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IEFkZCB0
aGUgZHJpdmVyIHRvIHN1cHBvcnQgVXNlciBMRURzIG9uIFBYSSBFbWJlZGRlZCBDb250cm9sbGVy
Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSHVpIENodW4gT25nIDxodWkuY2h1
bi5vbmdAbmkuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCcmFkIE1vdXJpbmcgPGJyYWQu
bW91cmluZ0BuaS5jb20+DQo+ID4gWy4uXQ0KPiA+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4g
PiA+ICsNCj4gPiA+ID4gK3N0cnVjdCBuaTc4YnhfbGVkIHsNCj4gPiA+ID4gKwl1OCBiaXQ7DQo+
ID4gPiA+ICsJdTggbWFzazsNCj4gPiA+ID4gKwlzdHJ1Y3QgbGVkX2NsYXNzZGV2IGNkZXY7DQo+
ID4gPiA+ICt9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBuaTc4
YnhfbGVkICp0b19uaTc4YnhfbGVkKHN0cnVjdA0KPiA+ID4gPiBsZWRfY2xhc3NkZXYgKmNkZXYp
DQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJcmV0dXJuIGNvbnRhaW5lcl9vZihjZGV2LCBzdHJ1Y3Qg
bmk3OGJ4X2xlZCwgY2Rldik7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRp
YyB2b2lkIG5pNzhieF9icmlnaHRuZXNzX3NldChzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpjZGV2LA0K
PiA+ID4gPiArCQkJCcKgwqBlbnVtIGxlZF9icmlnaHRuZXNzDQo+ID4gPiA+IGJyaWdodG5lc3Mp
DQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3RydWN0IG5pNzhieF9sZWQgKm5sZWQgPSB0b19uaTc4
YnhfbGVkKGNkZXYpOw0KPiA+ID4gPiArCXU4IHZhbHVlOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJ
bXV0ZXhfbG9jaygmbGVkX2xvY2spOw0KPiA+ID4gWW91IGNhbiB1c2Ugc3Bpbl9sb2NrX2lycXNh
dmUoKSBpbnN0ZWFkLCBzaW5jZSB3ZSBhcmUgbm90IGdvaW5nDQo+ID4gPiB0byBzbGVlcA0KPiA+
ID4gd2hpbGUgYWNjZXNzaW5nIG1lbW9yeSBtYXBwZWQgcmVnaXN0ZXJzLg0KPiA+IENvdWxkIHlv
dSBleHBsYWluIHdoeSBzcGluX2xvY2tfaXJxc2F2ZSgpIGlzIGFwcHJvcHJpYXRlDQo+ID4gaGVy
ZT/CoMKgVGhpcw0KPiA+IGRldmljZSBkb2Vzbid0IGhhdmUgYW4gaW50ZXJydXB0IHRvIGJlIHN5
bmNocm9uaXplZCB3aXRoLsKgwqBJIGNvdWxkDQo+ID4gdW5kZXJzdGFuZCBzcGluX2xvY2soKS9z
cGluX3VubG9jaygpLCBtYXliZSwgYnV0IHdoeSBkaXNhYmxlDQo+ID4gaW50ZXJydXB0cz8NCj4g
YnJpZ2h0bmVzc19zZXQgb3AgY2FuIGJlIGNhbGxlZCBmcm9tIGF0b21pYyBjb250ZXh0IGUuZy4g
aW4gY2FzZSBvZg0KPiB0aW1lciB0cmlnZ2VyLiBUaGUgY29kZSB0aGF0IHJ1bnMgaW4gdGhlIGlu
dGVycnVwdCBjb250ZXh0IGNhbm5vdA0KPiBzbGVlcA0KPiBkdWUgdG8gcmVhc29ucyBleHBsYWlu
ZWQgaW4gWzBdLCB3aGVyZWFzIG11dGV4IGNhbiBzbGVlcCBvbg0KPiBjb250ZW50aW9uLg0KPiAN
Cj4gc3Bpbl9sb2NrKCkgaXMgYXBwcm9wcmlhdGUgb25seSBpbiBhIGhhcmQgaXJxIGhhbmRsZXIu
DQo+IA0KPiA+IA0KPiA+IElzIHdoYXQgeW91J3JlIHNheWluZyB0aGF0IHRoZSBzZXQvZ2V0IGJy
aWdodG5lc3MgY2FsbHMgY2FuIGJlIHJlLQ0KPiA+IGVudGVyZWQNCj4gPiBieSBMRUQgY29uc3Vt
ZXJzIGluIGhhcmRpcnEgY29udGV4dD8NCj4gPiANCj4gPiBUaGUgc3lzdGVtcyB0aGlzIGRyaXZl
ciBpcyBkZXBsb3llZCB0byBpcyBtdWNoIG1vcmUgc2Vuc2l0aXZlIHRvIFJUDQo+ID4gZXhlY3V0
aW9uIGxhdGVuY3kgdGhhbiBhbnl0aGluZyBlbHNlLCB3aGljaCBpcyB3aHkgSSB0YWtlIHBhdXNl
IHRvDQo+ID4gdW5uZWNlc3NhcnkgaW50ZXJydXB0IG1hc2sgdHdpZGRsaW5nL3ByZWVtcHRpb24g
ZGlzYWJsaW5nIDopLg0KPiBbMF0gaHR0cDovL3d3dy5tYWtlbGludXgubmV0L2xkZDMvY2hwLTUt
c2VjdC01DQo+IA0KSSdtIHVwZGF0ZSB0aGUgZHJpdmVyIHRvIHVzZSBzcGluX2xvY2tfaXJxc2F2
ZS4gVGhhbmtzIGZvciB0aGUNCmZlZWRiYWNrLg==
