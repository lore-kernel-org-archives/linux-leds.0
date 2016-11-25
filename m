From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 09:33:30 +0100
Message-ID: <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <201611241751.27696@pali> <5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
 <CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
 <201611242245.00217@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60535 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753832AbcKYIoo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2016 03:44:44 -0500
In-reply-to: <201611242245.00217@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On 11/24/2016 10:45 PM, Pali Rohár wrote:
> On Thursday 24 November 2016 22:35:52 Jacek Anaszewski wrote:
>>> I understood that we cannot notify about changes done by CPU
>>> trigger due to high power usage... Or not?
>>
>> Exactly.
>
> So in this case exporting any new sysfs file (or using existing) which
> report POLLPRI events for LED devices with active trigger is not
> accepted.

Why so? The new feature would be made optional so existing users
wouldn't be affected, unless they enabled it in the kernel
config.

> This means that trigger itself is problematic and trigger code should
> tell to led subsystem if it should send POLLPRI events to userspace or
> not. E.g. cpu trigger should tell led subsystem that events must not be
> sent and e.g. rfkill trigger could tell that events can be sent...

It would entail changes in all triggers, I'd like to avoid for the
reasons I provided in one of the previous messages.

I've just looked one more time at POLLPRI description in poll(2)
documentation:

"There is urgent data to read (e.g., out-of-band data on TCP socket;
pseudoterminal master in packet mode has seen state change in slave)."

I don't think that brightness changes originating from triggers fall
into this category, whereas the ones originating from hardware do.

In view of the above we could report hw brightness changes with POLLPRI
on brightness file, but unfortunately we can't because it is impossible
to guarantee that readout of brightness file will return the brightness
the POLLPRI was meant to notify about.

That's why a separate read only file seems to be the only proper
solution. Moreover, the file should return the brightness from the time
of last POLLPRI.

-- 
Best regards,
Jacek Anaszewski
