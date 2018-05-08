From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V2 1/5] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
Date: Tue, 8 May 2018 09:36:58 +0100
Message-ID: <20180508083658.mc7x7izthxjrv5ey@holly.lan>
References: <1525342352-25072-1-git-send-email-kgunda@codeaurora.org>
 <1525342352-25072-2-git-send-email-kgunda@codeaurora.org>
 <000201d3e3c0$4cdf87a0$e69e96e0$@gmail.com>
 <a9faa8c2866f44b46c3733c8165f6bae@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <a9faa8c2866f44b46c3733c8165f6bae@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: kgunda@codeaurora.org
Cc: 'Mark Rutland' <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, 'Rob Herring' <robh+dt@kernel.org>, 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, 'Pavel Machek' <pavel@ucw.cz>, linux-arm-msm@vger.kernel.org, 'Lee Jones' <lee.jones@linaro.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

T24gTW9uLCBNYXkgMDcsIDIwMTggYXQgMTE6MjY6NTlBTSArMDUzMCwga2d1bmRhQGNvZGVhdXJv
cmEub3JnIHdyb3RlOgo+IEhpIEppbmdvbyBIYW4sCj4gVGhhbmtzIGZvciB0aGUgcmVzcG9uc2Uu
Cj4gCj4gVGhhbmtzLAo+IEtpcmFuCj4gT24gMjAxOC0wNS0wNCAyMToyNSwgSmluZ29vIEhhbiB3
cm90ZToKPiA+IE9uIFRodXJzZGF5LCBNYXkgMywgMjAxOCA2OjEyIEFNLCBLaXJhbiBHdW5kYSB3
cm90ZToKPiA+IAo+ID4gSWYgeW91IHJlYWxseSB3YW50IHNvbWVvbmUgdG8gcmV2aWV3IHlvdXIg
cGF0Y2gsIHBsZWFzZSBhZGQgbW9yZQo+ID4gZGV0YWlsZWQKPiA+IGV4cGxhbmF0aW9ucy4KPiA+
IAo+ID4gMS4gUGxlYXNlIGFkZCAwdGggcGF0Y2guCj4gSSBoYXZlIGFscmVhZHkgYWRkZWQgdGhl
IDB0aCBwYXRjaCAoY292ZXIgbGV0dGVyKS4gRm9sbG93aW5nIGlzIHRoZSBzdWJqZWN0Cj4gZm9y
IHRoZSBzYW1lLgo+IGZvcndhcmRpbmcgdGhlIHNhbWUgdG8geW91Lgo+IFtQQVRDSCBWMiAwLzVd
IGJhY2tsaWdodDogcWNvbS13bGVkOiBTdXBwb3J0IGZvciBRQ09NIHdsZWQgZHJpdmVyCgpQZXJo
YXBzIHlvdSBzaG91bGQgaW50ZXJwcmV0IEppbmdvbydzIGNvbW1lbnQgYXMgYSByZXF1ZXN0IHRv
IGltcHJvdmUKdGhlIFRvOiBhbmQgQ2M6IGxpc3Qgb24gdGhlIDB0aCBwYXRjaCB0aGUgbmV4dCB0
aW1lIHlvdSBjaXJjdWxhdGUgaXQuCgpNYW55IG1haW50YWluZXJzIGNvbmZpZ3VyZSB0aGVpciBt
YWlsZXJzIHRvIGdpdmUgcGF0Y2hlcyB3aGVyZSB0aGV5IGFyZQppbiB0aGUgVG86IG9yIENjOiBs
aXN0IHNwZWNpYWwgdHJlYXRtZW50IHNvIGl0IGNvbmZ1c2luZyB3aGVuIGEgc2VyaWVzCmFycml2
ZXMgd2l0aCBhIHNwYXJ0YW4gc2V0IG9mIHJlY2lwaWVudHMgZm9yIHRoZSAwdGggcGF0Y2ggKGFu
ZCBkb3VibHkKY29uZnVzaW5nIHdoZW4gZXZlcnkgcGF0Y2ggaW4gdGhlIHNldCB0YXJnZXRzIHRo
ZSBzYW1lIGRyaXZlcikuCgoKRGFuaWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
