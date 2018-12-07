From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [arnd-playground:y2038 6/13] htmldocs:
 arch/sh/boards/mach-dreamcast/rtc.c:36: warning: Function parameter or
 member 'dev' not described in 'aica_rtc_gettimeofday'
Date: Fri, 7 Dec 2018 22:57:40 +0100
Message-ID: <CAK8P3a2_AW2WKkPKJs=0BAnRANFdeZTZ4HWRXrPjJk_rjpkNAA@mail.gmail.com>
References: <201812080554.fpWgqq6n%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <y2038-bounces@lists.linaro.org>
In-Reply-To: <201812080554.fpWgqq6n%fengguang.wu@intel.com>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/y2038/>
List-Post: <mailto:y2038@lists.linaro.org>
List-Help: <mailto:y2038-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/y2038>,
 <mailto:y2038-request@lists.linaro.org?subject=subscribe>
Errors-To: y2038-bounces@lists.linaro.org
Sender: "Y2038" <y2038-bounces@lists.linaro.org>
To: kbuild test robot <lkp@intel.com>, linux-leds@vger.kernel.org, y2038 Mailman List <y2038@lists.linaro.org>
Cc: kbuild-all@01.org
List-Id: linux-leds@vger.kernel.org

T24gRnJpLCBEZWMgNywgMjAxOCBhdCAxMDo1MCBQTSBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4gd3JvdGU6Cgo+ID4+IGFyY2gvc2gvYm9hcmRzL21hY2gtZHJlYW1jYXN0L3J0Yy5j
OjM2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkZXYnIG5vdCBkZXNj
cmliZWQgaW4gJ2FpY2FfcnRjX2dldHRpbWVvZmRheScKPiA+PiBhcmNoL3NoL2JvYXJkcy9tYWNo
LWRyZWFtY2FzdC9ydGMuYzozNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAndG0nIG5vdCBkZXNjcmliZWQgaW4gJ2FpY2FfcnRjX2dldHRpbWVvZmRheScKPiAgICBhcmNo
L3NoL2JvYXJkcy9tYWNoLWRyZWFtY2FzdC9ydGMuYzozNjogd2FybmluZzogRXhjZXNzIGZ1bmN0
aW9uIHBhcmFtZXRlciAndHMnIGRlc2NyaXB0aW9uIGluICdhaWNhX3J0Y19nZXR0aW1lb2ZkYXkn
Cj4gPj4gYXJjaC9zaC9ib2FyZHMvbWFjaC1kcmVhbWNhc3QvcnRjLmM6NjM6IHdhcm5pbmc6IEZ1
bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2Rldicgbm90IGRlc2NyaWJlZCBpbiAnYWljYV9y
dGNfc2V0dGltZW9mZGF5Jwo+ID4+IGFyY2gvc2gvYm9hcmRzL21hY2gtZHJlYW1jYXN0L3J0Yy5j
OjYzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICd0bScgbm90IGRlc2Ny
aWJlZCBpbiAnYWljYV9ydGNfc2V0dGltZW9mZGF5JwoKTmljZSBjYXRjaC4gSSdtIGZpeGluZyB1
cCB0aG9zZSBjb21tZW50cyBub3csIGJ1dCB3b25kZXIgaWYgdGhleSBzaG91bGQKanVzdCBiZSBy
ZW1vdmVkIHNpbmNlIGl0IGlzIG5vdCBwcm92aWRpbmcgYW4gQVBJIGJ1dCBpbnN0ZWFkIGltcGxl
bWVudGluZwpvbmUuCgogICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWTIwMzggbWFpbGluZyBsaXN0ClkyMDM4QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8veTIwMzgK
