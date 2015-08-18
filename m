From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-fsg: Use devm_led_classdev_register
Date: Tue, 18 Aug 2015 14:36:55 +0200
Message-ID: <55D326E7.9010006@samsung.com>
References: <20150815102101.GA8323@localhost> <55D19AD6.8030506@samsung.com>
 <CAK-LDbKBwtq9i3Xozew-axZfPOrgTBKrVHEft4ucLEoohnG_xw@mail.gmail.com>
 <CAK-LDbJ+6VnKcsuhRUP13gweetP2p-ioY+ittxDcLqZ5ECxctA@mail.gmail.com>
 <55D2DE48.1090508@samsung.com>
 <CAK-LDbJ+6u1cPV7EytypNCAj-MMU5aTaQTySAG=iVma94A-LMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48310 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727AbbHRMg7 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 18 Aug 2015 08:36:59 -0400
In-reply-to: <CAK-LDbJ+6u1cPV7EytypNCAj-MMU5aTaQTySAG=iVma94A-LMQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 08/18/2015 02:14 PM, Vaishali Thakkar wrote:
> On Tue, Aug 18, 2015 at 12:57 PM, Jacek Anaszewski
> <j.anaszewski@samsung.com> wrote:
>> Hi Vaishali,
>>
>> On 08/18/2015 07:46 AM, Vaishali Thakkar wrote:
>>>
>>> On Mon, Aug 17, 2015 at 2:02 PM, Vaishali Thakkar
>>> <vthakkar1994@gmail.com> wrote:
>>>>
>>>>
>>>> On 17 Aug 2015 13:57, "Jacek Anaszewski" <j.anaszewski@samsung.com>
>>>> wrote:
>>>>>
>>>>>
>>>>> Hi Vaishali,
>>>>>
>>>>> Thanks for the patch. Unfortunately it causes build break.
>>>>> Please fix the issues and resubmit.
>>>>
>>>>
>>>> Oops! I am really very sorry. By mistake I sent a basic version of patch
>>>> instead of final one. Thanks for the review.
>>>>
>>>> I'll send v2 with the fix of that build error.
>>>
>>>
>>> Hi Jacek,
>>>
>>> Can you please tell me what are those build errors?
>>> After looking at my patch, I can expect that as I forgot to
>>> remove '.remove         = fsg_led_remove' from structure,
>>> it can cause an error. Also, there is one typing mistake in
>>> function name. So, both of these can be a reason for
>>> breaking a build.
>>
>>
>> Those was the errors I experienced too.
>>
>>> Also to be on safe side, I tried to cross compile it for arm
>>> architecture. But to my surprise, it is not compiling properly.
>>> So, it would be good if you can point me to the script you
>>> used for compilation so that I can check it before sending a new
>>> version.
>>
>>
>> I am using arm-linux-gnueabi cross toolchain.
>>
>> config: arch/arm/configs/ixp4xx_defconfig
>>
>> Build command:
>>
>> make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- all
>
> Ok. Thanks for the information. I was using
> https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross.
>
>> After fixing the errors compilation succeeded.
>> Do you have a hardware to test the modifications against?
>
> Ok. I checked with arm-linux-gnueabi cross toolchain
> and fixing these 2 errors allow us to compile the file
> successfully.
>
> No, I don't have a hardware to test these modifications.
> I think this change should not lead to any breakage. But
> yes it is good to test such changes. Can you please test
> it for me (if you have a hardware), so that I can send v2
> with fixing those errors?

I don't have the hardware either. I assumed that you had a personal
interest in modifying this driver, and that you might have had the
hardware. The modifications are pretty straightforward, compile-testing
should suffice. Please submit v2.

-- 
Best Regards,
Jacek Anaszewski
