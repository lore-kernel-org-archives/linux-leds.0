From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-mc13783: Fix MC13892 keypad led access
Date: Tue, 11 Oct 2016 10:18:45 +0200
Message-ID: <6bb14032-d175-eb75-7ba2-456478056e64@samsung.com>
References: <CGME20161009134104eucas1p17d4028424741a2b6c758b268e50e6e12@eucas1p1.samsung.com>
 <1476020267-17178-1-git-send-email-akurz@blala.de>
 <fdbc8f96-3a9b-b87e-467d-5279353811d9@samsung.com>
 <alpine.DEB.2.00.1610101443040.24427@blala.de>
 <1d761a99-75d4-0092-3aa4-e878d5103908@samsung.com>
 <alpine.DEB.2.00.1610101516430.24427@blala.de>
 <d1a74341-b74c-758f-1360-aa80d55812ae@samsung.com>
 <alpine.DEB.2.00.1610101641170.24427@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30148 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752007AbcJKISw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Oct 2016 04:18:52 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OEV00BMHJ3CR840@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 11 Oct 2016 09:18:48 +0100 (BST)
In-reply-to: <alpine.DEB.2.00.1610101641170.24427@blala.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Kurz <akurz@blala.de>
Cc: Richard Purdie <rpurdie@rpsys.net>, Alexander Shiyan <shc_work@mail.ru>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org

On 10/10/2016 04:52 PM, Alexander Kurz wrote:
>
>
> On Mon, 10 Oct 2016, Jacek Anaszewski wrote:
>
>> On 10/10/2016 03:24 PM, Alexander Kurz wrote:
>>>
>>>
>>> On Mon, 10 Oct 2016, Jacek Anaszewski wrote:
>>>
>>>> Hi Alexander,
>>>>>> It should write value << 3 to the register 52.
>>>>>>
>>>>>> According to the documentation [0] LEDKP0, LEDKP1 and LEDKP2
>>>>>> are driven by bits 9,10 and 11 respectively. The calculations
>>>>>> don't seem to be in line with that. Could you point what I
>>>>>> am missing?
>>> LEDKP0, LEDKP1 and LEDKP2 controlles the led current setting, but ...
>>>
>>>>>>
>>>>>> [0] http://www.nxp.com/files/analog/doc/data_sheet/MC13892.pdf
>>>>>
>>>>> The numbering mentioned in the DT documentation is used as offset
>>>>> for the device specific struct mc13xxx_led_devtype.led_min
>>>>>>                if (of_property_read_u32(child, "reg", &tmp))
>>>>>>                        continue;
>>>>>>                pdata->led[i].id = leds->devtype->led_min + tmp;
>>>>> e.g. MC13892_LED_KP = MC13892_LED_MD + 2
>>>>>
>>>>> Hope this clarifies your question,
>>>>
>>>> Thanks but not entirely - what with the second part of question related
>>>> to the register layout?
>>> The LED brightness is controlled via the duty cycle bits allowing
>>> 64 brightness values, setting bits/registers like
>>> LED  | reg | bits
>>> -----+-----+------
>>> main | 0   | 3..8
>>> aux  | 0   | 15..20
>>> kp   | 1   | 3..8
>>> red  | 2   | 3..8
>>> green| 2   | 15..20
>>> blue | 3   | 3..8
>
> So, I have probably introduced some confusion by
> using "LED Control #reg" as "reg" from Table 163-166.
>
>> So it doesn't seem to reflect what is shown in the Table 164.
>> on the site 148 of the document I mentioned in the previous
>> message. Could you please give a reference to the documentation
>> you're using?
>
> Exactly the same datasheet.
> Again, brightness controlling bits with verbatim Register numbering
>
> LED  | Register | LED Control | bits
> -----+----------+-------------+-----
> main | 51       | 0           | 3..8
> aux  | 51       | 0           | 15..20
> kp   | 52       | 1           | 3..8
> red  | 53       | 2           | 3..8
> green| 53       | 2           | 15..20
> blue | 54       | 3           | 3..8

OK, now everything is clear, thanks.
I've applied the patch to the for-4.10 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
