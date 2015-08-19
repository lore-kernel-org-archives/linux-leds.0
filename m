From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v8 3/3] leds/powernv: Add driver for PowerNV platform
Date: Wed, 19 Aug 2015 17:36:27 +0530
Message-ID: <55D47143.5040908@linux.vnet.ibm.com>
References: <1437801670-23705-1-git-send-email-hegdevasant@linux.vnet.ibm.com> <1437801670-23705-4-git-send-email-hegdevasant@linux.vnet.ibm.com> <55B5540B.1000301@gmail.com> <55B5A853.3080909@linux.vnet.ibm.com> <55B5FEDD.2000506@gmail.com> <55B7865E.8000402@linux.vnet.ibm.com> <55B7BEA8.7080107@gmail.com> <55D46E5B.20203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:55211 "EHLO
	e23smtp03.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751920AbbHSMHe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 08:07:34 -0400
Received: from /spool/local
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 19 Aug 2015 22:07:32 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 2126E2BB005A
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 22:07:28 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t7JC7JKB48890010
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 22:07:28 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t7JC6sET011180
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 22:06:55 +1000
In-Reply-To: <55D46E5B.20203@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, rpurdie@rpsys.net, cooloney@gmail.com, khandual@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, stewart@linux.vnet.ibm.com, benh@kernel.crashing.org

On 08/19/2015 05:24 PM, Jacek Anaszewski wrote:
> Hi Vasant,
> 
> On 07/28/2015 07:40 PM, Jacek Anaszewski wrote:
>> Vasant,
>>
>>>
>>>>
>>>> Without my core changes your driver won't work with led triggers, but
>>>> AFAIR this use case is not relevant for your LEDs? Eventually, we could
>>>> produce a patch set adding support for LED triggers if it will be clear
>>>> that LED core changes will not be merged in the upcoming merge window.
>>>
>>> IIUC current LED code doesn't allow me to sleep (without driver specific
>>> workqueue). And powernv_led_set() call will sleep. Hence I think it
>>> won't work.
>>>
>>> I did a quick test without your patch. It doesn't seems to be working.
> 

Jacek,

> Does brightness setting work properly without work queue?
> 

Sorry ...  I forgot to respond to this thread..

Yes.. It worked for me..

I have tested v9 with and without your code patchset.. In both cases its working
fine..

Sample test case :
	[root@tul176p1 leds]# cd U78C9.001.RST0027-P1-C14:identify
	
	[root@tul176p1 U78C9.001.RST0027-P1-C14:identify]# pwd
	/sys/class/leds/U78C9.001.RST0027-P1-C14:identify
	
	[root@tul176p1 U78C9.001.RST0027-P1-C14:identify]# cat brightness
	0
	
	[root@tul176p1 U78C9.001.RST0027-P1-C14:identify]# echo 1 > brightness
	[root@tul176p1 U78C9.001.RST0027-P1-C14:identify]# cat brightness
	255

-Vasant
