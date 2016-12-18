From: Milo Kim <woogyom.kim@gmail.com>
Subject: Re: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Sun, 18 Dec 2016 12:50:43 +0900
Message-ID: <7292444e-43d8-3561-2835-34b75a650107@gmail.com>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <20161213030828.17820-6-mcgrof@kernel.org> <20161213190429.GC8676@amd>
 <20161216092241.GO13946@wotan.suse.de> <20161216092919.GA26091@amd>
 <20161216095906.GS13946@wotan.suse.de> <20161216101405.GA29069@amd>
 <20161216105648.GT13946@wotan.suse.de> <20161216112700.GB29069@amd>
 <20161216161017.GU13946@wotan.suse.de> <20161216161455.GV13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35546 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757127AbcLRDuy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Dec 2016 22:50:54 -0500
In-Reply-To: <20161216161455.GV13946@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org

Hi Luis,

On 12/17/2016 01:14 AM, Luis R. Rodriguez wrote:
> Milo if sysfs is used can't the old userspace be mapped to use the new
> sysfs interface through a wrapper of some sort ? What exactly would be
> needed to ensure old userspace will not break?

LP5521 and LP5523 have two ways to load hex code from the userspace - 
the sysfs and firmware I/F. So user program supports both interfaces. 
Even if the firmware I/F is not available, user can still run LED effect 
through the sysfs.

However, LP5562 and LP8501 support only single way which is the firmware 
I/F. So user-space program for LP5562/8501 should be modified if lp55xx 
removes the interface. My idea is

   Phase 1)
   - create sysfs in LP5562 and LP8501
   - use new sysfs inside the firmware I/F loading callback
   - mark the firmware callback as a deprecated interface

   Phase 2)
   - remove the firmware I/F after all user program fixes the interface
     (but the problem is how can we get to know when this is done?)

 > Why has no one cried
 > after the v4.0 custom fallback mechanism breaking ?

Well, I don't know the reason exactly but my guess is they maybe still 
using old kernel.

 > How wide spread is this custom userspace ?

Device manufactures in Asia & North America requested lp55xx drivers, 
but I don't know how many vendors uses the firmware I/F. Some vendors 
embeds the binary code inside the driver instead of using user-program.

I understood it's a kind of troublesome work in terms of the 
maintenance. Sorry for that. I hope we have a consensus to resolve it.
Thanks!

Best regards,
Milo
