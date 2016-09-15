From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 16:53:39 +0200
Message-ID: <a371a9fc-5dfc-96ad-f4ff-766e27776d7b@samsung.com>
References: <1473128158-26915-1-git-send-email-david@lechnology.com>
 <04c5ee0d-9bfb-6e0a-2616-6cf720fc8763@samsung.com>
 <CGME20160915124112eucas1p1fe56716646346b23dc9ab06d92d7b5e0@eucas1p1.samsung.com>
 <20160915124103.GF13132@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19436 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbcIOOxr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2016 10:53:47 -0400
In-reply-to: <20160915124103.GF13132@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

Hi Pavel,

On 09/15/2016 02:41 PM, Pavel Machek wrote:
> Hi!
>
>> Thanks for the patch. It is very nice. I have only one minor remark
>> in the code.
>>
>> I think that it would be good to add a documentation for this
>> driver to Documentation/leds, with exemplary C program instead
>> of python one. The program could poll the dev node in a loop,
>> which allows to conveniently check the impact of setting particular
>> triggers and all other brightness change events.
>
> Actually, I'd say that python is fine -- it is used heavily in tools/.
>
> But perhaps the example program should go to tools/?

I see python scripts only in perf tools. Let's stay by C application.

David, could you please prepare another version of the patch, that
splits test app code to the separate file in tools/leds (the directory
doesn't exist so far), also providing suitable Makefile?

>>> def change_brightness(b):
>>>    with open('/sys/class/leds/{}/brightness'.format(name) , 'w') as f:
>>>       f.write(str(b))
>>>
>>>
>>> with open('/dev/uleds', 'rb+', 0) as uleds:
>>>    bname = name.encode("ascii")
>>>    # create the leds class device
>>>    uleds.write(bname + b'\0' * (ULEDS_MAX_NAME_SIZE - len(bname)))
>
> Umm. I don't see it in the kernel code. You let userspace provide a
> LED name?
>
> Where is the LED name tested for sanity? I guess there could be a lot
> of fun naming a led ".." for example...

Good point.

-- 
Best regards,
Jacek Anaszewski
