From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: BCM53573: Don't use nonexistent
 "default-off" LED trigger
Date: Wed, 8 Mar 2017 23:20:36 +0100
Message-ID: <CACna6rz7Bm4DT4Mo3zgU+14uFHMDbQNEX6ejiY=RD-d1WMKcSA@mail.gmail.com>
References: <20170308064105.26619-1-zajec5@gmail.com>
 <42bce8ea-f1dc-2018-33f1-d296ccd7b677@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <42bce8ea-f1dc-2018-33f1-d296ccd7b677@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org

T24gOCBNYXJjaCAyMDE3IGF0IDE4OjMxLCBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gT24gMDMvMDcvMjAxNyAxMDo0MSBQTSwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Cj4+
IFN1Y2ggYSB0cmlnZ2VyIGRvZXNuJ3QgZXhpc3QgaW4gTGludXggYW5kIGlzIG5vdCBuZWVkZWQg
YXMgTEVEIGlzIGJlaW5nCj4+IHR1cm5lZCBvZmYgYnkgZGVmYXVsdC4gVGhpcyBjb3VsZCBjYXVz
ZSBlcnJvcnMgaW4gTEVEcyBjb3JlIGNvZGUgd2hlbgo+PiB0cnlpbmcgdG8gc2V0IGRlZmF1bHQg
dHJpZ2dlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+Cj4gU2luY2UgeW91IGFyZSBmaXhpbmcgc29tZXRoaW5nLCB3aGF0J3MgdGhlIHBy
b3BlciBGaXhlczogdGFnIGZvciB0aGlzCj4gY29tbWl0PyBMaWtld2lzZSBmb3IgdGhlIHNlY29u
ZCBwYXRjaC4KClRoaXMgcHJvYmxlbSB3YXMgZXhwb3NlZCBieSB0aGUgY29tbWl0IGYzNjNhODcw
ZWFlZiAoImxlZHM6IGNvcmU6IHVzZQpkZWZlcnJlZCBwcm9iaW5nIGlmIGRlZmF1bHQgdHJpZ2dl
ciBpc24ndCBhdmFpbGFibGUgeWV0IikgcHVzaGVkIHRvCnRoZToKaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvai5hbmFzemV3c2tpL2xpbnV4LWxlZHMuZ2l0L2xv
Zy8/aD1mb3ItbmV4dAoKSSByZXBvcnRlZCBwcm9ibGVtcyBjYXVzZWQgYnkgdGhpcyBjb21taXQg
aW4gZS1tYWlsIHRocmVhZApOZXcgcHJvYmxlbXMgYWZ0ZXIgZjM2M2E4NzBlYWVmICgibGVkczog
Y29yZTogdXNlIGRlZmVycmVkIHByb2JpbmcgaWYKZGVmYXVsdCB0cmlnZ2VyIGlzbid0IGF2YWls
YWJsZSB5ZXQiKQooSSBjYW4ndCBhY2Nlc3MgbGludXgtbGVkcyBhcmNoaXZlKSBhbmQgaXQgd2Fz
IGRyb3BwZWQgYWZ0ZXIgbXkgcmVwb3J0LgoKU28gdGhlcmUgaXMgbm90aGluZyB0byBwb2ludCBp
biB0aGUgIkZpeGVzOiIuCgotLSAKUmFmYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
