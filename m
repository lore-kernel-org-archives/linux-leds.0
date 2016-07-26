From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [RFC] User-defined leds
Date: Tue, 26 Jul 2016 09:38:36 +0200
Message-ID: <5797137C.9090304@samsung.com>
References: <57965C15.1070705@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:65210 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333AbcGZHil (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jul 2016 03:38:41 -0400
In-reply-to: <57965C15.1070705@lechnology.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joel Becker <jlbec@evilplan.org>

Hi David,

On 07/25/2016 08:36 PM, David Lechner wrote:
> short version: I have a use case for leds where I want to be able to use
> the triggers in the leds subsystem without having a physical hardware led.
>
> long version: I am working on a program to make one embedded system
> (http://fatcatlab.com/product/evb/) compatible with another
> (http://mindstorms.lego.com). One has physical red/green LEDs, that use
> the gpio leds driver to control them. The other system does not have
> physical leds. However, it does have a color screen. So, my idea is
> to create virtual LEDs on the screen that emulate the physical LEDs on
> the other device.
>
> I would like to make a userspace program that works the same on both
> devices. If the leds were simple on-off, then it would of course be
> simpler to make the virtual leds completely in userspace. However, we
> are currently using other triggers (disk activity/heatbeat/etc.) with
> the leds. I would like for the virtual LEDs to be able to use these
> triggers as well.
>
>
> Proposed implementation:
>
> My thought is to create a new module that can be used to create
> user-defined leds using configfs. Below is some sample code that I have
> been experimenting with. Be aware, it does not quite match the
> description I am about to give.
>
> In configfs you simply create a new node for each leds and assign the
> name. We could have separate attributes for devicename, color and
> function to enforce the naming convention or we could just allow
> arbitrary names.
>
> Once the leds class devices are configured in configfs and exported, it
> will create the usual leds class device in sysfs as well as a character
> device that can be polled by the userspace program. The character device
> would work a bit like evdev where any time the brightness is changed, it
> spits out an event on the character device.
>
> It would probably be simplest to have a single character device for all
> virtual leds. In this case the leds device name or some other id would
> need to be part of the event structure.
>
> Any thoughts? Does this seem like a sane thing to do? Or maybe there is
> a different way to accomplish the same thing using existing drivers?

The idea sounds reasonable. Please also compare the solutions spotted
by Marcel. After that please submit the patch officially, along with
the sample user space application.

-- 
Best regards,
Jacek Anaszewski
