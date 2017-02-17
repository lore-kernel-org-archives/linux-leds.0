From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 1/7] dell-led: remove GUID check from
	dell_micmute_led_set()
Date: Fri, 17 Feb 2017 08:57:47 +0100
Message-ID: <20170217075753.12702-2-kernel@kempniu.pl>
References: <20170217075753.12702-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20170217075753.12702-1-kernel@kempniu.pl>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, Alex Hung <alex.hung@canonical.com>, alsa-devel@alsa-project.org, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

QXMgZGVsbF9taWNtdXRlX2xlZF9zZXQoKSBubyBsb25nZXIgdXNlcyB0aGUgZGVsbF93bWlfcGVy
Zm9ybV9xdWVyeSgpCm1ldGhvZCwgd2hpY2ggd2FzIHJlbW92ZWQgaW4gY29tbWl0IDBjNDFhMDhl
MTMxZCAoImRlbGwtbGVkOiB1c2UKZGVsbF9zbWJpb3Nfc2VuZF9yZXF1ZXN0KCkgZm9yIHBlcmZv
cm1pbmcgU01CSU9TIGNhbGxzIiksIHRoZQpERUxMX0FQUF9HVUlEIGNoZWNrIGlzIHJlZHVuZGFu
dCBhbmQgdGh1cyBjYW4gYmUgc2FmZWx5IHJlbW92ZWQuCgpTaWduZWQtb2ZmLWJ5OiBNaWNoYcWC
IEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4KVGVzdGVkLWJ5OiBBbGV4IEh1bmcgPGFsZXgu
aHVuZ0BjYW5vbmljYWwuY29tPgpSZXZpZXdlZC1ieTogUGFsaSBSb2jDoXIgPHBhbGkucm9oYXJA
Z21haWwuY29tPgotLS0KIGRyaXZlcnMvbGVkcy9kZWxsLWxlZC5jIHwgMyAtLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9kZWxsLWxl
ZC5jIGIvZHJpdmVycy9sZWRzL2RlbGwtbGVkLmMKaW5kZXggYjNkNmU5YzE1Y2Y5Li5lOGU4ZjY3
MjI0YzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbGVkcy9kZWxsLWxlZC5jCisrKyBiL2RyaXZlcnMv
bGVkcy9kZWxsLWxlZC5jCkBAIC01MSw5ICs1MSw2IEBAIHN0YXRpYyBpbnQgZGVsbF9taWNtdXRl
X2xlZF9zZXQoaW50IHN0YXRlKQogCXN0cnVjdCBjYWxsaW5nX2ludGVyZmFjZV9idWZmZXIgKmJ1
ZmZlcjsKIAlzdHJ1Y3QgY2FsbGluZ19pbnRlcmZhY2VfdG9rZW4gKnRva2VuOwogCi0JaWYgKCF3
bWlfaGFzX2d1aWQoREVMTF9BUFBfR1VJRCkpCi0JCXJldHVybiAtRU5PREVWOwotCiAJaWYgKHN0
YXRlID09IDApCiAJCXRva2VuID0gZGVsbF9zbWJpb3NfZmluZF90b2tlbihHTE9CQUxfTUlDX01V
VEVfRElTQUJMRSk7CiAJZWxzZSBpZiAoc3RhdGUgPT0gMSkKLS0gCjIuMTEuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHA6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
