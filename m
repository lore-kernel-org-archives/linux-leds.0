From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Mon, 27 Apr 2015 13:15:49 +0200
Message-ID: <553E1A65.5080409@samsung.com>
References: <20150422234509.626d9dc7@ja.home>
 <55388254.4000606@linux.vnet.ibm.com> <20150423161342.55e9ac8f@ja.home>
 <1430086038.16571.78.camel@kernel.crashing.org> <553DE41A.5070703@samsung.com>
 <1430128435.16571.110.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40730 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752671AbbD0LPv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2015 07:15:51 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NNG002ZCPYE1J60@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 27 Apr 2015 12:15:50 +0100 (BST)
In-reply-to: <1430128435.16571.110.camel@kernel.crashing.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: stewart@linux.vnet.ibm.com, cooloney@gmail.com, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, rpurdie@rpsys.net, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, khandual@linux.vnet.ibm.com

On 04/27/2015 11:53 AM, Benjamin Herrenschmidt wrote:
> On Mon, 2015-04-27 at 09:24 +0200, Jacek Anaszewski wrote:
>> I was not aware that some other entity than the driver could be
>> interested in the information provided by DT node. I will no longer
>> object, provided that we will get an ack from DT maintainer.
>
> My understanding is that we no longer need bindings to be accepted by DT
> maintainers.

I've just skimmed through the patches in
Documentation/devicetree/bindings/powerpc and they indeed don't have
acks from DT maintainers.

> That being said, I would like to review this one before it is accepted,
> as I haven't had a chance to do so yet :-) (I was mostly responding to
> you, I haven't caught up with the full thread yet).
>
> Please wait for an ack from myself or Michael Ellerman (the two powerpc
> maintainers). Either that or provide your ack and we'll merge it via our
> tree if we are happy with it.

Since this driver is for LED subsystem it should better go via leds tree.

-- 
Best Regards,
Jacek Anaszewski
