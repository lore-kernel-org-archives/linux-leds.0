From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Thu, 24 Nov 2016 17:21:19 +0100
Message-ID: <dce7fff1-59cf-c155-2154-e6ea6bd7ee03@samsung.com>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <4fcc36c6-498b-0ce7-a7c8-28c214ccef88@redhat.com>
 <ff098b73-202a-200b-5c84-e96d33199d54@samsung.com>
 <20161122145825.GS13735@pali>
 <6e8c3884-fec1-461a-e9b8-2020176ada93@samsung.com>
 <20161124091525.GG13735@pali>
 <ba7108be-82c7-2d87-c884-7284aaee80a3@samsung.com>
 <CGME20161124142652epcas3p4b06f36d2295b8857830faf66395887b3@epcas3p4.samsung.com>
 <20161124142647.GJ13735@pali>
 <50225a88-b928-c61b-bf6f-6c85fb6a9082@samsung.com>
 <20161124153651.GL13735@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:54079 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752475AbcKXQWD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Nov 2016 11:22:03 -0500
In-reply-to: <20161124153651.GL13735@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On 11/24/2016 04:36 PM, Pali Rohár wrote:
> On Thursday 24 November 2016 16:32:06 Jacek Anaszewski wrote:
>> Since it has been reported that POLLPRI notifications on brightness
>> file can lead to increased power consumption, and having my above
>> statement I don't think that it is a good idea to use brightness
>> file for this.
>
> How is brightness file different from others that it cannot issue
> POLLPRI notification?
>
> I understood that problem is there in case that LED level is changed too
> many times per second (like by CPU trigger).
>
> If this is not that problem can you describe real issue, why we cannot
> use POLLPRI for brightness file?

It would be inconsistent not to notify all brightness changes on
brightness file. We should notify all of them or none.

>>> Yes, how triggers interact with brightness file, what happen when you
>>> write 0 on active trigger,
>>
>> There is already a patch in linux-next adding the following:
>>
>>
>> +		Writing 0 to this file clears active trigger.
>> +
>> +		Writing non-zero to this file while trigger is active changes the
>> +		top brightness trigger is going to use.
>> +
>
> Great!
>
>>> what happen when you read brightness file
>>> with active trigger / without trigger.
>>>
>>
>> Yes, this needs to be covered too.
>


-- 
Best regards,
Jacek Anaszewski
