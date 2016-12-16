From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Fri, 16 Dec 2016 17:14:55 +0100
Message-ID: <20161216161455.GV13946@wotan.suse.de>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org>
 <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de>
 <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de>
 <20161216101405.GA29069@amd>
 <20161216105648.GT13946@wotan.suse.de>
 <20161216112700.GB29069@amd>
 <20161216161017.GU13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33153 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932462AbcLPQO6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Dec 2016 11:14:58 -0500
Content-Disposition: inline
In-Reply-To: <20161216161017.GU13946@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Milo Kim <woogyom.kim@gmail.com>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broad

On Fri, Dec 16, 2016 at 05:10:18PM +0100, Luis R. Rodriguez wrote:
> Ah, well Milo Kim replied and described that the custom fallback is used as to
> help load LED effect manually, and suggested a sysfs interface is more ideal [0]. I
> agree however its also may be too late, and it depends how wide spread this "userspace"
> that relies on this is, we just can't break it. Granted the custom fallback
> mechanism was broken since v4.0 (see the fix "firmware: fix usermode helper
> fallback loading") so one may argue no one seems to care...
> 
> So this is a judgement call, and the declaration is to point to documentation
> to white list uses, as terrible as this one is userspace exists for it. but
> more importantly to also help the SmPL grammar report to avoid reporting
> already vetted cases. The alarm / cases for the 2 drivers has been issueed,
> moving forward the lack of declaration with the custom fallback should trigger
> a rant through 0-day so we don't run into the same stupid situation.
> 
> [0] https://marc.info/?l=linux-kernel&m=148168024112445

Milo if sysfs is used can't the old userspace be mapped to use the new 
sysfs interface through a wrapper of some sort ? What exactly would be
needed to ensure old userspace will not break? Why has no one cried
after the v4.0 custom fallback mechanism breaking ? How wide spread is
this custom userspace ?

  Luis
