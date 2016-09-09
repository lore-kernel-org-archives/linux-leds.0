From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH V5] leds: trigger: Introduce a USB port trigger
Date: Fri, 9 Sep 2016 17:34:40 +0800
Message-ID: <20160909093440.GF15637@b29397-desktop>
References: <20160908160904.31719-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35444 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbcIIJer (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Sep 2016 05:34:47 -0400
Content-Disposition: inline
In-Reply-To: <20160908160904.31719-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Pavel Machek <pavel@ucw.cz>, Stephan Linz <linz@li-pro.net>, Boris Brezillon <boris.brezillon@free-electrons.com>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>

On Thu, Sep 08, 2016 at 06:08:24PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This commit adds a new trigger responsible for turning on LED when USB
> device gets connected to the selected USB port. This can can useful for
> various home routers that have USB port(s) and a proper LED telling user
> a device is connected.
> 
> The trigger gets its documentation file but basically it just requires
> enabling it and selecting USB ports (e.g. echo 1 > ports/usb1-1).
> 
> There was a long discussion on design of this driver. Its current state
> is a result of picking them most adjustable solution as others couldn't
> handle all cases.
> 
> 1) It wasn't possible for the driver to register separated trigger for
>    each USB port. Some physical USB ports are handled by more than one
>    controller and so by more than one USB port. E.g. USB 2.0 physical
>    port may be handled by OHCI's port and EHCI's port.
>    It's also not possible to assign more than 1 trigger to a single LED
>    and implementing such feature would be tricky due to syncing triggers
>    and sysfs conflicts with old triggers.
> 
> 2) Another idea was to register trigger per USB hub. This wouldn't allow
>    handling devices with multiple USB LEDs and controllers (hubs)
>    controlling more than 1 physical port. It's common for hubs to have
>    few ports and each may have its own LED.
> 
> This final trigger is highly flexible. It allows selecting any USB ports
> for any LED. It was also modified (compared to the initial version) to
> allow choosing ports rather than having user /guess/ proper names. It
> was successfully tested on SmartRG SR400ac which has 3 USB LEDs,
> 2 physical ports and 3 controllers.
> 
> Another planned feature is support for LED reacting to the USB activity.
> This can be implemented with another sysfs file for setting mode. The
> default mode wouldn't change so there won't be ABI breakage and such
> feature can be safely implemented later.
> 

It has such driver at: drivers/usb/common/led.c

-- 

Best Regards,
Peter Chen
