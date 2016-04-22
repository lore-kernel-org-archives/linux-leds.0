From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCH 5/6] leds: pca963x: Inform the output that it is inverted
Date: Fri, 22 Apr 2016 14:38:56 +0200
Message-ID: <571A1B60.3020804@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <1461051650-18824-6-git-send-email-oliver@schinagl.nl>
 <20160421150750.GA3116@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:40446 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751096AbcDVMjO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 22 Apr 2016 08:39:14 -0400
In-Reply-To: <20160421150750.GA3116@rob-hp-laptop>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hey Rob,

On 21-04-16 17:07, Rob Herring wrote:
> On Tue, Apr 19, 2016 at 09:40:49AM +0200, Olliver Schinagl wrote:
>> When leds are connected in a totem-pole configuration, they can be
>> connected either in a active-high, or active-low manor. The driver
>> currently always assumes active-high. This patch adds the
>> 'nxp,inverted-out' boolean property to tell the driver that the leds
>> are driven active-low, or rather, that the behavior is inverted to what
>> is normally expected.
> How do I know what is normally expected?
fair point, and in fact, you don't. The text is bad here.
>
>> Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
>> ---
>>   Documentation/devicetree/bindings/leds/pca963x.txt |  1 +
>>   drivers/leds/leds-pca963x.c                        | 20 +++++++++++++-------
>>   include/linux/platform_data/leds-pca963x.h         |  1 +
>>   3 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
>> index dafbe99..7b23725 100644
>> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
>> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
>> @@ -6,6 +6,7 @@ Required properties:
>>   Optional properties:
>>   - nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
>>     to open-drain, newer chips to totem pole)
>> +  nxp,inverted-out: the connected leds are active-low, default to active-high
> Just state what mode you want: nxp,active-low
But that's not what happens, which is why my text is bad :) It depends 
on how the board is wired and if it is push-pull or open-drain. Though 
this goes beyond my electronics knowledge. So I'll reduce the text to 
say exactly what we mean, inverted output (or not).

Unless you can explain that it would be unrelated and it is actually 
active-high/low. I'll be more than happy to oblige.

Olliver
>
> Rob
