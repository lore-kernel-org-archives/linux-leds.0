From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Wed, 22 Apr 2015 09:03:36 +1000
Message-ID: <m3sibtozhz.fsf@oc8180480414.ibm.com>
References: <20150320105921.14866.83209.stgit@localhost.localdomain> <20150320110328.14866.98225.stgit@localhost.localdomain> <552D303A.5080506@samsung.com> <m3zj69ql8x.fsf@oc8180480414.ibm.com> <552F437E.4020409@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:42353 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964934AbbDUXDo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 21 Apr 2015 19:03:44 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <stewart@linux.vnet.ibm.com>;
	Tue, 21 Apr 2015 17:03:43 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id C1890C9003E
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2015 18:54:48 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3LN3daG65536154
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2015 23:03:39 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3LN3cNs027265
	for <linux-leds@vger.kernel.org>; Tue, 21 Apr 2015 19:03:39 -0400
In-Reply-To: <552F437E.4020409@linux.vnet.ibm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: mpe@ellerman.id.au
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
> On 04/16/2015 12:20 AM, Stewart Smith wrote:
>> Jacek Anaszewski <j.anaszewski@samsung.com> writes:
>>>> +static struct platform_driver powernv_led_driver = {
>>>> +	.probe	= powernv_led_probe,
>>>> +	.remove = powernv_led_remove,
>>>> +	.driver = {
>>>> +		.name = "powernv-led-driver",
>>>> +		.owner = THIS_MODULE,
>>>> +		.of_match_table = powernv_led_match,
>>>
>>> Is somewhere DT documentation available for these leds?
>> 
>> https://github.com/open-power/skiboot/blob/master/doc/device-tree/ibm%2Copal/led.txt
>> 
>> We've been documenting things in firmware source, and I'm open to if we
>> should mirror this somewhere (somewhere in linux Documentation/ ?).
>
> Stewart,
>
> I'm adding Documentation/devicetree/bindings/leds/leds-powernv.txt ...which is
> pretty much similar to the device tree documentation we have in OPAL side.

Michael,

I know we've kind of discussed this in the past, but perhaps we should
come up with a conistent way of doing this for OPAL related docs.
