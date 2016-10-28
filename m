From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4] leds: pca963x: enable low-power state
Date: Fri, 28 Oct 2016 09:28:22 +0200
Message-ID: <01b8c054-89f4-8c05-661e-80caf1b63f74@samsung.com>
References: <1477623195-32091-1-git-send-email-matt@ranostay.consulting>
 <CAPybu_1atgUh_Jovc_6x-L4eSHkT2LAnDT_sUnwchvpVzMxyfQ@mail.gmail.com>
 <CGME20161028072040epcas4p4d32c14b2bd88dbdb2f221138db74b2b7@epcas4p4.samsung.com>
 <CAJ_EiSRbMzbOty+vUnCf=trBwa0oxx74VC174Qd9DopnOtPEMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39721 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755215AbcJ1H23 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Oct 2016 03:28:29 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFQ00JCCY3DHS60@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 28 Oct 2016 08:28:25 +0100 (BST)
In-reply-to: <CAJ_EiSRbMzbOty+vUnCf=trBwa0oxx74VC174Qd9DopnOtPEMg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Matt Ranostay <matt@ranostay.consulting>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Matt Ranostay <mranostay@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <p.meerwald@bct-electronic.com>, Tony Lindgren <tony@atomide.com>

Hi Matt, Ricardo,

Matt - thanks for the update.
Ricardo - thanks for the review.

On 10/28/2016 09:20 AM, Matt Ranostay wrote:
> On Fri, Oct 28, 2016 at 12:04 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> Hi Matt
>>
>>
>> Have you verified that led_set cannot be called in "parallel" ? There
>> might be a race condition otherwise
>
> You are correct I should be using mutex_lock(&pca963x->chip->mutex);

Right, the locking has to be moved from the pca963x_brightness() to
the pca963x_led_set().

>
>>
>> On Fri, Oct 28, 2016 at 4:53 AM, Matt Ranostay <mranostay@gmail.com> wrote:
>>>
>>> +static int pca963x_power_state(struct pca963x_led *pca963x)
>>
>> What about:
>>
>> if (pca963x->led_cdev.brightness)
>>   set_bit(pca963x->led_num, leds_on);
>> else
>>   clear_bit(pca963x->led_num, leds_on);
>>
>> if (!(*leds_on) != !cached_leds)
>>   return i2c_smbus_write_byte_data(pca963x->chip->client,
>>                                    PCA963X_MODE1, *leds_on ? 0: BIT(4));
>>
>> return 0
>>
>>
>> I believe it is simpler, but it is just a matter of taste.
>
> Don't really matter to which way we do it, but will wait for everyone's
> input before spamming with v5 (with mutex fixes above)

Solution proposed by Ricardo looks indeed simpler.

-- 
Best regards,
Jacek Anaszewski
