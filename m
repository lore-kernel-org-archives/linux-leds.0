From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] leds/powernv: Add driver for PowerNV platform
Date: Wed, 15 Apr 2015 11:50:22 -0700
Message-ID: <m3zj69ql8x.fsf@oc8180480414.ibm.com>
References: <20150320105921.14866.83209.stgit@localhost.localdomain> <20150320110328.14866.98225.stgit@localhost.localdomain> <552D303A.5080506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e7.ny.us.ibm.com ([32.97.182.137]:54743 "EHLO e7.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752040AbbDOS4c (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 15 Apr 2015 14:56:32 -0400
Received: from /spool/local
	by e7.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <stewart@linux.vnet.ibm.com>;
	Wed, 15 Apr 2015 14:56:31 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 7208238C804A
	for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2015 14:56:29 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3FIuTed57147508
	for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2015 18:56:29 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3FIuSF3029931
	for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2015 14:56:28 -0400
In-Reply-To: <552D303A.5080506@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

Jacek Anaszewski <j.anaszewski@samsung.com> writes:
>> +static struct platform_driver powernv_led_driver = {
>> +	.probe	= powernv_led_probe,
>> +	.remove = powernv_led_remove,
>> +	.driver = {
>> +		.name = "powernv-led-driver",
>> +		.owner = THIS_MODULE,
>> +		.of_match_table = powernv_led_match,
>
> Is somewhere DT documentation available for these leds?

https://github.com/open-power/skiboot/blob/master/doc/device-tree/ibm%2Copal/led.txt

We've been documenting things in firmware source, and I'm open to if we
should mirror this somewhere (somewhere in linux Documentation/ ?).

If we duplicate everything, we shouldn't let things get out of date.

FWIW I won't merge code that changes device tree that skiboot emits
without associated documentation.
