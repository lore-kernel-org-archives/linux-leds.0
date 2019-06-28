From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
Date: Fri, 28 Jun 2019 13:22:38 -0600
Message-ID: <20190628192238.GA8617@bogus>
References: <20190520085846.22320-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, jonathan@marek.ca, b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
List-Id: linux-leds@vger.kernel.org

T24gTW9uLCAyMCBNYXkgMjAxOSAwNDo1ODo0NiAtMDQwMCwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+
IFRoZSAnI2FkZHJlc3MtY2VsbHMnIGFuZCAnI3NpemUtY2VsbHMnIHByb3BlcnRpZXMgd2VyZSBu
b3QgZGVmaW5lZCBpbgo+IHRoZSBsbTM2MzBhIGJpbmRpbmdzIGFuZCB3b3VsZCBjYXVzZSB0aGUg
Zm9sbG93aW5nIGVycm9yIHdoZW4KPiBhdHRlbXB0aW5nIHRvIHZhbGlkYXRlIHRoZSBleGFtcGxl
cyBhZ2FpbnN0IHRoZSBzY2hlbWE6Cj4gCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LmV4YW1wbGUuZHQueWFtbDoKPiAn
I2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2VsbHMnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJl
Z2V4ZXM6Cj4gJ15sZWRAWzAxXSQnLCAncGluY3RybC1bMC05XSsnCj4gCj4gQ29ycmVjdCB0aGlz
IGJ5IGFkZGluZyB0aG9zZSB0d28gcHJvcGVydGllcy4KPiAKPiBXaGlsZSB3ZSdyZSBoZXJlLCBt
b3ZlIHRoZSB0aSxsaW5lYXItbWFwcGluZy1tb2RlIHByb3BlcnR5IHRvIHRoZQo+IGxlZEBbMDFd
IGNoaWxkIG5vZGVzIHRvIGNvcnJlY3QgdGhlIGZvbGxvd2luZyB2YWxpZGF0aW9uIGVycm9yOgo+
IAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2
MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gbGVkQDA6ICd0aSxsaW5lYXItbWFwcGlu
Zy1tb2RlJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gJ3BpbmN0cmwtWzAt
OV0rJwo+IAo+IEZpeGVzOiAzMmZjYjc1YzY2YTAgKCJkdC1iaW5kaW5nczogYmFja2xpZ2h0OiBB
ZGQgbG0zNjMwYSBiaW5kaW5ncyIpCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+Cj4gUmVwb3J0ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55
YW1sICAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCgpBcHBsaWVkLCB0aGFua3MuCgpSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
