From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Mon, 27 Apr 2015 13:15:09 +0200
Message-ID: <553E1A3D.2030208@samsung.com>
References: <20150422234509.626d9dc7@ja.home>
 <55388254.4000606@linux.vnet.ibm.com> <20150423161342.55e9ac8f@ja.home>
 <5539D501.3040601@linux.vnet.ibm.com> <20150424121549.27b74b25@ja.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40687 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752671AbbD0LPN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2015 07:15:13 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNG002YRPXB1J60@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 27 Apr 2015 12:15:11 +0100 (BST)
In-reply-to: <20150424121549.27b74b25@ja.home>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: Jacek Anaszewski <j.anaszewski81@gmail.com>, stewart@linux.vnet.ibm.com, cooloney@gmail.com, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, khandual@linux.vnet.ibm.com

Hi Vasant,

On 04/24/2015 12:15 PM, Jacek Anaszewski wrote:
[...]
>>> For attention and fault LEDs only brightness attribute would matter.
>>>
>>
>> Sure.
>>
>>> DT bindings would look as follows:
>>>
>>> opal-leds {
>>>          compatible = "ibm,opal-leds";
>>>
>>>          U78C9.001.RST0027-P1-C1:fault {
>>>          };
>>>
>>>          U78C9.001.RST0027-P1-C1:indent {
>>>          };
>>>
>>>          U78C9.001.RST0027-P2-C1:attn
>>>          };
>>>      }
>>> }
>>>
>>
>> As mentioned earlier DT is coming from our firmware. For now I will
>> respin another round of patches by using led-types property and run
>> it through DT experts (DT mailing list). If they insist this method
>> is better than what I already have , then will work with my firmware
>> folks to see what we can do better.
>
> Please hold on with sending the patches until we clarify all the
> DT related issues. Having full picture will help to adjust the
> bindings better to LED common bindings specification.
>

Please send the next version adjusted to your platform needs.
Since I've found out that only powerpc maintainers will have to
ack DT patch, you can avoid adding devicetree list on cc.

-- 
Best Regards,
Jacek Anaszewski
