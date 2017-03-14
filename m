From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 4/4] mfd: mt6397: Add MT6323 LED support into MT6397
 driver
Date: Tue, 14 Mar 2017 14:42:37 +0000
Message-ID: <20170314144237.5b3kxhri4frmhboy@dell>
References: <1488549385-19899-1-git-send-email-sean.wang@mediatek.com>
 <1488549385-19899-5-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1488549385-19899-5-git-send-email-sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sean.wang@mediatek.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, keyhaede@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-leds@vger.kernel.org

T24gRnJpLCAwMyBNYXIgMjAxNywgc2Vhbi53YW5nQG1lZGlhdGVrLmNvbSB3cm90ZToKCj4gRnJv
bTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0ZWsuY29tPgo+IAo+IEFkZCBjb21wYXRpYmxl
IHN0cmluZyBhcyAibXQ2MzIzLWxlZCIgdGhhdCB3aWxsIG1ha2UKPiB0aGUgT0YgY29yZSBzcGF3
biBjaGlsZCBkZXZpY2VzIGZvciB0aGUgTEVEIHN1Ym5vZGUKPiBvZiB0aGF0IE1UNjMyMyBNRkQg
ZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVr
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYyB8IDQgKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpGb3IgbXkgb3duIHJlZmVyZW5jZToKICBBY2tl
ZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYyBiL2RyaXZlcnMvbWZkL210NjM5Ny1jb3Jl
LmMKPiBpbmRleCBlMTRkOGIwLi44ZTYwMWM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL210
NjM5Ny1jb3JlLmMKPiArKysgYi9kcml2ZXJzL21mZC9tdDYzOTctY29yZS5jCj4gQEAgLTQ4LDYg
KzQ4LDEwIEBACj4gIAkJLm5hbWUgPSAibXQ2MzIzLXJlZ3VsYXRvciIsCj4gIAkJLm9mX2NvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ2MzIzLXJlZ3VsYXRvciIKPiAgCX0sCj4gKwl7CgpQdXQgdGhp
cyBvbiB0aGUgbGluZSBhYm92ZS4KCj4gKwkJLm5hbWUgPSAibXQ2MzIzLWxlZCIsCj4gKwkJLm9m
X2NvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzIzLWxlZCIKPiArCX0sCj4gIH07Cj4gIAo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIG10NjM5N19kZXZzW10gPSB7CgotLSAKTGVlIEpv
bmVzCkxpbmFybyBTVE1pY3JvZWxlY3Ryb25pY3MgTGFuZGluZyBUZWFtIExlYWQKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
