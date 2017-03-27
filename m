From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCHv3 1/2] mfd: cpcap: Add missing include dependencies
Date: Mon, 27 Mar 2017 20:38:24 +0200
Message-ID: <e4f0fb62-8fe1-bf32-6aee-b87c04bbd942@gmail.com>
References: <20170324084732.31255-1-sre@kernel.org>
 <d1a18390-fb5f-e192-a54c-1c2574238225@gmail.com>
 <20170327142608.qcobnqrvyu7u4ybz@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35757 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751522AbdC0Sjw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Mar 2017 14:39:52 -0400
In-Reply-To: <20170327142608.qcobnqrvyu7u4ybz@dell>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/27/2017 04:26 PM, Lee Jones wrote:
> On Fri, 24 Mar 2017, Jacek Anaszewski wrote:
>> On 03/24/2017 09:47 AM, Sebastian Reichel wrote:
>>> This fixes compilation for files, that try to include the
>>> cpcap header in alphabetically sorted #include lists.
>>>
>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>> Acked-by: Tony Lindgren <tony@atomide.com>
>>> Signed-off-by: Sebastian Reichel <sre@kernel.org>
>>> ---
>>> Changes since PATCHv2:
>>>  - Add Acked-by from Tony & Pavel
>>> ---
>>>  include/linux/mfd/motorola-cpcap.h | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
>>> index 793aa695faa0..aefc49cb7ba9 100644
>>> --- a/include/linux/mfd/motorola-cpcap.h
>>> +++ b/include/linux/mfd/motorola-cpcap.h
>>> @@ -14,6 +14,9 @@
>>>   * published by the Free Software Foundation.
>>>   */
>>>  
>>> +#include <linux/device.h>
>>> +#include <linux/regmap.h>
>>> +
>>>  #define CPCAP_VENDOR_ST		0
>>>  #define CPCAP_VENDOR_TI		1
>>
>> Both patches applied to the for-next branch of linux-leds.git, thanks.
> 
> Que?

Ah, sorry, for some reason I silently assumed that Tony gave ack on
your behalf :-) Probably due to lack of your activity in the subject
and Tony's understanding thereof [0].


Can I have your ack for this patch going through LED tree then?


[0] https://lkml.org/lkml/2017/3/23/413

-- 
Best regards,
Jacek Anaszewski
