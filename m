From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/6] Move dell-led to
	drivers/platform/x86
Date: Thu, 16 Feb 2017 15:11:38 +0200
Message-ID: <CAHp75Vf-oftquZkzO33YcLxFqFpbJ3X=090S==3H=vzKtVcFow@mail.gmail.com>
References: <20170116132204.6421-1-kernel@kempniu.pl>
 <20170213112640.GA1188@ozzy.nask.waw.pl>
 <CAJ=jqua0W3fmoJFqqVgG2Eq=9E-4toXC0UyQH3TyxZiTtNsODw@mail.gmail.com>
 <20170215135455.GA2014@ozzy.nask.waw.pl>
 <CAJ=jquaJazMKRsKdq=tpPNq=CBtFPcau6SW3nr738v-zTXfC4g@mail.gmail.com>
 <20170216092747.GA1350@ozzy.nask.waw.pl>
 <CAJ=jqub6AwXBeAahmMguq_h4jTkDbxxEL9=T1aLPOOENMdeLcw@mail.gmail.com>
 <20170216113258.GD1350@ozzy.nask.waw.pl>
 <CAHp75Vd=kCrmhpOyUYOzuTiy89tqeTisWj7BQw8r2vvBmFebDw@mail.gmail.com>
 <20170216120108.GE1350@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170216120108.GE1350@ozzy.nask.waw.pl>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anthony Wong <anthony.wong@canonical.com>, Takashi Iwai <tiwai@suse.com>, Alex Hung <alex.hung@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

T24gVGh1LCBGZWIgMTYsIDIwMTcgYXQgMjowMSBQTSwgTWljaGHFgiBLxJlwaWXFhCA8a2VybmVs
QGtlbXBuaXUucGw+IHdyb3RlOgo+PiBPbiBUaHUsIEZlYiAxNiwgMjAxNyBhdCAxOjMyIFBNLCBN
aWNoYcWCIEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4gd3JvdGU6Cj4+Cj4+ID4gRm9yIG1h
aW50YWluZXJzJyBjb252ZW5pZW5jZSwgSSBhbSBwbGFubmluZyB0byBzdWJtaXQgYSB2MyB3aXRo
IGFsbCB0aGUKPj4gPiB0YWdzIHN1cHBsaWVkIGJ5IGV2ZXJ5b25lIHdobyByZXZpZXdlZCB0aGlz
IHNlcmllcyBhbmQgYWxzbyBzb21lIG1pbm9yCj4+ID4gY29kaW5nIHN0eWxlIHR3ZWFrcyBzdWdn
ZXN0ZWQgYWxvbmcgdGhlIHdheS4KPj4KPj4gVGhhbmtzIQo+PiBJJ20gYSBiaXQgYnVzeSByaWdo
dCBub3csIGJ1dCBJIGRlZmluaXRlbHkgd2lsbCBhcHBseSB0aGUgc2VyaWVzIHRoaXMgd2Vlay4K
Pgo+IE5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIGJ1dCB0aGlzIHNlcmllcyB3
YXMgc3VwcG9zZWQgdG8gZ28KPiB0aHJvdWdoIHRoZSBMRUQgc3Vic3lzdGVtLiAgVGhlIGNvdmVy
IGxldHRlciBzYWlkOgoKQWgsIHRoYXQncyBjb29sIQoKU2VlbXMgSSBtaXhlZCB1cCB0aGlzIG9u
ZSBhbmQgdGhlIG9uZSB3aGVyZSBUaGlua3BhZCBpcyBpbnZvbHZlZC4KCj4+IEFzIGFsbCBwYXRj
aGVzIGV4Y2VwdCBwYXRjaCAzIGluIHRoaXMgc2VyaWVzIGFmZmVjdCB0aGUgTEVEIHN1YnN5c3Rl
bSwKPj4gdGhlIHNlcmllcyBpcyBiYXNlZCBvbiBsaW51eC1sZWRzL2Zvci00LjExLgo+Cj4gU2Vl
IGFsc286Cj4KPiAgICAgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvcGxhdGZvcm0tZHJp
dmVyLXg4Ni9tc2cxMDIzNS5odG1sCj4gICAgIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3Rz
L3BsYXRmb3JtLWRyaXZlci14ODYvbXNnMTAyMzcuaHRtbAo+ICAgICBodHRwczovL3d3dy5zcGlu
aWNzLm5ldC9saXN0cy9wbGF0Zm9ybS1kcml2ZXIteDg2L21zZzEwMjUwLmh0bWwKPiAgICAgaHR0
cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvcGxhdGZvcm0tZHJpdmVyLXg4Ni9tc2cxMDI1My5o
dG1sCj4KPiAtLQo+IEJlc3QgcmVnYXJkcywKPiBNaWNoYcWCIEvEmXBpZcWECgoKCi0tIApXaXRo
IEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
