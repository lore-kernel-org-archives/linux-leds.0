From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V1 2/5] backlight: qcom-wled: Add support for WLED4
 peripheral
Date: Fri, 18 May 2018 07:20:44 -0500
Message-ID: <CAL_JsqJtn9hZJuF2uHC-jDMyM2HS2McBs4fy7JoS_rYj9h0j_w@mail.gmail.com>
References: <1525341432-15818-1-git-send-email-kgunda@codeaurora.org>
 <1525341432-15818-3-git-send-email-kgunda@codeaurora.org>
 <20180507162004.GB2259@tuxbook-pro>
 <f970143860bd64624e7fad58333df1be@codeaurora.org>
 <82fa847760309cb3382bf0a8da50162c@codeaurora.org>
 <CAL_JsqLQvSpB3CiS1sA5AXwbvC0xkd1HqEYsjY+=oripMXSwuA@mail.gmail.com>
 <7143faaec2d0b7b0fd7e0f3b512839d8@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7143faaec2d0b7b0fd7e0f3b512839d8@codeaurora.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-fbdev@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-msm-owner@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

T24gVGh1LCBNYXkgMTcsIDIwMTggYXQgMTA6MTAgQU0sICA8a2d1bmRhQGNvZGVhdXJvcmEub3Jn
PiB3cm90ZToKPiBPbiAyMDE4LTA1LTE3IDE4OjAxLCBSb2IgSGVycmluZyB3cm90ZToKPj4KPj4g
T24gVGh1LCBNYXkgMTcsIDIwMTggYXQgNDo0NyBBTSwgIDxrZ3VuZGFAY29kZWF1cm9yYS5vcmc+
IHdyb3RlOgo+Pj4KPj4+IE9uIDIwMTgtMDUtMDggMTU6NTUsIGtndW5kYUBjb2RlYXVyb3JhLm9y
ZyB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMjAxOC0wNS0wNyAyMTo1MCwgQmpvcm4gQW5kZXJz
c29uIHdyb3RlOgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiBUaHUgMDMgTWF5IDAyOjU3IFBEVCAyMDE4
LCBLaXJhbiBHdW5kYSB3cm90ZToKPj4+Pj4KPj4+Pj4+IFdMRUQ0IHBlcmlwaGVyYWwgaXMgcHJl
c2VudCBvbiBzb21lIFBNSUNzIGxpa2UgcG1pODk5OAo+Pj4+Pj4gYW5kIHBtNjYwbC4gSXQgaGFz
IGEgZGlmZmVyZW50IHJlZ2lzdGVyIG1hcCBhbmQgYWxzbwo+Pj4+Pj4gY29uZmlndXJhdGlvbnMg
YXJlIGRpZmZlcmVudC4gQWRkIHN1cHBvcnQgZm9yIGl0LgoKWy4uLl0KCj4+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICAgdmFsdWU6Cj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgRm9yIHBt
ODk0MTogZnJvbSAwIHRvIDI1MDAwIHdpdGggNTAwMCB1YSBzdGVwCj4+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRGVmYXVsdCAyMDAwMCB1QQo+Pj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgIEZvciBwbWk4OTk4OiBmcm9tIDAgdG8gMzAwMDAgd2l0aCA1MDAwIHVhIHN0
ZXAKPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRGVmYXVsdCAyNTAw
MCB1QS4KPj4+Pj4KPj4+Pj4KPj4+Pj4KPj4+Pj4gVGhlc2UgdmFsdWVzIGNvdWxkIGJlIGRlc2Ny
aWJlZCBqdXN0IGFzIHdlbGwgaW4gbUEsIHNvIGtlZXAgdGhlCj4+Pj4+IG9yaWdpbmFsCj4+Pj4+
IHVuaXQgLSBpbiBwYXJ0aWN1bGFyIHNpbmNlIHRoZSBib290LWxpbWl0IGlzIGluIG1BLi4uCj4+
Pj4+Cj4+Pj4gT2suIFdpbGwga2VlcCB0aGUgb3JpZ2luYWwgYXMgaXMgaW4gdGhlIG5leHQgc2Vy
aWVzLgo+Pj4KPj4+Cj4+PiBIZXJlLCBJIG1heSBoYXZlIHRvIGdvIHdpdGggdGhlIGFwcHJvYWNo
IGFzIGluICJxY29tLG92cCIuIEJlY2F1c2UgZm9yCj4+PiBwbTg5NDEKPj4+IHRoZSBjdXJyZW50
IHN0ZXAgaXMgMSBtQSAoSSBoYXZlIHdyb25nbHkgbWVudGlvbmVkIGFzIDUwMDB1QSBoZXJlKSBh
bmQKPj4+IGZvcgo+Pj4gUE1JODk5OAo+Pj4gdGhlIGN1cnJlbnQgc3RlcCBpcyAyLjUgbUEuIEhl
bmNlLCBJIHdpbGwgYWRkIGFub3RoZXIgdmFyaWFibGUKPj4+ICJxY29tLGN1cnJlbnQtbGltaXQt
dWEiCj4+PiBqdXN0IGxpa2UgInFjb20sb3ZwLW12Ii4KPj4KPj4KPj4gVXNlIHVuaXQgc3VmZml4
ZXMgZGVmaW5lZCBpbiBiaW5kaW5ncy9wcm9wZXJ0eS11bml0cy50eHQuCj4KPiBUaGFua3MgZm9y
IHBvaW50aW5nIGl0ICEgaG9wZSBJIGNhbiB1c2UgInFjb20sY3VycmVudC1saW1pdC1taWNyb2Ft
cCIgYW5kCj4gInFjb20sb3ZwLW1pbGxpdm9sdCIuIEkgYW0gYXNraW5nIHRoaXMgYmVjYXVzZSBp
IGZvdW5kIG9ubHkgIi1taWNyb3ZvbHQiLgo+ICItbWlsbGl2b2x0IiBpcyBub3QgcHJlc2VudCBp
biB0aGUgYmluZGluZ3MgeW91IHBvaW50ZWQuCgpUaGF0J3MgYnkgZGVzaWduIHNvIGV2ZXJ5b25l
IGRvZXNuJ3QganVzdCBwaWNrIHdoYXRldmVyIHJhbmRvbSB1bml0cwp0aGV5IGxpa2UuIERvZXMg
bWljcm92b2x0cyBub3QgZ2l2ZSB5b3UgZW5vdWdoIHJhbmdlPwoKUm9iCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
