From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH v3] led/led-class: Handle LEDs with the same name
Date: Wed, 25 Mar 2015 10:20:59 +0100
Message-ID: <CAPybu_0ho2FhPXjhcWw7L=7o5OivRbOgrzFcB9-iKLfy9OpONQ@mail.gmail.com>
References: <1426287939-7596-1-git-send-email-ricardo.ribalda@gmail.com> <20150325005429.GF18321@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:36706 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084AbbCYJVU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 25 Mar 2015 05:21:20 -0400
In-Reply-To: <20150325005429.GF18321@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, j.anaszewski@samsung.com

Hi Sakari

On Wed, Mar 25, 2015 at 1:54 AM, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> I'd use dev_warn() or even WARN_ON(ret). This is a rather serious issue as
> now the probe order defines the name of the device. There might be something
> better such as the I2C bus/address.

I have no problem in sending a dev_warn, WARN_ON looks too much to me.

In my example (dt overlays), it is perfectly ok to have duplicated names.

>
> If the registration order for some reason changes, that'd revert the device
> names. In Media controller this is part of the user space API.

Would it be possible for media controller leds to have a name based on
their address?


Regarding s/dev_info/dev_warn : Do you want to send the patch or I should do it?

Regards!

-- 
Ricardo Ribalda
