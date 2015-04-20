From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Mon, 20 Apr 2015 13:45:29 +0200
Message-ID: <5534E6D9.6060804@samsung.com>
References: <20150320105921.14866.83209.stgit@localhost.localdomain>
 <20150320110328.14866.98225.stgit@localhost.localdomain>
 <552D303A.5080506@samsung.com> <552E049D.2030604@linux.vnet.ibm.com>
 <552E2480.9060102@samsung.com> <552E3A56.8030300@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16274 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754734AbbDTLpd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 07:45:33 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NN3008GHSVK9Z00@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 20 Apr 2015 12:50:08 +0100 (BST)
In-reply-to: <552E3A56.8030300@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, stewart@linux.vnet.ibm.com, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

Hi Vasant,

I'd like to clarify some details regarding your explanation.

On 04/15/2015 12:15 PM, Vasant Hegde wrote:
[...]
>>>
>>> In Power Systems LEDs are overloaded (meaning same LED is used for identify and
>>> fault depending on their state  ---  blinking = identify and solid = fault).
>>> Hence here append LED type info.
>>
>> The label could be composed of segments and an ordinal number as
>> labels have to be unique, e.g. attn_ident_0, attn_ident_1.
>> The segments would have to be parsed by the driver to discover
>> all the LED's available modes.
>>
>> nitpicking: identify is a verb and is not a proper name for the LED.
>> Could you describe the purpose of this mode, so that we could come
>> up with a better name?
>
> Each component (Field Replacement Unit) will have service indicator (LEDS) which
> can have below states :
>    - OFF 	: no action
>    - Identify: blinking state (user can use this state to identify particular
> component).
>         In Power Systems world we call it as "identify" indicator.. Hence I
> retained same name here.
>         How about just "ident" ?
>    - fault : solid state (when component goes bad, LED goes to solid state)
>       Note that our FW is capable of isolating some of the issues and it can turn
> on LEDs without OS
>        interference.
>
> We have one more System level LED (System Attention Indicator).. This LED has
> two states:
>    - OFF : Everything is fine
>    - ON : Some component has issues and needs attention.

We have three modes:
- identify		- blinking
- fault			- solid
- attention indicator	- solid

How does LED operation differ for fault and attention modes?
Does a LED have different intensity?

I'd rather avoid creating separate LED class devices for each mode.

For blinking we could use existing timer trigger.

-- 
Best Regards,
Jacek Anaszewski
