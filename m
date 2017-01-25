From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 1/4] leds: class: Add new optional
 brightness_hw_changed attribute
Date: Wed, 25 Jan 2017 22:35:53 +0100
Message-ID: <b43ec266-d5ba-d974-b964-25fe82115db5@gmail.com>
References: <20170125161130.5424-1-hdegoede@redhat.com>
 <20170125161130.5424-2-hdegoede@redhat.com> <20170125164936.GE7936@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:36493 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752292AbdAYVgi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Jan 2017 16:36:38 -0500
In-Reply-To: <20170125164936.GE7936@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 01/25/2017 05:49 PM, Pali Rohár wrote:
> On Wednesday 25 January 2017 17:11:27 Hans de Goede wrote:
>> Some LEDs may have their brightness level changed autonomously
>> (outside of kernel control) by hardware / firmware. This commit
>> adds support for an optional brightness_hw_changed attribute to
>> signal such changes to userspace (if a driver can detect them):
>>
>> What:		/sys/class/leds/<led>/brightness_hw_changed
>> Date:		January 2017
>> KernelVersion:	4.11
>> Description:
>> 		Last hardware set brightness level for this LED. Some LEDs
>> 		may be changed autonomously by hardware/firmware. Only LEDs
>> 		where this happens and the driver can detect this, will
>> 		have this file.
>>
>> 		This file supports poll() to detect when the hardware
>> 		changes the brightness.
>>
>> 		Reading this file will return the last brightness level set
>> 		by the hardware, this may be different from the current
>> 		brightness.
>>
>> Drivers which want to support this, simply add LED_BRIGHT_HW_CHANGED to
>> their flags field and call led_classdev_notify_brightness_hw_changed()
>> with the hardware set brightness when they detect a hardware / firmware
>> triggered brightness change.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Just speculation: What about using name 'actual_brightness'? It provides
> same output on read as actual_brightness from /sys/class/backlight/.

This name is ambiguous. Propagating it to the LED subsystem only because
it exists in backlight is not sufficient argument IMHO.

-- 
Best regards,
Jacek Anaszewski
