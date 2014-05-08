From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCH 0/6] leds: Remove duplicated OOM message for individual
 driver
Date: Thu, 8 May 2014 03:36:39 +0000
Message-ID: <5612b92758bd48a79f7967d224d73e49@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1398845245-26344-1-git-send-email-Li.Xiubo@freescale.com>
 <CAK5ve-KcKCGtwptnWNqP4s_pqDV=aN2sD5h+JOq-m-yTzPXCyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-bl2lp0211.outbound.protection.outlook.com ([207.46.163.211]:23649
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752755AbaEHDgy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 7 May 2014 23:36:54 -0400
In-Reply-To: <CAK5ve-KcKCGtwptnWNqP4s_pqDV=aN2sD5h+JOq-m-yTzPXCyQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "Hennerich, Michael" <michael.hennerich@analog.com>

PiBPbiBXZWQsIEFwciAzMCwgMjAxNCBhdCAxOjA3IEFNLCBYaXVibyBMaSA8TGkuWGl1Ym9AZnJl
ZXNjYWxlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBYaXVibyBMaSAoNik6DQo+ID4gICBsZWRzOiBi
ZDI4MDI6IFJlbW92ZSBkdXBsaWNhdGVkIE9PTSBtZXNzYWdlIGZvciBpbmRpdmlkdWFsIGRyaXZl
cg0KPiA+ICAgbGVkczogZGE5MDN4OiBSZW1vdmUgZHVwbGljYXRlZCBPT00gbWVzc2FnZSBmb3Ig
aW5kaXZpZHVhbCBkcml2ZXINCj4gPiAgIGxlZHM6IGRhOTA1MjogUmVtb3ZlIGR1cGxpY2F0ZWQg
T09NIG1lc3NhZ2UgZm9yIGluZGl2aWR1YWwgZHJpdmVyDQo+ID4gICBsZWRzOiBzM2MyNHh4OiBS
ZW1vdmUgZHVwbGljYXRlZCBPT00gbWVzc2FnZSBmb3IgaW5kaXZpZHVhbCBkcml2ZXINCj4gPiAg
IGxlZHM6IHN1bmZpcmU6IFJlbW92ZSBkdXBsaWNhdGVkIE9PTSBtZXNzYWdlIGZvciBpbmRpdmlk
dWFsIGRyaXZlcg0KPiA+ICAgbGVkczogYWRwNTUyMDogUmVtb3ZlIGR1cGxpY2F0ZWQgT09NIG1l
c3NhZ2UgZm9yIGluZGl2aWR1YWwgZHJpdmVyDQo+ID4NCj4gDQo+IFRoaXMgcGF0Y2hzZXQgbG9v
a3MgZ29vZCB0byBtZSwgY291bGQgeW91IHBsZWFzZSBmb2xkIHRoZW0gdG9nZXRoZXI/IEkNCj4g
Y2FuIGFwcGx5IGl0IGluIG9uZSBzaG90Pw0KPiANCg0KU3VyZSwgSSBqdXN0IHRob3VnaHQgdGhl
eSBtYXliZSBhY2tlZCBvciByZXZpZXdlZCBieSBkaWZmZXJlbnQgb3duZXJzLg0KU2luY2UgeW91
IGhhdmUgYWdyZWVkIG9mIHRoZXNlIGNoYW5naW5nLCBJIHdpbGwgZm9sZCB0aGVtIHRvZ2V0aGVy
IGFuZA0KUmVzZW50IGl0Lg0KDQpUaGFua3MsDQoNCkJScw0KWGl1Ym8NCg0KDQoNCg0KPiBUaGFu
a3MsDQo+IC1Ccnlhbg0KPiANCj4gPiAgZHJpdmVycy9sZWRzL2xlZHMtYWRwNTUyMC5jIHwgNSAr
LS0tLQ0KPiA+ICBkcml2ZXJzL2xlZHMvbGVkcy1iZDI4MDIuYyAgfCA0ICstLS0NCj4gPiAgZHJp
dmVycy9sZWRzL2xlZHMtZGE5MDN4LmMgIHwgNCArLS0tDQo+ID4gIGRyaXZlcnMvbGVkcy9sZWRz
LWRhOTA1Mi5jICB8IDMgKy0tDQo+ID4gIGRyaXZlcnMvbGVkcy9sZWRzLXMzYzI0eHguYyB8IDQg
Ky0tLQ0KPiA+ICBkcml2ZXJzL2xlZHMvbGVkcy1zdW5maXJlLmMgfCA0ICstLS0NCj4gPiAgNiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
LS0NCj4gPiAxLjguNA0KPiA+DQo=
