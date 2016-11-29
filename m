From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: netxbig: fix module autoload for OF registration
Date: Tue, 29 Nov 2016 16:34:43 +0100
Message-ID: <b4bf0179-0dde-0500-b07f-96bb95c78a99@samsung.com>
References: <1477065125-20877-1-git-send-email-javier@osg.samsung.com>
 <CGME20161129150039epcas3p34ee8ce41975cd81f0c8332f3d6898a11@epcas3p3.samsung.com>
 <9f84c025-7835-1664-60df-092b80a4ade7@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38901 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933392AbcK2Pet (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Nov 2016 10:34:49 -0500
In-reply-to: <9f84c025-7835-1664-60df-092b80a4ade7@osg.samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Javier,

On 11/29/2016 04:00 PM, Javier Martinez Canillas wrote:
> Hello Jacek,
>
> On 10/21/2016 12:52 PM, Javier Martinez Canillas wrote:
>> If the driver is built as a module, autoload won't work because the module
>> alias information is not filled. So user-space can't match the registered
>> device with the corresponding module.
>>
>> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
>>
>> Before this patch:
>>
>> $ modinfo drivers/leds//leds-netxbig.ko | grep alias
>> alias:          platform:leds-netxbig
>>
>> After this patch:
>>
>> $ modinfo drivers/leds//leds-netxbig.ko | grep alias
>> alias:          platform:leds-netxbig
>> alias:          of:N*T*Clacie,netxbig-ledsC*
>> alias:          of:N*T*Clacie,netxbig-leds
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> ---
>>
>
> Any comments about this patch?

I mistakenly marked it as merged. Sorry about that.
Applied to the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
