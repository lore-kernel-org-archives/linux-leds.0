From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v3 1/4] leds: Add of_led_get() and led_put()
Date: Fri, 12 Jul 2019 15:52:36 +0200
Message-ID: <da911df6-876e-802e-2953-5293b01789f7@ti.com>
References: <20190710123932.28244-1-jjhiblot@ti.com>
 <20190710123932.28244-2-jjhiblot@ti.com> <20190710190949.GA22995@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190710190949.GA22995@amd>
Content-Language: en-US
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com, tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
List-Id: linux-leds@vger.kernel.org

aGkgUGF2ZWwKCk9uIDEwLzA3LzIwMTkgMjE6MDksIFBhdmVsIE1hY2hlayB3cm90ZToKPiBPbiBX
ZWQgMjAxOS0wNy0xMCAxNDozOToyOSwgSmVhbi1KYWNxdWVzIEhpYmxvdCB3cm90ZToKPj4gRnJv
bTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPj4KPj4gVGhpcyBwYXRj
aCBhZGRzIGJhc2ljIHN1cHBvcnQgZm9yIGEga2VybmVsIGRyaXZlciB0byBnZXQgYSBMRUQgZGV2
aWNlLgo+PiBUaGlzIHdpbGwgYmUgdXNlZCBieSB0aGUgbGVkLWJhY2tsaWdodCBkcml2ZXIuCj4+
Cj4+IE9ubHkgT0YgdmVyc2lvbiBpcyBpbXBsZW1lbnRlZCBmb3Igbm93LCBhbmQgdGhlIGJlaGF2
aW9yIGlzIHNpbWlsYXIgdG8KPj4gUFdNJ3Mgb2ZfcHdtX2dldCgpIGFuZCBwd21fcHV0KCkuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4K
Pj4KPj4KPj4gQEAgLTIxNCw2ICsyMTUsNTUgQEAgc3RhdGljIGludCBsZWRfcmVzdW1lKHN0cnVj
dCBkZXZpY2UgKmRldikKPj4gICAKPj4gICBzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFMobGVkc19j
bGFzc19kZXZfcG1fb3BzLCBsZWRfc3VzcGVuZCwgbGVkX3Jlc3VtZSk7Cj4+ICAgCj4+ICtzdGF0
aWMgaW50IGxlZF9tYXRjaF9sZWRfbm9kZShzdHJ1Y3QgZGV2aWNlICpsZWRfZGV2LCBjb25zdCB2
b2lkICpkYXRhKQo+PiArewo+PiArCXJldHVybiBsZWRfZGV2LT5vZl9ub2RlID09IGRhdGEgPyAx
IDogMDsKPj4gK30KPiBHZXQgcmlkIG9mIHRoZSAiPyAxIDogMCI/Ck9LCj4KPgo+PiArCWxlZF9u
b2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImxlZHMiLCBpbmRleCk7Cj4+ICsJaWYgKCFsZWRf
bm9kZSkKPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7Cj4+ICsJbGVkX2RldiA9IGNsYXNz
X2ZpbmRfZGV2aWNlKGxlZHNfY2xhc3MsIE5VTEwsIGxlZF9ub2RlLAo+PiArCQlsZWRfbWF0Y2hf
bGVkX25vZGUpOwo+PiArCW9mX25vZGVfcHV0KGxlZF9ub2RlKTsKPj4gKwo+PiArCWlmICghbGVk
X2RldikKPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7Cj4gV29uJ3QgdGhpcyBk
ZWZlciBwcm9iZSAiZm9yZXZlciIgd2hlbiB0aGUgZHJpdmVyIGlzIG5vdCBhdmFpbGFibGU/CgpZ
ZXMgaXQgd2lsbC4KCkhvd2V2ZXIgSSBkb24ndCBzZWUgaG93IHdlIGNhbiBmaXggdGhpcyBiZWNh
dXNlIHdlIGRvbid0IGtub3cgZm9yIHN1cmUgCnRoYXQgdGhlIExFRCBkcml2ZXIgd2lsbCBub3Qg
YmVjb21lIGF2YWlsYWJsZSBhdCBhIGxhdGVyIHRpbWUuCgpKSgoKCgo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
