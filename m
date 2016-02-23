From: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Subject: Re: [PATCH RFC 3/3] leds: Add driver for the ISSI IS31FL32xx family
 of LED drivers
Date: Tue, 23 Feb 2016 17:38:41 -0500
Message-ID: <20160223173841.2f741421.drivshin.allworx@gmail.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
	<1456251445-23970-4-git-send-email-drivshin.allworx@gmail.com>
	<20160223184517.GB10246@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f66.google.com ([209.85.192.66]:34867 "EHLO
	mail-qg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755069AbcBWWiq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2016 17:38:46 -0500
In-Reply-To: <20160223184517.GB10246@leverpostej>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

On Tue, 23 Feb 2016 18:45:17 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Tue, Feb 23, 2016 at 01:17:25PM -0500, David Rivshin (Allworx) wrote:
> > From: David Rivshin <drivshin@allworx.com>
> > +static int is31fl32xx_parse_child_dt(const struct device *dev,
> > +				     const struct device_node *child,
> > +				     struct is31fl32xx_led_data *led_data)
> > +{
> > +	struct led_classdev *cdev = &led_data->cdev;
> > +	int ret = 0;
> > +	u32 reg;
> > +
> > +	cdev->name = of_get_property(child, "label", NULL) ? : child->name;  
> 
> We really shouldn't be spreading of_get_property into more drivers. It's
> generally not what you want, and doesn't do appropriate sanity checking.

Sorry, I copied the basic DT parsing from some other led driver (leds-pwm, 
I think), and did not check if there was a better way.

> Use of_property_read_string, though you may need to copy the result.

Will do. 

As far as copying the result, this is an area I'm fuzzy on. If I 
understand correctly the device_nodes are reference counted, and 
of_property_read_string() returns a pointer to the data inside the
device_node. So it seems I'd either need to hold onto a reference, 
or make a copy of the string.

devm_kstrdup() seems like it would be an easy way to go, although
maybe not the most efficient.

Using of_node_get() would seem to be more efficient, but then what 
would be the right way to release that reference on remove()? 
 - Does that already happen in some infrastructure when using DT 
   probing? 
 - Is there a devm_*() helper function that should be used? 
 - Or would it be best to just keep a pointer to the device_node so
   that of_node_put() can be called on remove()?

Also, I have yet to find an example of a driver which either copies 
the string or does an of_node_get() on the node. In fact just by a 
count of files, it seems very few have any hope of doing either:

$ find drivers/ -name '*.c' -exec grep of_property_read_string -l {} + \
| wc -l
197
$ find drivers/ -name '*.c' -exec grep of_property_read_string -l {} + \
| xargs grep -l of_node_get | wc -l
15
$ find drivers/ -name '*.c' -exec grep of_property_read_string -l {} + \
| xargs grep -l strdup | wc -l
11

So I'm very much hoping that there's some infrastructure automatically 
handling the appropriate reference counting, so that the nodes stay
around (at least) as long as the driver is instantiated...

> > +
> > +	ret = of_property_read_u32(child, "reg", &reg);
> > +	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
> > +		dev_err(dev,
> > +			"Child node %s does not have a valid reg property\n",
> > +			child->name);
> > +		return -EINVAL;
> > +	}
> > +	led_data->channel = reg;
> > +
> > +	cdev->default_trigger = of_get_property(child, "linux,default-trigger",
> > +						NULL);  
> 
> Likewise.

Will take care of this same as above.

Thanks!
