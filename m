From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v4 2/2] firmware: add DECLARE_FW_CUSTOM_FALLBACK()
 annotation
Date: Thu, 19 Jan 2017 17:08:25 +0100
Message-ID: <20170119160825.GI13946@wotan.suse.de>
References: <20161213030828.17820-4-mcgrof@kernel.org>
 <20170112144250.12376-1-mcgrof@kernel.org>
 <20170112144250.12376-3-mcgrof@kernel.org>
 <20170119113111.GO28024@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60237 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753382AbdASQK7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Jan 2017 11:10:59 -0500
Content-Disposition: inline
In-Reply-To: <20170119113111.GO28024@kroah.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, ming.lei@canonical.com, bp@alien8.de, wagi@monom.org, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.k

On Thu, Jan 19, 2017 at 12:31:11PM +0100, Greg KH wrote:
> On Thu, Jan 12, 2017 at 06:42:50AM -0800, Luis R. Rodriguez wrote:
> > +Invalid users of the custom fallback mechanism can be policed using::
> 
> Ick, no, why?  Why not just add a checkpatch rule instead?

If its easy to do, how would we do that?

> >  
> >          $ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
> >          $ make coccicheck MODE=report
> > diff --git a/drivers/firmware/dell_rbu.c b/drivers/firmware/dell_rbu.c
> > index 2f452f1f7c8a..3f2aa35bc54d 100644
> > --- a/drivers/firmware/dell_rbu.c
> > +++ b/drivers/firmware/dell_rbu.c
> > @@ -586,6 +586,7 @@ static ssize_t read_rbu_image_type(struct file *filp, struct kobject *kobj,
> >  	return size;
> >  }
> >  
> > +DECLARE_FW_CUSTOM_FALLBACK("Documentation/dell_rbu.txt");
> 
> That's a pain.

It is easier with checkpatch?

> > diff --git a/include/linux/firmware.h b/include/linux/firmware.h
> > index b1f9f0ccb8ac..e6ca19c03dcc 100644
> > --- a/include/linux/firmware.h
> > +++ b/include/linux/firmware.h
> > @@ -8,6 +8,13 @@
> >  #define FW_ACTION_NOHOTPLUG 0
> >  #define FW_ACTION_HOTPLUG 1
> >  
> > +/*
> > + * Helper for scripts/coccinelle/api/request_firmware-custom-fallback.cocci
> > + * and so users can also easily search for the documentation for the
> > + * respectively needed custom fallback mechanism.
> > + */
> > +#define DECLARE_FW_CUSTOM_FALLBACK(__usermode_helper)
> 
> So you really don't need to put anything "valid" in the define argument?
> This feels like such a horrid hack, I really don't like it, especially
> as we don't do it anywhere else in the kernel, right?  Why start now?

Correct me if I'm wrong but AFAICT we may not have had previous grammatical
policing done before so I think this is a question of how we would want to
handle such type of strategies. Indeed this is just one approach. Using
checkpatch is certainly possible as well, I however think using checkpatch
is a bit more hacky.

I could also just drop this completely but figured its worth discussion.

  Luis
