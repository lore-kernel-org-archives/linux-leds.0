From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
Date: Mon, 20 May 2019 08:14:03 -0500
Message-ID: <CAL_JsqLcycH5e=YT-4AQFo-8O0bosjU7oagCRS5CMTfQNBLrcg@mail.gmail.com>
References: <20190520085846.22320-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190520085846.22320-1-masneyb@onstation.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Brian Masney <masneyb@onstation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMzo1OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBUaGUgJyNhZGRyZXNzLWNlbGxzJyBhbmQgJyNzaXplLWNl
bGxzJyBwcm9wZXJ0aWVzIHdlcmUgbm90IGRlZmluZWQgaW4KPiB0aGUgbG0zNjMwYSBiaW5kaW5n
cyBhbmQgd291bGQgY2F1c2UgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuCj4gYXR0ZW1wdGluZyB0
byB2YWxpZGF0ZSB0aGUgZXhhbXBsZXMgYWdhaW5zdCB0aGUgc2NoZW1hOgo+Cj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0
LmV4YW1wbGUuZHQueWFtbDoKPiAnI2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2VsbHMnIGRvIG5v
dCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gJ15sZWRAWzAxXSQnLCAncGluY3RybC1bMC05
XSsnCj4KPiBDb3JyZWN0IHRoaXMgYnkgYWRkaW5nIHRob3NlIHR3byBwcm9wZXJ0aWVzLgo+Cj4g
V2hpbGUgd2UncmUgaGVyZSwgbW92ZSB0aGUgdGksbGluZWFyLW1hcHBpbmctbW9kZSBwcm9wZXJ0
eSB0byB0aGUKPiBsZWRAWzAxXSBjaGlsZCBub2RlcyB0byBjb3JyZWN0IHRoZSBmb2xsb3dpbmcg
dmFsaWRhdGlvbiBlcnJvcjoKPgo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gbGVkQDA6
ICd0aSxsaW5lYXItbWFwcGluZy1tb2RlJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4
ZXM6Cj4gJ3BpbmN0cmwtWzAtOV0rJwo+Cj4gRml4ZXM6IDMyZmNiNzVjNjZhMCAoImR0LWJpbmRp
bmdzOiBiYWNrbGlnaHQ6IEFkZCBsbTM2MzBhIGJpbmRpbmdzIikKPiBTaWduZWQtb2ZmLWJ5OiBC
cmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPiBSZXBvcnRlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KPiAtLS0KPiAgLi4uL2xlZHMvYmFja2xpZ2h0L2xt
MzYzMGEtYmFja2xpZ2h0LnlhbWwgICAgIHwgMjAgKysrKysrKysrKysrKy0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
