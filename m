From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/4] leds: core: Add support for poll()ing the sysfs
 brightness attr for changes.
Date: Thu, 27 Oct 2016 09:33:15 +0200
Message-ID: <5e452f77-730f-69e5-58cc-7c217dee0082@redhat.com>
References: <20161023194652.24335-1-hdegoede@redhat.com>
 <c103b787-bd78-3a16-0d20-a2c14a91ad02@gmail.com>
 <CGME20161026151915eucas1p27f8f1ba12e843b8d10f3b20966066565@eucas1p2.samsung.com>
 <596538b5-32d7-4a5e-d561-62b6321dea56@redhat.com>
 <e4f7b016-1ad4-09bc-0e0f-2737e3e20edc@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <e4f7b016-1ad4-09bc-0e0f-2737e3e20edc@samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 27-10-16 08:58, Jacek Anaszewski wrote:
> Hi,
>
> On 10/26/2016 05:18 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 24-10-16 22:43, Jacek Anaszewski wrote:
>>> Hi Hans,
>>>
>>> Thanks for the update.
>>> Could you please rebase your patches onto recent linux-leds.git,
>>> for-next branch?
>>
>> Done, I will send a v3 soon (today or tomorrow).
>>
>>> Also it would be convenient to have sample application for polling
>>> brightness changes in tools/leds.
>>
>> I'm sorry but I do not have time to create such a sample application.
>
> You must have tested your solution somehow.

Yes, as is made clear by the other patches in this set, I'm using
it with keyboard backlight control led interfaces. Which in userspace
are handled by upower which provides a dbus interface which is used
by gnome-settings-daemon.

> Just polish the code a bit,
> add a Makefile and that's it. Compare tools/leds/uledmon.c - it doesn't
> need to be anything big.

upower uses gio which is really not suitable for this, so I would need
to create something from scratch.

Regards,

Hans


>
> If you're adding a feature that interacts with userspace, then I'd like
> to have a sample code that shows how to use it. Just for a reference.
>
