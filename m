From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/2] firmware: add DECLARE_FW_CUSTOM_FALLBACK()
 annotation
Date: Thu, 19 Jan 2017 17:14:36 +0100
Message-ID: <20170119161435.GA13166@kroah.com>
References: <20161213030828.17820-4-mcgrof@kernel.org>
 <20170112144250.12376-1-mcgrof@kernel.org>
 <20170112144250.12376-3-mcgrof@kernel.org>
 <20170119113111.GO28024@kroah.com>
 <20170119160825.GI13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170119160825.GI13946@wotan.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: ming.lei@canonical.com, bp@alien8.de, wagi@monom.org, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Jan 19, 2017 at 05:08:25PM +0100, Luis R. Rodriguez wrote:
> On Thu, Jan 19, 2017 at 12:31:11PM +0100, Greg KH wrote:
> > On Thu, Jan 12, 2017 at 06:42:50AM -0800, Luis R. Rodriguez wrote:
> > > +Invalid users of the custom fallback mechanism can be policed using::
> > 
> > Ick, no, why?  Why not just add a checkpatch rule instead?
> 
> If its easy to do, how would we do that?

You just patch checkpatch.pl to test for the apis you don't want used
anymore.

> > >          $ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
> > >          $ make coccicheck MODE=report
> > > diff --git a/drivers/firmware/dell_rbu.c b/drivers/firmware/dell_rbu.c
> > > index 2f452f1f7c8a..3f2aa35bc54d 100644
> > > --- a/drivers/firmware/dell_rbu.c
> > > +++ b/drivers/firmware/dell_rbu.c
> > > @@ -586,6 +586,7 @@ static ssize_t read_rbu_image_type(struct file *filp, struct kobject *kobj,
> > >  	return size;
> > >  }
> > >  
> > > +DECLARE_FW_CUSTOM_FALLBACK("Documentation/dell_rbu.txt");
> > 
> > That's a pain.
> 
> It is easier with checkpatch?

Yes.  You are modifying the .c code just to "whitelist" an api you want
to check for.  What's the odds that someone who wants to use that api
just cargo-cult-copies this line as well, to prevent the strange warning
they are getting from the build system?  :)

In short, don't worry about this, it's not a big deal nor really worth
the effort.

thanks,

greg k-h
