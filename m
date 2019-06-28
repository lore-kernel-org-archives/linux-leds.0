From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 0/9] Some doc fixes
Date: Fri, 28 Jun 2019 09:12:22 -0300
Message-ID: <cover.1561723736.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ajay Gupta <ajayg@nvidia.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-leds@vger.kernel.org, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Maxime Ripard <maxime.ripard@bootlin.com>, Darren Hart <dvhart@infradead.org>, devicetree@vger.kernel.org, intel-gfx@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>, Rob Herring <robh+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andy
List-Id: linux-leds@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgaXMgYWdhaW5zdCBsaW51eC1uZXh0IChuZXh0LTIwMTkwNjI3KS4g
SSBkb3VidCB0aG9zZQp3b3VsZCBhcHBseSBjbGVhbmx5IGFnYWluc3QgZG9jcyBuZXh0IHRyZWUu
CgpTbywgcGxlYXNlIGFwcGx5IGl0IHZpYSB0aGUgc3Vic3lzdGVtIHRyZWVzLiBPdGhlcndpc2Us
IHRoZXkgY291bGQKYmUgcHVzaGVkIGJ5IHRoZSBlbmQgb2YgdGhlIG1lcmdlIHdpbmRvdyBvciBm
b3IgLXJjMSB2aWEgYSBkb2NzIHRyZWUuCgpNb3N0LCBpZiBub3QgYWxsIHdlcmUgSSBhbHJlYWR5
IHNlbnQuCgoKTWF1cm8gQ2FydmFsaG8gQ2hlaGFiICg5KToKICBocnRpbWVyOiBVc2UgYSBidWxs
ZXQgZm9yIHRoZSByZXR1cm5zIGJ1bGxldCBsaXN0CiAgZG9jczogdHJhY2U6IGZpeCBhIGJyb2tl
biBsYWJlbAogIGRvY3M6IHNpZ25hbDogZml4IGEga2VybmVsLWRvYyBtYXJrdXAKICBkdDogbGVk
cy1sbTM2Mjc0LnR4dDogZml4IGEgYnJva2VuIHJlZmVyZW5jZSB0byB0aS1sbXUudHh0CiAgZG9j
czogZml4IHNvbWUgYnJva2VuIHJlZmVyZW5jZXMgZHVlIHRvIHR4dC0+cnN0IHJlbmFtZXMKICBk
b2NzOiB2aXJ0dWFsOiB0aGVyZSBhcmUgdHdvIG9ycGhhbiBkb2NzIHRoZXJlCiAgZG9jczogZ3B1
OiBhZGQgbXNtLWNyYXNoLWR1bXAucnN0IHRvIHRoZSBpbmRleC5yc3QgZmlsZQogIGRybTogZml4
IGEgcmVmZXJlbmNlIGZvciBhIHJlbmFtZWQgZmlsZTogZmIvbW9kZWRiLnJzdAogIHBsYXRmb3Jt
OiB4ODY6IGdldCByaWQgb2YgYSBub24tZXhpc3RlbnQgZG9jdW1lbnQKCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUtc3RhdGVzLnR4dCAgIHwgMiArLQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1sbTM2Mjc0LnR4dCB8IDIgKy0K
IERvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxICsKIERvY3VtZW50YXRpb24vZ3B1L21zbS1jcmFzaC1kdW1wLnJzdCAgICAgICAgICAgICAg
ICAgICAgfCAyIC0tCiBEb2N1bWVudGF0aW9uL3RyYWNlL2twcm9iZXRyYWNlLnJzdCAgICAgICAg
ICAgICAgICAgICAgIHwgMSArCiBEb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2FtZC1tZW1vcnkt
ZW5jcnlwdGlvbi5yc3QgICAgIHwgMiArKwogRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS92Y3B1
LXJlcXVlc3RzLnJzdCAgICAgICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9ydW50aW1lX3BtLmggICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1udmlkaWEtZ3B1LmMgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRy
aXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAz
IC0tLQoga2VybmVsL3NpZ25hbC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIGtlcm5lbC90aW1lL2hydGltZXIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA3ICsrKystLS0KIDEzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDE0IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
