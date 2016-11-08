From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 1/4] leds: core: Add support for poll()ing the sysfs
 brightness attr for changes.
Date: Tue, 8 Nov 2016 14:16:27 +0100
Message-ID: <b703c452-4b9d-639d-24e7-490812a1e9f6@redhat.com>
References: <CGME20161101133800eucas1p19df1b7f85ad751fcf98e60277b207296@eucas1p1.samsung.com>
 <20161101133748.7168-1-hdegoede@redhat.com>
 <5021470c-705b-6920-708e-dd5fca13951f@samsung.com>
 <d6b88f5d-8458-9361-4800-d99c03bf72c0@redhat.com>
 <0c67637a-af0d-4974-eed6-efb186e91635@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57602 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750842AbcKHNQl (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 8 Nov 2016 08:16:41 -0500
In-Reply-To: <0c67637a-af0d-4974-eed6-efb186e91635@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 08-11-16 14:08, Jacek Anaszewski wrote:
> On 11/08/2016 01:31 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 08-11-16 12:52, Jacek Anaszewski wrote:
>>> Hi Hans,
>>>
>>> I've tested it with userspace test application and it seems to work
>>> well both with hardware leds-aat1290 driver and drivers/leds/uleds.c.
>>>
>>> Applied to the for-next branch of linux-leds.git.
>>
>> Great, thank you. Can you also add a stable branch / tag with this
>> commit which the platform/x86 maintainer can merge into his tree,
>> so that he can merge the platform/x86 driver changes which depend
>> up on the new led_notify_brightness_change() function ?
>
> Sure. I've created stable led_brightness_pollpri branch on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

Thank you.

Darren, can you merge this tag and patches 2-4 of this series please ?

Regards,

Hans
