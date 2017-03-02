From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/2] leds: core: add struct device_node pointer to the
 struct led_classdev
Date: Thu, 2 Mar 2017 21:29:52 +0100
Message-ID: <40a9e4b2-bafa-9503-14b2-5ff6046d561e@gmail.com>
References: <20170227222300.2060-1-zajec5@gmail.com>
 <a535b820-b29f-252f-ba55-25a2f376f773@gmail.com>
 <CACna6ry3WTZcGntsaD8UsFxNDW-7G0Q6n6z=MBTCLh8PDJ=0rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36200 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751558AbdCBUhg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Mar 2017 15:37:36 -0500
Received: by mail-wr0-f194.google.com with SMTP id l37so10960025wrc.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Mar 2017 12:37:35 -0800 (PST)
In-Reply-To: <CACna6ry3WTZcGntsaD8UsFxNDW-7G0Q6n6z=MBTCLh8PDJ=0rQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 03/02/2017 06:42 PM, Rafał Miłecki wrote:
> On 28 February 2017 at 22:20, Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> Thanks for the patch. How about following what has been already
>> done for spi, i.e. adding a wrapper of_led_classdev_register()
>> (please refer to of_register_spi_device() in drivers/spi/spi.c)?
> 
> I like this idea, but I'll need to split led_classdev_register into
> two functions: allocation & actual registering function. That way I
> can alloc, then read DT proprties and finally register LED (just like
> it's done in of_register_spi_device).
> 
> Does it sound OK?

Yes, after thinking a bit more about that I came to the same
conclusion.

-- 
Best regards,
Jacek Anaszewski
