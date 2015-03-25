From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Wed, 25 Mar 2015 15:02:43 +0200
Message-ID: <20150325130243.GL18321@valkosipuli.retiisi.org.uk>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com>
 <20150325005429.GF18321@valkosipuli.retiisi.org.uk>
 <CAPybu_0ho2FhPXjhcWw7L=7o5OivRbOgrzFcB9-iKLfy9OpONQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:50966 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751558AbbCYNDR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Wed, 25 Mar 2015 09:03:17 -0400
Content-Disposition: inline
In-Reply-To: <CAPybu_0ho2FhPXjhcWw7L=7o5OivRbOgrzFcB9-iKLfy9OpONQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, j.anaszewski@samsung.com

Hi Ricardo,

On Wed, Mar 25, 2015 at 10:20:59AM +0100, Ricardo Ribalda Delgado wrote:
> Hi Sakari
> 
> On Wed, Mar 25, 2015 at 1:54 AM, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > I'd use dev_warn() or even WARN_ON(ret). This is a rather serious issue as
> > now the probe order defines the name of the device. There might be something
> > better such as the I2C bus/address.
> 
> I have no problem in sending a dev_warn, WARN_ON looks too much to me.
> 
> In my example (dt overlays), it is perfectly ok to have duplicated names.
> 
> >
> > If the registration order for some reason changes, that'd revert the device
> > names. In Media controller this is part of the user space API.
> 
> Would it be possible for media controller leds to have a name based on
> their address?

It's included where there's a stable address. That's not true for GPIO
controlled devices though, it's a GPIO controller plus a number. Ramming
lots of information to the media entity's name field is not possible since
it's just 32 bytes; for this reason we're looking to implement a better way
to recognise devices in MC. But for now, we got to cope with what we have.

> Regarding s/dev_info/dev_warn : Do you want to send the patch or I should do it?

Is this one merged already? If yes, sure I can. Otherwise a new version
would be nice.

-- 
Cheers,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
