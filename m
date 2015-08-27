From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [v2] powerpc/configs: Enable LEDS support
Date: Thu, 27 Aug 2015 17:12:29 +0530
Message-ID: <55DEF7A5.6070407@linux.vnet.ibm.com>
References: <20150827102619.BEB9214018C@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:58645 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919AbbH0Ln0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Aug 2015 07:43:26 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Thu, 27 Aug 2015 21:43:23 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 67DE82BB004D
	for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2015 21:43:21 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t7RBhEAS58654910
	for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2015 21:43:22 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t7RBgmac028600
	for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2015 21:42:48 +1000
In-Reply-To: <20150827102619.BEB9214018C@ozlabs.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: j.anaszewski@samsung.com, linux-leds@vger.kernel.org, Stewart Smith <stewart@linux.vnet.ibm.com>

On 08/27/2015 03:56 PM, Michael Ellerman wrote:
> On Thu, 2015-27-08 at 06:04:10 UTC, Vasant Hegde wrote:
>> Commit 84ad6e5c added LEDS support for PowerNV platform. Lets
>> update ppc64_defconfig to pick LEDS driver.
>>
>> PowerNV LEDS driver looks for "/ibm,opal/leds" node in device
>> tree and loads if this node exists. Hence added it as 'm'.
>>
>> Also note that powernv LEDS driver needs NEW_LEDS and LEDS_CLASS
>> as well. Hence added them to config file.
>>
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
>> Cc: Stewart Smith <stewart@linux.vnet.ibm.com>
>> ---
>> Changes in v2:
>>   - As suggested by Stewart updated patch description
>>
>> Michael,
>>   This is PowerNV specific config. Hence I've not updated pseries_defconfig.
>>   Let me know if you want me to update pseries_defconfig config as well.
> 
> I've added it to pseries_defconfig also, no need to resend.

Thanks!

-Vasant
