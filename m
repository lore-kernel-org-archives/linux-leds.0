From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Thu, 16 Apr 2015 10:37:10 +0530
Message-ID: <552F437E.4020409@linux.vnet.ibm.com>
References: <20150320105921.14866.83209.stgit@localhost.localdomain> <20150320110328.14866.98225.stgit@localhost.localdomain> <552D303A.5080506@samsung.com> <m3zj69ql8x.fsf@oc8180480414.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:60806 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952AbbDPFII (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 16 Apr 2015 01:08:08 -0400
Received: from /spool/local
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Thu, 16 Apr 2015 15:08:06 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 85AAD2BB0051
	for <linux-leds@vger.kernel.org>; Thu, 16 Apr 2015 15:08:02 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3G57so842008678
	for <linux-leds@vger.kernel.org>; Thu, 16 Apr 2015 15:08:02 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3G57Swi020694
	for <linux-leds@vger.kernel.org>; Thu, 16 Apr 2015 15:07:28 +1000
In-Reply-To: <m3zj69ql8x.fsf@oc8180480414.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stewart Smith <stewart@linux.vnet.ibm.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

On 04/16/2015 12:20 AM, Stewart Smith wrote:
> Jacek Anaszewski <j.anaszewski@samsung.com> writes:
>>> +static struct platform_driver powernv_led_driver = {
>>> +	.probe	= powernv_led_probe,
>>> +	.remove = powernv_led_remove,
>>> +	.driver = {
>>> +		.name = "powernv-led-driver",
>>> +		.owner = THIS_MODULE,
>>> +		.of_match_table = powernv_led_match,
>>
>> Is somewhere DT documentation available for these leds?
> 
> https://github.com/open-power/skiboot/blob/master/doc/device-tree/ibm%2Copal/led.txt
> 
> We've been documenting things in firmware source, and I'm open to if we
> should mirror this somewhere (somewhere in linux Documentation/ ?).

Stewart,

I'm adding Documentation/devicetree/bindings/leds/leds-powernv.txt ...which is
pretty much similar to the device tree documentation we have in OPAL side.

> 
> If we duplicate everything, we shouldn't let things get out of date.

-Vasant
