From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v8 3/3] leds/powernv: Add driver for PowerNV platform
Date: Wed, 19 Aug 2015 13:54:03 +0200
Message-ID: <55D46E5B.20203@samsung.com>
References: <1437801670-23705-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
 <1437801670-23705-4-git-send-email-hegdevasant@linux.vnet.ibm.com>
 <55B5540B.1000301@gmail.com> <55B5A853.3080909@linux.vnet.ibm.com>
 <55B5FEDD.2000506@gmail.com> <55B7865E.8000402@linux.vnet.ibm.com>
 <55B7BEA8.7080107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38325 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751920AbbHSLyH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 07:54:07 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTB00510VQ4X980@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 19 Aug 2015 12:54:04 +0100 (BST)
In-reply-to: <55B7BEA8.7080107@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, rpurdie@rpsys.net, cooloney@gmail.com, khandual@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, stewart@linux.vnet.ibm.com, benh@kernel.crashing.org

Hi Vasant,

On 07/28/2015 07:40 PM, Jacek Anaszewski wrote:
> Vasant,
>
> On 28.07.2015 15:40, Vasant Hegde wrote:
>> On 07/27/2015 03:20 PM, Jacek Anaszewski wrote:
>>> Hi Vasant,
>>>
>>> On 27.07.2015 05:41, Vasant Hegde wrote:
>>>> On 07/27/2015 03:11 AM, Jacek Anaszewski wrote:
>>>>> Hi Vasant,
>>>>>
>>>>
>>>> Hi Jacek,
>>>>
>>>>> Two trivial details left. Please find them below.
>>>>
>>>> Thanks for the review/Ack. I'll fix below issues and resend patchset.
>>>>
>>>> I will ask Benh/Michael to take this patchset. But this patchset is
>>>> depending
>>>> on your core changes. Can you confirm that you are pushing that
>>>> patchset in next
>>>> merge window?
>>
>> Jacek,
>>
>>>
>>> Without my core changes your driver won't work with led triggers, but
>>> AFAIR this use case is not relevant for your LEDs? Eventually, we could
>>> produce a patch set adding support for LED triggers if it will be clear
>>> that LED core changes will not be merged in the upcoming merge window.
>>
>> IIUC current LED code doesn't allow me to sleep (without driver specific
>> workqueue). And powernv_led_set() call will sleep. Hence I think it
>> won't work.
>>
>> I did a quick test without your patch. It doesn't seems to be working.

Does brightness setting work properly without work queue?

-- 
Best Regards,
Jacek Anaszewski
