From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-fsg: Use devm_led_classdev_register
Date: Tue, 18 Aug 2015 09:27:04 +0200
Message-ID: <55D2DE48.1090508@samsung.com>
References: <20150815102101.GA8323@localhost> <55D19AD6.8030506@samsung.com>
 <CAK-LDbKBwtq9i3Xozew-axZfPOrgTBKrVHEft4ucLEoohnG_xw@mail.gmail.com>
 <CAK-LDbJ+6VnKcsuhRUP13gweetP2p-ioY+ittxDcLqZ5ECxctA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23882 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750855AbbHRH1I (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 03:27:08 -0400
In-reply-to: <CAK-LDbJ+6VnKcsuhRUP13gweetP2p-ioY+ittxDcLqZ5ECxctA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Vaishali,

On 08/18/2015 07:46 AM, Vaishali Thakkar wrote:
> On Mon, Aug 17, 2015 at 2:02 PM, Vaishali Thakkar
> <vthakkar1994@gmail.com> wrote:
>>
>> On 17 Aug 2015 13:57, "Jacek Anaszewski" <j.anaszewski@samsung.com> wrote:
>>>
>>> Hi Vaishali,
>>>
>>> Thanks for the patch. Unfortunately it causes build break.
>>> Please fix the issues and resubmit.
>>
>> Oops! I am really very sorry. By mistake I sent a basic version of patch
>> instead of final one. Thanks for the review.
>>
>> I'll send v2 with the fix of that build error.
>
> Hi Jacek,
>
> Can you please tell me what are those build errors?
> After looking at my patch, I can expect that as I forgot to
> remove '.remove         = fsg_led_remove' from structure,
> it can cause an error. Also, there is one typing mistake in
> function name. So, both of these can be a reason for
> breaking a build.

Those was the errors I experienced too.

> Also to be on safe side, I tried to cross compile it for arm
> architecture. But to my surprise, it is not compiling properly.
> So, it would be good if you can point me to the script you
> used for compilation so that I can check it before sending a new
> version.

I am using arm-linux-gnueabi cross toolchain.

config: arch/arm/configs/ixp4xx_defconfig

Build command:

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- all

After fixing the errors compilation succeeded.

Do you have a hardware to test the modifications against?

-- 
Best Regards,
Jacek Anaszewski
