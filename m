From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [RFC] User-defined leds
Date: Tue, 26 Jul 2016 09:38:45 +0200
Message-ID: <57971385.8040408@samsung.com>
References: <57965C15.1070705@lechnology.com>
 <DB74DD94-7737-4F06-BD35-D698A65E30AD@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48304 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753667AbcGZHiu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 26 Jul 2016 03:38:50 -0400
In-reply-to: <DB74DD94-7737-4F06-BD35-D698A65E30AD@holtmann.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: David Lechner <david@lechnology.com>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joel Becker <jlbec@evilplan.org>

Hi Marcel,

On 07/25/2016 08:45 PM, Marcel Holtmann wrote:
> Hi David,
>
>> short version: I have a use case for leds where I want to be able to use the triggers in the leds subsystem without having a physical hardware led.
>>
>> long version: I am working on a program to make one embedded system (http://fatcatlab.com/product/evb/) compatible with another (http://mindstorms.lego.com). One has physical red/green LEDs, that use the gpio leds driver to control them. The other system does not have physical leds. However, it does have a color screen. So, my idea is
>> to create virtual LEDs on the screen that emulate the physical LEDs on the other device.
>>
>> I would like to make a userspace program that works the same on both devices. If the leds were simple on-off, then it would of course be simpler to make the virtual leds completely in userspace. However, we are currently using other triggers (disk activity/heatbeat/etc.) with the leds. I would like for the virtual LEDs to be able to use these triggers as well.
>
> this is funny since I have just written a ledsim.c using debugfs to emulate a LED and read out its state via a simple cat command. I found that useful for testing triggers in the Bluetooth subsystem and see if they behave correctly without bothering to run this on real hardware.
>
>> Proposed implementation:
>>
>> My thought is to create a new module that can be used to create user-defined leds using configfs. Below is some sample code that I have been experimenting with. Be aware, it does not quite match the description I am about to give.
>>
>> In configfs you simply create a new node for each leds and assign the name. We could have separate attributes for devicename, color and function to enforce the naming convention or we could just allow arbitrary names.
>>
>> Once the leds class devices are configured in configfs and exported, it will create the usual leds class device in sysfs as well as a character device that can be polled by the userspace program. The character device would work a bit like evdev where any time the brightness is changed, it spits out an event on the character device.
>>
>> It would probably be simplest to have a single character device for all virtual leds. In this case the leds device name or some other id would need to be part of the event structure.
>>
>> Any thoughts? Does this seem like a sane thing to do? Or maybe there is a different way to accomplish the same thing using existing drivers?
>
> So I used debugfs since I was lazy and only needed it for testing. However doing something similar to what /dev/uinput, /dev/uhid, /dev/rfkill, /dev/vhci etc. are doing seems to be reasonable here. What I like with these userspace driven interfaces is that the process has to keep the character device open. Once it closes it, then the kernel removes the data structures. So I would vote for creating a /dev/uled.
>
> However creating /dev/uled would lead to using a dedicated tool to drive it. Which might be useful anyway since it could be easily extended with some easy to use functionality for testing purposes. It would also be simple to create unit test integration.
>
> For my test of ledsim.c I opted for debugfs and cat just so that I can do it really easily. I can share my code if that is interesting to people.

Yes, it would be nice to see your code, it is always beneficial
to compare other approaches.

-- 
Best regards,
Jacek Anaszewski
