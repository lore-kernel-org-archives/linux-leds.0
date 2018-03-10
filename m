From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: Re: [PATCH v12] ath10k: add LED and GPIO controlling support for
 various chipsets
Date: Sat, 10 Mar 2018 08:56:07 +0100
Message-ID: <40dc5bc3-d77e-397d-f3db-2efb70ff82ae@dd-wrt.com>
References: <20180226084406.2093-1-s.gottschall@dd-wrt.com>
 <CACna6rzD6z3DC6yjMCgBxgxx+DF+GGu69Ot5QA6xpJ41Ewb2=A@mail.gmail.com>
 <82d8ac0c-b391-6099-4c7f-991cc35445aa@dd-wrt.com>
 <20180302090312.GA30267@amd>
 <e77d25d4-a824-380a-c51a-e81175ba6205@dd-wrt.com>
 <CACna6rys85VEkzRGDVUAkBy7KgHS2y0DET7YvedboX-YEQHrkg@mail.gmail.com>
 <890a4dcc-f549-6487-2ce5-3b62874cd266@dd-wrt.com>
 <20180308090216.GC17761@amd>
 <d443856e-cfc8-2d50-900d-edf22e5360e3@dd-wrt.com> <20180308140515.GA4889@amd>
 <1b1f6344-d588-d2f2-4b3d-a0a4043e801f@nbd.name>
 <CAGRGNgWSnObB8PomPPEGs533dmFyQQkOEsvxzyJ=BfBBcWT2Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGRGNgWSnObB8PomPPEGs533dmFyQQkOEsvxzyJ=BfBBcWT2Ug@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org
To: Julian Calaby <julian.calaby@gmail.com>, Felix Fietkau <nbd@nbd.name>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, Kalle Valo <kvalo@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

Cj4+IHRha2VuIGEgbG9vayBhdCB0aGUgc3BlY2lmaWMgY29kZSwgYW5kIGZyb20gbXkgcG9pbnQg
b2YgdmlldyB0aGUgY29kZQo+PiB0aGF0IHNldHMgdXAgdGhlIExFRCAoaW5jbHVkaW5nIGNhbGxi
YWNrKSBpcyBzbyB0cml2aWFsIHRoYXQgaXQncyBzaW1wbHkKPj4gbm90IHdvcnRoIGRlYWxpbmcg
d2l0aCBhZGRpbmcgdGhlIGxlZHMtZ3BpbyBkcml2ZXIgdG8gdGhlIG1peC4KPj4gSXQgYWRkcyBl
eHRyYSBjb21wbGV4aXR5IGFuZCBhbiBleHRyYSBkZXBlbmRlbmN5IGZvciBubyByZWFzb24gYXQg
YWxsLgo+PiBUaGVyZSdzIG5vIGV4dHJhIGZ1bmN0aW9uYWxpdHkgdG8gYmUgZ2FpbmVkIGJ5IHVz
aW5nIGl0Lgo+IFN0dXBpZCBxdWVzdGlvbjogSWYgdGhlIExFRCBkcml2ZXIgaXNuJ3QgdXNpbmcg
dGhlIEdQSU8gc3Vic3lzdGVtCj4gKHdoZW4gZW5hYmxlZCksIHdoYXQgaGFwcGVucyBpZiB0aGUg
dXNlciB1c2VzIHRoZSBHUElPIHN1YnN5c3RlbSB0bwo+IGZpZGRsZSB3aXRoIHRoZSBwaW4gdGhl
IExFRCBpcyBjb25uZWN0ZWQgdG8/CgppbiBvdXIgY2FzZSBoZXJlIGl0IGNhbiBjb2V4aXN0IGFu
ZCB3aWxsIG5vdCBoYXZlIGEgbmVnYXRpdmUgZWZmZWN0IApzaW5jZSB0aGUgbGVkIHdpbGwgc3Rp
bGwgcnVuLiAoZXhjZXB0IGlmIHlvdSByZWNvbmZpZ3VyZSB0aGUgZ3BpbyB0byBpbnB1dCkKZm9y
IHN1cmUgaXQgbWFrZXMgbm8gc2Vuc2UuCmJ1dCBob3dldmVyIGkgY2FuIGJsb2NrIHRoZSBncGlv
IGZvciBiZWVpbmcgcmV1c2VkIGlmIHRoZSBsZWQgZHJpdmVyIAp0b29rIGl0LiB0aGlzIGhhcyBi
ZWVuIG1hZGUgaW4gYXRoOWsgZm9yIGluc3RhbmNlLgppbiBhdGgxMGsgaSBkaWQgbm90IGRvIGl0
LCBzaW5jZSB0aGVyZSBpcyBubyB0ZWNobmljYWwgcmVxdWlyZW1lbnQgZm9yIGl0LgpidXQgdGhh
dCBtaWdodCBub3QgYmUgdGhlIGNhc2UgZm9yIGFsbCBncGlvIGNvbnRyb2xsZXJzLCBzbyB0aGVy
ZSBpcyBubyAKZ2VuZXJpYyBhbnN3ZXIuIGZvciBhdGgxMGsuIGhhcm1sZXNzCgpTZWJhc3RpYW4K
Pgo+IFRoYW5rcywKPgoKLS0gCk1pdCBmcmV1bmRsaWNoZW4gR3LDvHNzZW4gLyBSZWdhcmRzCgpT
ZWJhc3RpYW4gR290dHNjaGFsbCAvIENUTwoKTmV3TWVkaWEtTkVUIEdtYkggLSBERC1XUlQKRmly
bWVuc2l0ejogIFN0dWJlbndhbGRhbGxlZSAyMWEsIDY0NjI1IEJlbnNoZWltClJlZ2lzdGVyZ2Vy
aWNodDogQW10c2dlcmljaHQgRGFybXN0YWR0LCBIUkIgMjU0NzMKR2VzY2jDpGZ0c2bDvGhyZXI6
IFBldGVyIFN0ZWluaMOkdXNlciwgQ2hyaXN0aWFuIFNjaGVlbGUKaHR0cDovL3d3dy5kZC13cnQu
Y29tCmVtYWlsOiBzLmdvdHRzY2hhbGxAZGQtd3J0LmNvbQpUZWwuOiArNDk2MjUxLTU4MjY1MCAv
IEZheDogKzQ5NjI1MS01ODI2NTY1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
