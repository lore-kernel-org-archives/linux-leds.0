From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Fri, 25 Nov 2016 11:25:14 +0100
Message-ID: <e32e3d6c-5d6d-c882-21d9-8028c8311b0b@samsung.com>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <201611241751.27696@pali> <5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
 <CGME20161124214512epcas4p493721bb45b10e1f41a8ea38e01d6e471@epcas4p4.samsung.com>
 <201611242245.00217@pali> <afdfe71f-6f39-6f4b-4c92-47142d6267d3@samsung.com>
 <20161125100140.GC4062@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:62983 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbcKYKZU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Nov 2016 05:25:20 -0500
In-reply-to: <20161125100140.GC4062@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On 11/25/2016 11:01 AM, Pavel Machek wrote:
> Hi!
>
>> In view of the above we could report hw brightness changes with POLLPRI
>> on brightness file, but unfortunately we can't because it is impossible
>> to guarantee that readout of brightness file will return the brightness
>> the POLLPRI was meant to notify about.
>
> Agreed here.
>
>> That's why a separate read only file seems to be the only proper
>> solution.
>
> Yes please. And lets make self-changing leds into a trigger, as
> proposed, and as Hans' patch should be already doing.

We can set one trigger at a time. In this case it will be impossible
to have hw brightness change notifications while other trigger is
active.

>> Moreover, the file should return the brightness from the time
>> of last POLLPRI.
>
> Not sure I agree here. Normally, kernel returns current state for
> variables, does not track "old" state.

It would report current state. The file called hw_brightness_change
should report last brightness change originating from hardware.
The most recent hw brightness change is still current state from
this perspective. It will be valid until next hw brightness change
occurs.

Current state does not mean current brightness in this case.

-- 
Best regards,
Jacek Anaszewski
