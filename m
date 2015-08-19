From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [v8,3/3] leds/powernv: Add driver for PowerNV platform
Date: Wed, 19 Aug 2015 14:12:27 +0530
Message-ID: <55D44173.9020700@linux.vnet.ibm.com>
References: <20150818102136.0C9DD1402B5@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:57776 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783AbbHSInG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 04:43:06 -0400
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 19 Aug 2015 14:13:03 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 7D352E005A
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 14:12:20 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t7J8gSPF17367222
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 14:12:29 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t7J8gRhZ007212
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 14:12:28 +0530
In-Reply-To: <20150818102136.0C9DD1402B5@ozlabs.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, j.anaszewski@samsung.com
Cc: stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

On 08/18/2015 03:51 PM, Michael Ellerman wrote:
> On Sat, 2015-25-07 at 05:21:10 UTC, Vasant Hegde wrote:
>> This patch implements LED driver for PowerNV platform using the existing
>> generic LED class framework.
>>
>> PowerNV platform has below type of LEDs:
>>   - System attention
>>       Indicates there is a problem with the system that needs attention.
>>   - Identify
>>       Helps the user locate/identify a particular FRU or resource in the
>>       system.
>>   - Fault
>>       Indicates there is a problem with the FRU or resource at the
>>       location with which the indicator is associated.
> 
> Hi Vasant,
> 
> I'm waiting for a respin of this based on the discussion between you and
> Jackek.
> 
> If I don't see it soon it will miss v4.3.

Michael,

I'll post v9 in a day or two.

-Vasant
