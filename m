From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: Add user LED driver for NIC78bx device
Date: Wed, 02 Nov 2016 09:22:44 +0100
Message-ID: <f0d7f5bf-c8c3-0946-1b37-228a7dd6deeb@samsung.com>
References: <CGME20161027110331epcas3p332bf735529a71e5c5efa66adf4312785@epcas3p3.samsung.com>
 <1477566173-124969-1-git-send-email-hui.chun.ong@ni.com>
 <d61aa980-9519-df29-6fef-cc6e4ac182d6@samsung.com>
 <20161031084704.GI23812@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24599 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753096AbcKBIWu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Nov 2016 04:22:50 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG000L979XYX400@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 02 Nov 2016 08:22:47 +0000 (GMT)
In-reply-to: <20161031084704.GI23812@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Hui Chun Ong <hui.chun.ong@ni.com>, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jonathan.hearn@ni.com, julia.cartwright@ni.com, Brad Mouring <brad.mouring@ni.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

Hi Mika,

On 10/31/2016 09:47 AM, Mika Westerberg wrote:
> On Fri, Oct 28, 2016 at 12:08:57PM +0200, Jacek Anaszewski wrote:
>>> +static struct platform_driver led_driver = {
>>> +	.probe = ni78bx_add,
>>> +	.remove = ni78bx_remove,
>>> +	.driver = {
>>> +		.name = KBUILD_MODNAME,
>>> +		.acpi_match_table = ACPI_PTR(led_device_ids),
>>
>> Please CC ACPI maintainers always if you include acpi.h
>> Cc Rafael and Mika.
>
>>From ACPI perspective this driver looks fine to me now.

Thanks for the review. Can I add your Acked-by then?

-- 
Best regards,
Jacek Anaszewski
