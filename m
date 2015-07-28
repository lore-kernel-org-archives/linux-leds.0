From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v8 3/3] leds/powernv: Add driver for PowerNV platform
Date: Tue, 28 Jul 2015 13:23:32 +0200
Message-ID: <55B76634.6050505@gmail.com>
References: <1437801670-23705-1-git-send-email-hegdevasant@linux.vnet.ibm.com>	 <1437801670-23705-4-git-send-email-hegdevasant@linux.vnet.ibm.com>	 <55B5540B.1000301@gmail.com> <55B5A853.3080909@linux.vnet.ibm.com>	 <55B72369.5040102@gmail.com> <1438078495.7562.135.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:35497 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752373AbbG1LZP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jul 2015 07:25:15 -0400
Received: by wibxm9 with SMTP id xm9so152450780wib.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Jul 2015 04:25:14 -0700 (PDT)
In-Reply-To: <1438078495.7562.135.camel@kernel.crashing.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, j.anaszewski@samsung.com, mpe@ellerman.id.au, rpurdie@rpsys.net, cooloney@gmail.com, khandual@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, stewart@linux.vnet.ibm.com



On 28.07.2015 12:14, Benjamin Herrenschmidt wrote:
> On Tue, 2015-07-28 at 08:38 +0200, Jacek Anaszewski wrote:
>>>>> +    /* Register the classdev */
>>>>> +    rc = devm_led_classdev_register(dev, &powernv_led->cdev);
>>>>> +    if (rc) {
>>>>> +        dev_err(dev, "%s: Classdev registration failed for %s\n",
>>>>> +            __func__, powernv_led->cdev.name);
>>>>> +    }
>>
>> Braces are not needed here,
>
> Putting my old maintainer hat on for a minute ... this is serious nit
> picking :-)
>
> Arguably, the function being multi-line, the braces do make the code
> more readable. This is a matter of taste which in such as case
> which isn't a blatant violation of an important rule should be left to
> the choice of the code implementor/maintainer.

I will not insist as checkpatch.pl also doesn't complain
about that.

Vasant, please ignore my remark then.

-- 
Best Regards,
Jacek Anaszewski
