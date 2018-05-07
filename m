From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/5] backlight: qcom-wled: Rename pm8941-wled.c to
 qcom-wled.c
Date: Mon, 7 May 2018 11:40:56 -0500
Message-ID: <20180507164056.GA21042@rob-hp-laptop>
References: <1525342352-25072-1-git-send-email-kgunda@codeaurora.org>
 <1525342352-25072-2-git-send-email-kgunda@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1525342352-25072-2-git-send-email-kgunda@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, linux-fbdev@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

T24gVGh1LCBNYXkgMDMsIDIwMTggYXQgMDM6NDI6MjhQTSArMDUzMCwgS2lyYW4gR3VuZGEgd3Jv
dGU6Cj4gcG04OTQxLXdsZWQuYyBkcml2ZXIgaXMgc3VwcG9ydGluZyB0aGUgV0xFRCBwZXJpcGhl
cmFsCj4gb24gcG04OTQxLiBSZW5hbWUgaXQgdG8gcWNvbS13bGVkLmMgc28gdGhhdCBpdCBjYW4g
c3VwcG9ydAo+IFdMRUQgb24gbXVsdGlwbGUgUE1JQ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogS2ly
YW4gR3VuZGEgPGtndW5kYUBjb2RlYXVyb3JhLm9yZz4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2xl
ZHMvYmFja2xpZ2h0L3twbTg5NDEtd2xlZC50eHQgPT4gcWNvbS13bGVkLnR4dH0gICAgfCAyICst
CgpQbGVhc2Ugc3BsaXQgRFQgYmluZGluZ3MgZnJvbSBkcml2ZXIgcGF0Y2hlcy4KCj4gIGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgOCArKysrLS0tLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy92aWRlby9iYWNr
bGlnaHQve3BtODk0MS13bGVkLmMgPT4gcWNvbS13bGVkLmN9ICAgICAgICAgICAgfCAwCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ICByZW5hbWUg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L3twbTg5NDEt
d2xlZC50eHQgPT4gcWNvbS13bGVkLnR4dH0gKDk1JSkKPiAgcmVuYW1lIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L3twbTg5NDEtd2xlZC5jID0+IHFjb20td2xlZC5jfSAoMTAwJSkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
