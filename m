From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 3/3] leds/powernv: Add driver for PowerNV platform
Date: Tue, 28 Jul 2015 19:40:56 +0200
Message-ID: <55B7BEA8.7080107@gmail.com>
References: <1437801670-23705-1-git-send-email-hegdevasant@linux.vnet.ibm.com> <1437801670-23705-4-git-send-email-hegdevasant@linux.vnet.ibm.com> <55B5540B.1000301@gmail.com> <55B5A853.3080909@linux.vnet.ibm.com> <55B5FEDD.2000506@gmail.com> <55B7865E.8000402@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:35022 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752465AbbG1Rmk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jul 2015 13:42:40 -0400
Received: by wibxm9 with SMTP id xm9so167707909wib.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Jul 2015 10:42:39 -0700 (PDT)
In-Reply-To: <55B7865E.8000402@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, j.anaszewski@samsung.com, mpe@ellerman.id.au
Cc: rpurdie@rpsys.net, cooloney@gmail.com, khandual@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, stewart@linux.vnet.ibm.com, benh@kernel.crashing.org

Vasant,

On 28.07.2015 15:40, Vasant Hegde wrote:
> On 07/27/2015 03:20 PM, Jacek Anaszewski wrote:
>> Hi Vasant,
>>
>> On 27.07.2015 05:41, Vasant Hegde wrote:
>>> On 07/27/2015 03:11 AM, Jacek Anaszewski wrote:
>>>> Hi Vasant,
>>>>
>>>
>>> Hi Jacek,
>>>
>>>> Two trivial details left. Please find them below.
>>>
>>> Thanks for the review/Ack. I'll fix below issues and resend patchset.
>>>
>>> I will ask Benh/Michael to take this patchset. But this patchset is depending
>>> on your core changes. Can you confirm that you are pushing that patchset in next
>>> merge window?
>
> Jacek,
>
>>
>> Without my core changes your driver won't work with led triggers, but
>> AFAIR this use case is not relevant for your LEDs? Eventually, we could
>> produce a patch set adding support for LED triggers if it will be clear
>> that LED core changes will not be merged in the upcoming merge window.
>
> IIUC current LED code doesn't allow me to sleep (without driver specific
> workqueue). And powernv_led_set() call will sleep. Hence I think it won't work.
>
> I did a quick test without your patch. It doesn't seems to be working.

Strange, it should work when led_set_brightness is called from non
atomic context, e.g. from sysfs interface. Could you share your test
scenario and describe the symptoms?

> Alternatively we can revert the changes (add driver specific workqueue now) and
> later when your changes goes to upstream, I can fix my code.

You can add this as an incremental patch which would be easy
to revert when LED core changes are merged.

-- 
Best Regards,
Jacek Anaszewski
