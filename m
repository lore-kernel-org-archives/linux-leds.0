From: Brian Dodge <bdodge09@gmail.com>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
Date: Mon, 26 Nov 2018 19:44:14 -0500
Message-ID: <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181111113053.GF27666@amd>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com, Peter Bacon <pbacon@psemi.com>, lee.jones@linaro.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

VGhhbmsgeW91IFBhdmVsLCB0aGF0IGlzIGEgZ29vZCBwb2ludC4KClRoZSBjaGlwIHZlbmRvciBo
YXMgaW5kaWNhdGVkIHRoYXQgdGhlcmUgaXMgbm8gcmVhc29uIHRvIG1haW50YWluIHRoZSAKb2xk
L2ltcHJvcGVyIHByZWZpeCBhbmQgd2lzaGVzIHRvIGdvIGZvcndhcmQgKG9ubHkpIHdpdGggdGhl
ICJhcmN0aWMiIApwcmVmaXggYW5kIGFueSBleGlzdGluZyBkdHMgZmlsZXMgYXJlIG9yIHdpbGwg
YmUgdXBkYXRlZC4KCk9uIDExLzExLzE4IDY6MzAgQU0sIFBhdmVsIE1hY2hlayB3cm90ZToKPiBI
aSEKPgo+PiBUaGUgdmVuZG9yLXByZWZpeGVzLnR4dCBmaWxlIHByb3Blcmx5IHJlZmVycyB0byBB
cmN0aWNTYW5kCj4+IGFzIGFyY3RpYyBidXQgdGhlIGRyaXZlciBpbXByb3Blcmx5IGFiYnJldmlh
dGVkIHRoZSBwcmVmaXgKPj4gdG8gYXJjLiBUaGlzIHdhcyBhIG1pc3Rha2UgaW4gdGhlIG9yaWdp
bmFsIHBhdGNoCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIERvZGdlIDxiZG9kZ2UwOUBnbWFp
bC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2FyY3hjbm5fYmwuYyB8
IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+ICAgICoKPj4gLSAqIENvcHlyaWdodCAyMDE2
IEFyY3RpY1NhbmQsIEluYy4KPj4gLSAqIEF1dGhvciA6IEJyaWFuIERvZGdlIDxiZG9kZ2VAYXJj
dGljc2FuZC5jb20+Cj4+ICsgKiBDb3B5cmlnaHQgMjAxOCBwU2VtaSwgSW5jLgo+PiArICogQXV0
aG9yIDogQnJpYW4gRG9kZ2UgPGJkb2RnZUBwc2VtaS5jb20+Cj4gVW1tbS4gQ29weXJpZ2h0IDIw
MTYtMjAxOD8KPgo+PiBAQCAtMjAyLDI3ICsyMDIsMjcgQEAgc3RhdGljIHZvaWQgYXJjeGNubl9w
YXJzZV9kdChzdHJ1Y3QgYXJjeGNubiAqbHApCj4+ICAgCWlmIChyZXQgPT0gMCkKPj4gICAJCWxw
LT5wZGF0YS0+aW5pdGlhbF9icmlnaHRuZXNzID0gcHJvZ192YWw7Cj4+Cj4+IC0JcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFyYyxsZWQtY29uZmlnLTAiLCAmcHJvZ192YWwpOwo+
PiArCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJhcmN0aWMsbGVkLWNvbmZpZy0w
IiwgJnByb2dfdmFsKTsKPj4gICAJaWYgKHJldCA9PSAwKQo+PiAgIAkJbHAtPnBkYXRhLT5sZWRf
Y29uZmlnXzAgPSAodTgpcHJvZ192YWw7Cj4+Cj4gSWYgdGhlcmUncyBhIGR0cyB1c2luZyB0aGlz
LCB5b3Ugd2FudCB0byB1cGRhdGUgaXQgYXQgdGhlIHNhbWUKPiB0aW1lLiBZb3UgbWF5IHdhbnQg
dG8gc3VwcG9ydCBib3RoIG5hbWVzIGdvaW5nIGZvcndhcmQuCj4gCQkJCQkJCQkJUGF2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
