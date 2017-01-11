From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v2 4/5] firmware: add SmPL report for custom fallback
 mechanism
Date: Wed, 11 Jan 2017 15:02:22 +0100
Message-ID: <20170111140222.GK13946@wotan.suse.de>
References: <20161216111038.22064-1-mcgrof@kernel.org>
 <20161216111038.22064-5-mcgrof@kernel.org>
 <20170111083226.GA26154@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58310 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S967099AbdAKOCb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Jan 2017 09:02:31 -0500
Content-Disposition: inline
In-Reply-To: <20170111083226.GA26154@kroah.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.ker

On Wed, Jan 11, 2017 at 09:32:26AM +0100, Greg KH wrote:
> On Fri, Dec 16, 2016 at 03:10:37AM -0800, Luis R. Rodriguez wrote:
> > Even though most distributions today disable the fallback mechanism
> > by default we've determined that we cannot remove them from the kernel.
> > This is not well understood so document the reason and logic behind that.
> 
> Well, the biggest reason is that some distros still rely on this.  I've
> seen new products being made that rely on it,

Let's be a bit more precise: upstream there are only two driver relying on this
and I've learned about the non-upstream uses which folks have been calling for
ensuring this functionality is kept for: a) non-upstream mobile 802.11 drivers or
upstream 802.11 drivers with slight out-of-tree customizations with a requirements to
get calibration data using custom mechanisms b) remote-proc users with huge firmware
requirements for which initramfs is not well suited for.

I've taken these requirements seriously in this series. Perhaps this is not well
reflected in the series enough so let me elaborate.

> so let's please stop
> treating it like it is somehow a "deprecated" interface.

In this series I no longer treats it as a deprecated interface.  This series
however does acknowledge a bit of the drawbacks and cautions folks should take
when using these interfaces though. These issues are real.

> We can't get rid of it,

I am way past that point. I've had to personally deal with both pushes now: the
misplaced crusade against the both the mislabeled "firmware usermode helper" which
was originally actually caused by the "firmware timeout issue" and now properly
diagnosed, and later those out of a) and b) users. I've listened to both carefully
and given this much thought and discussion at Plumbers through hallway tracks
and private exchanges including with systemd folks and have tried to itemize
the current drawbacks and also finally address them. One thing is clear: the
out of tree custom fallback users simply need a custom way to load firmware,
the use of the kobject driven uevent mechanism should suffice, its just we
never had a clear documented way to enable custom solutions. In discussions
with Tom Gundersen, and Johannes Berg it seems we can enable these users easily
with the kobject uevent fallback mechanism, we just need to address the existing
drawback issues. This means if taking into consideration upstream and
non-upstream drivers -- the custom fallback mechanism becomes more of a legacy thing.
So sure -- we cannot remove it, but we should avoid more propagation of it by
mistake upstream, and hence this patch.

To this end my new goal is to first properly label and document the interfaces first, 
then to itemize the drawbacks of the "custom firmware fallback mechanism", avoid further
copy and paste bugs which implicated the "custom firmware fallback mechanism" and were
frequent before (its the purpose of this patch). Then work with kernel/systemd folks
to provide a proper resolution to the drawbacks as best as we can for the general
uevent kobject fallback mechanism. This solution will work for the existing
request_firmware_nowait() API, so it will benefit from it, but only once that is
properly hashed out will I plan to add equivalent a fallback mechanism to the
drvdata API.

> so we just have to live with it, for forever, sorry.

This documentation revamp acknowledges this, but paves the way for what we
need to do for the old users of the custom fallback mechanism and of the
users which I've heard from which need a type of fallback mechanism. The
next patch white-lists though the few old upstream uses of the custom
fallback mechanism.

The plan is to never remove the old custom fallback mechanism then. The
drvdata API will start without any fallback mechanism to start with but
the plan is to incorporate support for one once we iron out all the kinks
for a clean solution for a general fallback mechanism we are happy with.

The old custom fallback mechanism will be kept forever.

  Luis
