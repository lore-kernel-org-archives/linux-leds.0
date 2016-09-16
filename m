From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 10:32:16 -0500
Message-ID: <2c48e1bf-ded8-223d-7077-30ee7e3e4e4c@lechnology.com>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
 <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
 <20160916055927.GC13205@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:34937 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752827AbcIPPcR (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Sep 2016 11:32:17 -0400
In-Reply-To: <20160916055927.GC13205@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On 09/16/2016 12:59 AM, Pavel Machek wrote:
> Hi!
>
> +The current brightness is found by reading a single byte from the
> character
> +device. Values are unsigned: 0 to 255. Reading does not block and
> always returns
> +the most recent brightness value. The device node can also be polled
> to notify
> +when the brightness value changes.
>
> What is going on there? We have O_NONBLOCK, user should be able to
> select if he wants blocking behaviour or not.

I will look into this.

>
> And yes, there's interface for creating a LED, but not one for
> deleting it?

uleds.txt says "The LED class device will be removed when the open file 
handle to /dev/uleds is closed."

Is this not clear?

>
> And... how is it going to work with multiple LEDs? Userspace gets
> single bytes with brightness. How does it know to which LED the
> brightness belongs?

It looks like this is missing from uleds.txt. By opening multiple file 
handles to /dev/uleds, you can create multiple devices. Each file handle 
will return a different value when read that corresponds to the LEDs 
class device that belongs to it.
