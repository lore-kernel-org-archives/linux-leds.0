From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 4/5] firmware: add SmPL report for custom fallback
 mechanism
Date: Wed, 11 Jan 2017 19:51:12 +0100
Message-ID: <20170111185112.GO13946@wotan.suse.de>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <CGME20161213030855epcas2p154c4db65f0d1e5b0c47979dc8500517d@epcas2p1.samsung.com>
 <20161213030828.17820-5-mcgrof@kernel.org>
 <10f8c7f7-a255-4830-65f0-a040d8236bf1@samsung.com>
 <271c9d23-d35e-252b-d03b-651457112d28@gmail.com>
 <20161216092952.GQ13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161216092952.GQ13946@wotan.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Milo Kim <woogyom.kim@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: mcgrof@kernel.org, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Dec 16, 2016 at 10:29:52AM +0100, Luis R. Rodriguez wrote:
> On Wed, Dec 14, 2016 at 10:48:37AM +0900, Milo Kim wrote:
> > Hi Jacek,
> > 
> > On 12/13/2016 06:44 PM, Jacek Anaszewski wrote:
> > > 
> > > Could you please verify if leds-lp55xx-common.c driver
> > > really needs a custom firmware loading fallback mechanism?
> > 
> > Thanks for sharing this. The lp55xx-common uses this mechanism to load and
> > run LED effect manually, so this could be a misuse case.
> > I think the right solution is providing device attributes.
> 
> Run LED manually using request_firmware()? What the.. yes this sounds odd.
> 
> > At this moment, four drivers use lp55xx-common code.
> > 
> > - lp5521, lp5523: OK if we do not support FW loading fallback mechanism
> > - lp5562, lp8501: need to create additional sysfs alternatively.
> 
> Phew!
> 
> > However, we should be careful because I'm not sure this modification will
> > generate the regression (breaking the user-space) or not.
> 
> Right so not breaking old userspace is critical.

So to recap:

What you can do is add support for the new interface and recommend folks
to use it. We just cannot break old userspace relying on the same module.

So the currently proposed DECLARE_FW_CUSTOM_FALLBACK() is still justified
for this driver. As stupid as the original implementation may have been
its there.. and we just have to deal with it. I would seriously appreciate
a revamp update on the Documentation/leds/leds-lp55xx.txt documentation though
with everything that we have discussed.

  Luis
