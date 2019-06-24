From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Date: Mon, 24 Jun 2019 11:24:05 +0100
Message-ID: <20190624102405.gg2lnlw6wmfvjrxu@holly.lan>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
 <20190621221325.GA2343@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190621221325.GA2343@amd>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Brian Dodge <bdodge09@gmail.com>, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, Peter Bacon <pbacon@psemi.com>, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

T24gU2F0LCBKdW4gMjIsIDIwMTkgYXQgMTI6MTM6MjVBTSArMDIwMCwgUGF2ZWwgTWFjaGVrIHdy
b3RlOgo+IEhpIQo+IAo+ID4gW1NvcnJ5IHRvIHRob3NlIHJlY2VpdmluZyB0aGlzIHR3aWNlLi4u
IGhhZCB0byBkaWcgdGhpcyBvdXQgZnJvbSB0aGUKPiA+IGFyY2hpdmVzIGFuZCBzZW50IGl0IHRv
IHRoZSBsaXN0cyBmcm9tIHRoZSB3cm9uZyBtYWlsZXJdCj4gPiAKPiA+IE9uIDI3LzExLzIwMTgg
MDA6NDQsIEJyaWFuIERvZGdlIHdyb3RlOgo+ID4gPlRoYW5rIHlvdSBQYXZlbCwgdGhhdCBpcyBh
IGdvb2QgcG9pbnQuCj4gPiA+Cj4gPiA+VGhlIGNoaXAgdmVuZG9yIGhhcyBpbmRpY2F0ZWQgdGhh
dCB0aGVyZSBpcyBubyByZWFzb24gdG8gbWFpbnRhaW4gdGhlCj4gPiA+b2xkL2ltcHJvcGVyIHBy
ZWZpeCBhbmQgd2lzaGVzIHRvIGdvIGZvcndhcmQgKG9ubHkpIHdpdGggdGhlICJhcmN0aWMiCj4g
PiA+cHJlZml4IGFuZCBhbnkgZXhpc3RpbmcgZHRzIGZpbGVzIGFyZSBvciB3aWxsIGJlIHVwZGF0
ZWQuCj4gPiAKPiA+IExvb2tzIGxpa2UgdGhpcyBwYXRjaCBzZXJpZXMgaGFzIGZhbGxlbiBpbnRv
IHRoZSBjcmFja3MgYSBsaXR0bGUuCj4gPiAKPiA+IEkgdGhpbmsgSSBhc3N1bWVkIHRoaXMgaW5m
byB3b3VsZCBlbmQgaW4gdGhlIGRlc2NyaXB0aW9uIG9mIHBhdGNoIHYyIDEvMyAoaW4KPiA+IG9y
ZGVyIHRvIGFuc3dlciBSb2IncyBmZWVkYmFjaykgYW5kIEkgc2F0IGFuZCB3YWl0ZWQgZm9yIGEg
cmVzcGluLiBPbiB0aGUKPiA+IG90aGVyIGhhbmQuLi4gSSBkaWRuJ3QgYWN0dWFsbHkgc2F5IHRo
YXQgZXhwbGljaXRseSBhbnl3aGVyZSEgU28uLi4gSSdkCj4gPiByZWNvbW1lbmQgYSByZXNwaW4g
cGVyaGFwcyB3aXRoIGEgc21hbGwgYml0IG9mIHRleHQgZXhwbGFpbmluZyBob3cgdGhlCj4gPiB2
ZW5kb3IgY2FuIHN0YXRlIHRoYXQgYW55IGV4aXN0aW5nIGR0cyBmaWxlcyB3aWxsIGJlIHVwZGF0
ZWQuIFRoaXMgaXMgYQo+ID4gcGVyaXBoZXJhbCBkZXZpY2Ugc28gdGhlc2Ugc3RyaW5ncyBhcmUg
cHJvYmFibHkgZW1iZWRkZWQgaW50byBPRU0KPiA+IGRldmljZXRyZWVzIHJhdGhlciB0aGFuIGV4
Y2x1c2l2ZWx5IHVuZGVyIHRoZSBjb250cm9sIG9mIHRoZSB2ZW5kb3IuCj4gCj4gU28gaW4gbmV4
dCBlbWFpbCB5b3UgZ2l2ZSBnb29kIHJlYXNvbiBub3QgdG8gYXBwbHkgdGhpcyA6LSkuCgpBZnJh
aWQgc28uLi4gaXQgd2FzIG9uIHBhZ2UgMiBvZiBteSBnb29nbGUgc2VhcmNoIHNvIEkgZGlkIGEg
cXVpY2sKc2VhcmNoLCBzZW50IHRoZSBmaXJzdCBtYWlsIGFuZCB0aGVuIHdlbnQgYmFjayB0byBt
eSB3ZWIgYnJvd3Nlci4KCkl0IHdhcyBhdCB0aGF0IG1vbWVudCB0aGF0IEkgZGVjaWRlZCBhIHF1
aWNrIHNlYXJjaCB3YXNuJ3QgZW5vdWdoIGFuZApkZWNpZGVkIHRvIGdvdCBhIGxpdHRsZSBkZWVw
ZXIhCgoKRGFuaWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
