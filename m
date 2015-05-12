From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: lp5523: add master_fader support
Date: Tue, 12 May 2015 10:59:28 -0700
Message-ID: <CAK5ve-KkLmJMLs0Q3KskUodEJrjcWRx_tobVUm5+G=Q+_sFxmg@mail.gmail.com>
References: <1431371454-2035-1-git-send-email-toshik@chromium.org>
 <5551AAFA.5080807@samsung.com> <5551B8F9.6040808@ti.com> <5551BF04.5010503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:33968 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932711AbbELR7t (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 13:59:49 -0400
In-Reply-To: <5551BF04.5010503@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "Kim, Milo" <milo.kim@ti.com>, Toshi Kikuchi <toshik@chromium.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Tue, May 12, 2015 at 1:51 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 05/12/2015 10:25 AM, Kim, Milo wrote:
>>
>> Hi Jacek and Toshi,
>>
>> On 5/12/2015 4:25 PM, Jacek Anaszewski wrote:
>>>
>>> Hi Toshi,
>>>
>>> On 05/11/2015 09:10 PM, Toshi Kikuchi wrote:
>>>>
>>>> This patch introduces 4 new attributes:
>>>>     master_fader_leds
>>>>     master_fader1
>>>>     master_fader2
>>>>     master_fader3
>>>>
>>>> Fo example, to map channel 0,6 to master_fader1,
>>>> map channel 1,7 to master_fader2,
>>>> map channel 2,8 to master_fader3, and
>>>> map channel 3,4,5 to none
>>>
>>>   >
>>>>
>>>>     echo "123000123" > master_fader_leds
>>>
>>>
>>> I propose to add ABI documentation for this driver. It already exposes
>>> many custom attributes but I can't find documentation for them.
>>
>>
>> I agree with Jacek's comment but it would be better if we could see the
>> description in lp5523 driver
>> documentation(Documentation/leds/leds-lp5523.txt).
>
>
> Right, I missed that file.
>
>

Toshi,

I merged this patch into my tree with Milo and Jacek Acks. But please
follow their advice and provide a patch to update those document
files.

Thanks,
-Bryan
