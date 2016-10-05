From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-pca963x: add nxp,leds-suspend property
Date: Wed, 05 Oct 2016 15:11:32 +0200
Message-ID: <65b2fdc5-549d-555c-fefe-70d856ea4ca5@samsung.com>
References: <CGME20161005022942eucas1p2b092723a0c38c116cc971971e43b169e@eucas1p2.samsung.com>
 <1475634572-18274-1-git-send-email-matt@ranostay.consulting>
 <0ba8033f-d0b3-8b2f-8ff4-fa47dcf50ba1@samsung.com>
 <CAL_JsqKVR9nHoAXcFVPBXp1io7_WCL6Jsrv=oJKGBopatL27sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13682 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752164AbcJENLj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Oct 2016 09:11:39 -0400
In-reply-to: <CAL_JsqKVR9nHoAXcFVPBXp1io7_WCL6Jsrv=oJKGBopatL27sQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Matt Ranostay <matt@ranostay.consulting>, Richard Purdie <rpurdie@rpsys.net>

On 10/05/2016 02:22 PM, Rob Herring wrote:
> On Wed, Oct 5, 2016 at 3:09 AM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Hi Matt,
>>
>> On 10/05/2016 04:29 AM, Matt Ranostay wrote:
>>>
>>> Allow the LED subsystem to blank the LEDS on suspend.
>>>
>>> Cc: Richard Purdie <rpurdie@rpsys.net>
>>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>>> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
>>> ---
>>>  Documentation/devicetree/bindings/leds/pca963x.txt | 1 +
>>>  drivers/leds/leds-pca963x.c                        | 9 +++++++++
>>>  include/linux/platform_data/leds-pca963x.h         | 6 ++++++
>>>  3 files changed, 16 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt
>>> b/Documentation/devicetree/bindings/leds/pca963x.txt
>>> index dafbe9931c2b..61b1f037ebd0 100644
>>> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
>>> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
>>> @@ -7,6 +7,7 @@ Optional properties:
>>>  - nxp,totem-pole : use totem pole (push-pull) instead of open-drain
>>> (pca9632 defaults
>>>    to open-drain, newer chips to totem pole)
>>>  - nxp,hw-blink : use hardware blinking instead of software blinking
>>> +- nxp,leds-suspend : turn off LEDS on system suspend
>>
>>
>> How about making this property generic and adding it to the common LED
>> bindings?
>>
>> Cc Rob.
>
> Fine with me though seems like keeping on would be less common. Maybe
> "keep-in-suspend". Also, if this is a user decision, then it should be
> a sysfs attr and shouldn't be in DT.

Matt, did you have any specific reason for making it configurable?
I like the idea of adding generic sysfs attribute for that, which
would allow for customizing behaviour for a LED used as torch.
I believe that in most use cases the user doesn't want that the LED
used as torch went off on suspend.

-- 
Best regards,
Jacek Anaszewski
