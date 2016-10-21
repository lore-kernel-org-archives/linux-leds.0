From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH] leds: Add user LED driver for NIC78bx device
Date: Fri, 21 Oct 2016 16:33:47 -0500
Message-ID: <20161021213347.GA15895@jcartwri.amer.corp.natinst.com>
References: <CGME20161021063441eucas1p221cdc9bd704f03ad367df8cf59fa35e6@eucas1p2.samsung.com>
 <1477031633-70909-1-git-send-email-hui.chun.ong@ni.com>
 <335a9cd9-2af7-2d7c-12ab-1000dddbd0d6@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from skprod3.natinst.com ([130.164.80.24]:37630 "EHLO ni.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933445AbcJUVfE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 21 Oct 2016 17:35:04 -0400
In-Reply-To: <335a9cd9-2af7-2d7c-12ab-1000dddbd0d6@samsung.com>
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hui Chun Ong <hui.chun.ong@ni.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jonathan.hearn@ni.com, Brad Mouring <brad.mouring@ni.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Fri, Oct 21, 2016 at 02:56:15PM +0200, Jacek Anaszewski wrote:
> Hi Hui,
> 
> Thanks for the patch. I have few comments in the code below.
> 
> On 10/21/2016 08:33 AM, Hui Chun Ong wrote:
> > Add the driver to support User LEDs on PXI Embedded Controller.
> > 
> > Signed-off-by: Hui Chun Ong <hui.chun.ong@ni.com>
> > Signed-off-by: Brad Mouring <brad.mouring@ni.com>
[..]
> 
> > +
> > +struct ni78bx_led {
> > +	u8 bit;
> > +	u8 mask;
> > +	struct led_classdev cdev;
> > +};
> > +
> > +static inline struct ni78bx_led *to_ni78bx_led(struct led_classdev *cdev)
> > +{
> > +	return container_of(cdev, struct ni78bx_led, cdev);
> > +}
> > +
> > +static void ni78bx_brightness_set(struct led_classdev *cdev,
> > +				  enum led_brightness brightness)
> > +{
> > +	struct ni78bx_led *nled = to_ni78bx_led(cdev);
> > +	u8 value;
> > +
> > +	mutex_lock(&led_lock);
> 
> You can use spin_lock_irqsave() instead, since we are not going to sleep
> while accessing memory mapped registers.

Could you explain why spin_lock_irqsave() is appropriate here?  This
device doesn't have an interrupt to be synchronized with.  I could
understand spin_lock()/spin_unlock(), maybe, but why disable interrupts?

Is what you're saying that the set/get brightness calls can be re-entered
by LED consumers in hardirq context?

The systems this driver is deployed to is much more sensitive to RT
execution latency than anything else, which is why I take pause to
unnecessary interrupt mask twiddling/preemption disabling :).

   Julia
