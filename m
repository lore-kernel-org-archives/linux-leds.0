From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 17:10:18 +0100
Message-ID: <20161216161017.GU13946@wotan.suse.de>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de>
 <20161216101405.GA29069@amd>
 <20161216105648.GT13946@wotan.suse.de>
 <20161216112700.GB29069@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60859 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754615AbcLPQM1 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Dec 2016 11:12:27 -0500
Content-Disposition: inline
In-Reply-To: <20161216112700.GB29069@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Milo Kim <woogyom.kim@gmail.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaur

On Fri, Dec 16, 2016 at 12:27:00PM +0100, Pavel Machek wrote:
> On Fri 2016-12-16 11:56:48, Luis R. Rodriguez wrote:
> > On Fri, Dec 16, 2016 at 11:14:05AM +0100, Pavel Machek wrote:
> > > 
> > > Well, I was asking if the above snipped looks like valid use. Because
> > > AFAICT, the "custom fallback" is just dev_err(), see above. Coccinelle
> > > rules don't help me...
> > 
> > Its not. Its when you ask for no uevent. Only 2 drivers do this.
> 
> That was one of two you listed. If that is not valid use, perhaps it
> should be removed, not annotated?

Ah, well Milo Kim replied and described that the custom fallback is used as to
help load LED effect manually, and suggested a sysfs interface is more ideal [0]. I
agree however its also may be too late, and it depends how wide spread this "userspace"
that relies on this is, we just can't break it. Granted the custom fallback
mechanism was broken since v4.0 (see the fix "firmware: fix usermode helper
fallback loading") so one may argue no one seems to care...

So this is a judgement call, and the declaration is to point to documentation
to white list uses, as terrible as this one is userspace exists for it. but
more importantly to also help the SmPL grammar report to avoid reporting
already vetted cases. The alarm / cases for the 2 drivers has been issueed,
moving forward the lack of declaration with the custom fallback should trigger
a rant through 0-day so we don't run into the same stupid situation.

[0] https://marc.info/?l=linux-kernel&m=148168024112445

  Luis
