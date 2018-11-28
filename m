From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Wed, 28 Nov 2018 12:14:34 +0100
Message-ID: <20181128111434.obgjtzpm6zwz5c43@pali>
References: <20181126171126.20280-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20181126171126.20280-1-tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

T24gTW9uZGF5IDI2IE5vdmVtYmVyIDIwMTggMTg6MTE6MjAgVGFrYXNoaSBJd2FpIHdyb3RlOgo+
IEhpLAo+IAo+IHRoaXMgaXMgcGF0Y2ggc2VyaWVzIEkndmUgaGFja2VkIGFmdGVyIHVzZWZ1bCBj
b252ZXJzYXRpb24gd2l0aAo+IFBhdmVsLiAgQmFzaWNhbGx5IHRoaXMgYWRkcyBhIG5ldyBMRUQg
dHJpZ2dlciBhdWRpby1tdXRlIGFuZAo+IGF1ZGlvLW1pY211dGUsIGFuZCBjb252ZXJ0IHRoZSBI
RC1hdWRpbyBkcml2ZXIgYW5kIHRoZSBwbGF0Zm9ybQo+IGRyaXZlcnMgdG8gdXNlIHRoZSBMRUQg
dHJpZ2dlciBpbnN0ZWFkIG9mIHRoZSB1Z2x5IGRpcmVjdCBkeW5hbWljCj4gc3ltYm9sIGJpbmRp
bmcuCj4gCj4gVGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHBhdGNoZXMgYXJlIGZvdW5kIGluIHRvcGlj
L2xlZHMtdHJpZ2dlciBicmFuY2gKPiBpbiBteSBzb3VuZCBnaXQgdHJlZS4KPiAgIGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXdhaS9zb3VuZC5naXQKPiAK
PiBBcyB0aGVzZSBhcmUgY3Jvc3MtdHJlZSBwYXRjaGVzLCB0aGUgYnJhbmNoIGFib3ZlIGlzIGJh
c2VkIGNsZWFubHkgb24KPiB2NC4yMC1yYzMsIHNvIHRoYXQgaXQgY2FuIGJlIG1lcmdlZCB3ZWxs
IHRvIG11bHRpcGxlIHRyZWVzLgo+IAo+IE9uY2UgYWZ0ZXIgZ2V0dGluZyB0aGUgQUNLJ3MsIEkn
bGwgYWRkIHRhZ3MgYW5kIGZpeGF0ZSBmb3IgbWVyZ2VzLgo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVz
IGRvbid0IGluY2x1ZGUgaHVhd2VpLXdtaSBzdHVmZjsgc28gSHVhd2VpIHBhdGNoZXMKPiBuZWVk
IHJld29yay4gIEkgYWxyZWFkeSBoYXZlIHNvbWUgcGllY2Ugb2YgY2hhbmdlcyBmb3IgaHVhd2Vp
LXdtaSwgc28KPiBwbGVhc2UgcGluZyBtZSBpZiBuZWVkZWQuCj4gCj4gSSBjaGVja2VkIGJyaWVm
bHkgb24gbXkgRGVsbCBsYXB0b3AsIGFuZCBhIFRoaW5rcGFkIG1vZGVsLgo+IFdpZGVyIHRlc3Rz
IGFyZSBhcHByZWNpYXRlZCwgb2YgY291cnNlLgoKSGkhIFRoYW5rcyBmb3IgcGF0Y2ggc2VyaWVz
LiBJdCBpcyByZWFsbHkgaW1wcm92ZW1lbnQgaW4gY3VycmVudCBtdXRlCmxlZCBzaXR1YXRpb24u
IEkgcXVpY2tseSBsb29rZWQgYXQgcGF0Y2hlcyBhbmQgdGhleSBsb29rIGdvb2QuIFNvIHlvdQpj
YW4gYWRkIG15IEFja2VkLUJ5OiBQYWxpIFJvaMOhciA8cGFsaS5yb2hhckBnbWFpbC5jb20+LgoK
LS0gClBhbGkgUm9ow6FyCnBhbGkucm9oYXJAZ21haWwuY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
