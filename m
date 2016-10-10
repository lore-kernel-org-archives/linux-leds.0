From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-mc13783: Fix MC13892 keypad led access
Date: Mon, 10 Oct 2016 15:12:10 +0200
Message-ID: <1d761a99-75d4-0092-3aa4-e878d5103908@samsung.com>
References: <CGME20161009134104eucas1p17d4028424741a2b6c758b268e50e6e12@eucas1p1.samsung.com>
 <1476020267-17178-1-git-send-email-akurz@blala.de>
 <fdbc8f96-3a9b-b87e-467d-5279353811d9@samsung.com>
 <alpine.DEB.2.00.1610101443040.24427@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56202 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752188AbcJJNNL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Oct 2016 09:13:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OEU00FM120D5E20@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 10 Oct 2016 14:12:13 +0100 (BST)
In-reply-to: <alpine.DEB.2.00.1610101443040.24427@blala.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Kurz <akurz@blala.de>
Cc: Richard Purdie <rpurdie@rpsys.net>, Alexander Shiyan <shc_work@mail.ru>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org

Hi Alexander,

On 10/10/2016 02:52 PM, Alexander Kurz wrote:
> Hi Jacek,
>
> On Mon, 10 Oct 2016, Jacek Anaszewski wrote:
>
>> Hi Alexander,
>>
>> Thanks for the patch.
>>
>> On 10/09/2016 03:37 PM, Alexander Kurz wrote:
>>> Fix the register access shift argument calculation introduced with
>>> commit a59ce6584d56 ("leds: leds-mc13783: Add MC34708 LED support")
>>> and re-enable access to the "keypad" led for MC13892 MFC devices.
>>>
>>> Signed-off-by: Alexander Kurz <akurz@blala.de>
>>> ---
>>>  drivers/leds/leds-mc13783.c | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
>>> index a2e4c17..2421cf10 100644
>>> --- a/drivers/leds/leds-mc13783.c
>>> +++ b/drivers/leds/leds-mc13783.c
>>> @@ -84,8 +84,9 @@ static int mc13xxx_led_set(struct led_classdev *led_cdev,
>>>  	case MC13892_LED_MD:
>>>  	case MC13892_LED_AD:
>>>  	case MC13892_LED_KP:
>>> -		reg = (led->id - MC13892_LED_MD) / 2;
>>> -		shift = 3 + (led->id - MC13892_LED_MD) * 12;
>>> +		off = led->id - MC13892_LED_MD;
>>> +		reg = off / 2;
>>> +		shift = 3 + (off - reg * 2) * 12;
>>>  		break;
>>>  	case MC13892_LED_R:
>>>  	case MC13892_LED_G:
>>>
>>
>> While trying to analyze these calculations I noticed a discrepancy
>> between DT documentation and the enum in the header file.
>>
>> Documentation/devicetree/bindings/mfd/mc13xxx.txt:
>>
>> MC13892 LED IDs:
>>     0  : Main display
>>     1  : AUX display
>>     2  : Keypad
>>     3  : Red
>>     4  : Green
>>     5  : Blue
>>
>> include/linux/mfd/mc13xxx.h:
>>
>> enum {
>>         /* MC13783 LED IDs */
>>         MC13783_LED_MD,
>>         MC13783_LED_AD,
>>         MC13783_LED_KP,
>>         MC13783_LED_R1,
>>         MC13783_LED_G1,
>>         MC13783_LED_B1,
>>         MC13783_LED_R2,
>>         MC13783_LED_G2,
>>         MC13783_LED_B2,
>>         MC13783_LED_R3,
>>         MC13783_LED_G3,
>>         MC13783_LED_B3,
>>         /* MC13892 LED IDs */
>>         MC13892_LED_MD,
>>         MC13892_LED_AD,
>>         MC13892_LED_KP,
>>         MC13892_LED_R,
>>         MC13892_LED_G,
>>         MC13892_LED_B,
>>         /* MC34708 LED IDs */
>>         MC34708_LED_R,
>>         MC34708_LED_G,
>> }
>>
>> Keypad LED enum identifier is 15, but documentation states
>> that it is 2. The code seems to expect the former:
>>
>> off = led->id - MC13892_LED_MD; //15 - 13 = 2
>> reg = off / 2; // 2 / 2 = 1
>> shift = 3 + (off - reg * 2) * 12; // 3 + (2 - 1*2) = 3
>>
>> It should write value << 3 to the register 52.
>>
>> According to the documentation [0] LEDKP0, LEDKP1 and LEDKP2
>> are driven by bits 9,10 and 11 respectively. The calculations
>> don't seem to be in line with that. Could you point what I
>> am missing?
>>
>> [0] http://www.nxp.com/files/analog/doc/data_sheet/MC13892.pdf
>
> The numbering mentioned in the DT documentation is used as offset
> for the device specific struct mc13xxx_led_devtype.led_min
>>                if (of_property_read_u32(child, "reg", &tmp))
>>                        continue;
>>                pdata->led[i].id = leds->devtype->led_min + tmp;
> e.g. MC13892_LED_KP = MC13892_LED_MD + 2
>
> Hope this clarifies your question,

Thanks but not entirely - what with the second part of question related
to the register layout?

-- 
Best regards,
Jacek Anaszewski
