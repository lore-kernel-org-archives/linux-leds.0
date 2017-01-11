From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 4/5] firmware: add SmPL report for custom fallback
 mechanism
Date: Wed, 11 Jan 2017 16:49:40 +0100
Message-ID: <20170111154940.GA5460@kroah.com>
References: <20161216111038.22064-1-mcgrof@kernel.org>
 <20161216111038.22064-5-mcgrof@kernel.org>
 <20170111083226.GA26154@kroah.com>
 <20170111140222.GK13946@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45368 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751225AbdAKPtT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Jan 2017 10:49:19 -0500
Content-Disposition: inline
In-Reply-To: <20170111140222.GK13946@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.kernel.org

On Wed, Jan 11, 2017 at 03:02:22PM +0100, Luis R. Rodriguez wrote:
> On Wed, Jan 11, 2017 at 09:32:26AM +0100, Greg KH wrote:
> > On Fri, Dec 16, 2016 at 03:10:37AM -0800, Luis R. Rodriguez wrote:
> > > Even though most distributions today disable the fallback mechanism
> > > by default we've determined that we cannot remove them from the kernel.
> > > This is not well understood so document the reason and logic behind that.
> > 
> > Well, the biggest reason is that some distros still rely on this.  I've
> > seen new products being made that rely on it,
> 
> Let's be a bit more precise: upstream there are only two driver relying on this
> and I've learned about the non-upstream uses which folks have been calling for
> ensuring this functionality is kept for: a) non-upstream mobile 802.11 drivers or
> upstream 802.11 drivers with slight out-of-tree customizations with a requirements to
> get calibration data using custom mechanisms b) remote-proc users with huge firmware
> requirements for which initramfs is not well suited for.

That b) is a lot of devices, I know of a few million phones in the wild
right now that rely on it.  And millions is a pretty big number :)

Anyway, thanks for addressing my concerns, I'm guessing you will respin
these remaining patches and resend them as I think there were still some
comments on them?  I took the first 3 here.

Is the "drvdata" code ready in your opinion to be merged / reviewed yet?

thanks,

greg k-h
